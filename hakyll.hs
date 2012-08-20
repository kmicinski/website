{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (id)
import Control.Category (id)
import Control.Arrow (arr, (&&&), (>>>), (***), (<<^), returnA)
import Data.Monoid (mempty, mconcat)
import qualified Data.Map as M
import qualified Text.Blaze.Html5.Attributes as A
import Data.List (intersperse, intercalate, sortBy)
import Data.Maybe (catMaybes, fromMaybe)
import Text.Blaze.Html.Renderer.String (renderHtml)
import Text.Blaze.Html ((!), toHtml, toValue)
import Text.Blaze (ToMarkup)
import qualified Text.Blaze.Html5 as H

import Hakyll

main :: IO ()
main = hakyll $ do
    -- Compress CSS
    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    -- Javascript
    match "js/*" $ do
      route idRoute
      compile copyFileCompiler
    
    -- Images
    match "img/*" $ do
      route idRoute
      compile copyFileCompiler
    
    -- Each post
    match "posts/*" $ do
      route   $ setExtension ".html"
      compile $ pageCompiler
        >>> arr (renderDateField "date" "%B %e, %Y" "Date unknown")
        >>> myRenderTagsField "prettytags" (fromCapture "tags/*")
        >>> applyTemplateCompiler "templates/blog.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler
      
    -- Create main blog page
    match "posts.html" $ route idRoute
    create "posts.html" $ constA mempty
        >>> arr (setField "title" "Kris' collected thoughts")
        >>> requireAllA "posts/*" addPostList
        >>> applyTemplateCompiler "templates/blog_contents.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler
        
    -- Create tags
    create "tags" $
      requireAll "posts/*" (\_ ps -> readTags ps :: Tags String)

    
    -- Add a tag list compiler for every tag
    match "tags/*" $ route $ setExtension ".html"
    metaCompile $ require_ "tags"
      >>> arr tagsMap
      >>> arr (map (\(t, p) -> (tagIdentifier t, makeTagList t p)))
    
    -- Create the static-ish pages
    match (list ["index.html", "bio.html", "papers.html", "programming.html"]) $ do
      route idRoute
      compile $ readPageCompiler
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler
    
    -- Render RSS feed
    match "rss.xml" $ route idRoute
    create "rss.xml" $
        requireAll_ "posts/*"
            >>> mapCompiler (arr $ copyBodyToField "description")
            >>> renderRss feedConfiguration

    -- Read templates
    match "templates/*" $ compile templateCompiler
    
  where
    tagIdentifier :: String -> Identifier (Page String)    
    tagIdentifier = fromCapture "tags/*"

-- 
-- Add a post to the list of posts
--
addPostList :: Compiler (Page String, [Page String]) (Page String)
addPostList = setFieldA "posts" $
    arr (reverse . chronological)
        >>> require "templates/blog_item_line.html" (\p t -> map (applyTemplate t) p)
        >>> arr mconcat
        >>> arr pageBody
        

makeTagList :: String
            -> [Page String]
            -> Compiler () (Page String)
makeTagList tag posts =
  constA (mempty, posts)
  >>> addPostList
  >>> arr (setField "tag" tag)
  >>> arr (setField "title" ("Posts tagged: " ++ tag))
  >>> applyTemplateCompiler "templates/blog_tag_contents.html"
  >>> applyTemplateCompiler "templates/default.html"
  >>> relativizeUrlsCompiler

-- 
-- Small hack on field rendering in Hakyll to support cool fields
-- 
myRenderTagsFieldWith :: (Page a -> [String])        -- ^ Function to get the tags
                    -> String                      -- ^ Destination key
                    -> (String -> Identifier a)    -- ^ Create a link for a tag
                    -> Compiler (Page a) (Page a)  -- ^ Resulting compiler
myRenderTagsFieldWith tags destination makeUrl =
      id &&& arr tags >>> setFieldA destination renderTags'
        where
          -- Compiler creating a comma-separated HTML string for a list of tags
          renderTags' :: Compiler [String] String
          renderTags' =   arr (map $ id &&& makeUrl)
                          >>> mapCompiler (id *** getRouteFor)
                          >>> arr (map $ uncurry renderLink)
                          >>> arr (renderHtml . mconcat . intersperse ", " . catMaybes)
          -- Render one tag link
          renderLink _   Nothing         = Nothing
          renderLink tag (Just filePath) = Just $
            H.a ! A.href (toValue $ toUrl filePath) $ H.span ! A.class_ "tag" $ toHtml tag

-- 
-- | Render tags with links
--
myRenderTagsField :: String                      -- ^ Destination key
                -> (String -> Identifier a)    -- ^ Create a link for a tag
                -> Compiler (Page a) (Page a)  -- ^ Resulting compiler
myRenderTagsField = myRenderTagsFieldWith getTags
                    where
                      getTags :: Page a -> [String]
                      getTags = map trim . splitAll "," . getField "tags"

feedConfiguration :: FeedConfiguration
feedConfiguration = FeedConfiguration
    { feedTitle       = "Kris Micinski's Blog."
    , feedDescription = "A collection of random thoughts on lambda from Kris."
    , feedAuthorName  = "Kristopher Micinski"
    , feedAuthorEmail = "krismicinski@gmail.com"
    , feedRoot        = "http://www.cs.umd.edu/~micinski/"
    }
