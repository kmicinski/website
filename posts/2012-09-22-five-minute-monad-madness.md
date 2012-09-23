--
title: Five Minute Monad Madness!!!
tags: monads,functional_programming,haskell
--

Purely functional programming gives us a certain sense of mathematical
completeness.  Programming with functions gives us a very high level
of expressiveness, along with an enhanced view of safety.  When you
don't have any state underlying you, you can program in a much more
compositional style: you don't have to worry about as much context.
However, it's not immediately obvious how you can encode stateful
operations within purely functional languages.  This starts to become
a problem when we start to interface our functional languages with the
"real world," which typically involves stateful objects (the infamous
"fire missiles" example: once you fire the missiles, they're gone, you
can't fire them again, and you can't reset the state of the world).

Initially, the way to deal with this was to basically say: "hey, okay,
so state exists, but we're just not going to use very much of it in
our code, and we'll probably be okay forgetting about it *most* of the
time."  (This was the approach taken by ML, for example, and while
*some* ML uses a good number of references, much does not --- or at
least presents a purely functional interface to the impure code.)
However, the question of how to reconcile the seemingly stateful world
with our purely functional upbringings started nagging on the
community more and more.  A variety of solutions were posited to the
community (for example, ["Linear Types Can Change the
World!"](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.5002)),
but none seemed to catch on until...

[_Monads_](http://en.wikipedia.org/wiki/Monad_(functional_programming)).
It's a complicated sounding word, expressing a simple-ish concept.
Eventually, monads were settled upon by the purely functional
(Haskell) community as *the way* you did stateful feeling things
inside a purely functional framework.  In reality, you can do much
more, as the definition of monads is high level and really doesn't
specify all that much: you can chain things together, need some
identities, and some composition laws hold. (I remember the quote "to
say something about a category is really to say very little at all..."
from somewhere, does anyone remember?)

If you haven't read the second sentence of *every monad tutorial ever*
"monads come from a category theory."  This is such a canned sentence,
it's almost infamous among the purely functional web community.  I
feel like I could walk into bars with my suave not-quite-shaven look,
order an old fashioned, walk up a cool looking group of people, and
say "yeah, you know, monads come from category theory."  To me, this
line basically conveys:

> I have no idea what category theory is.  It sounds really hard, I
> did a Google image search on it, and I found all these huge Pi
> symbols with arrows going to them and stuff.  But it seems like
> everyone suddenly *gets* monads are by saying they come from
> category theory, it hasn't helped me yet, but I would be remiss not
> to mention this in my tutorial, because I *totally* read a few pages
> of Mac Lane's book before bed every night, right after having a cup
> of my fancy red wine and posting some snarky remarks about left
> adjoints, primitive recursive functions, and catamorphisms on
> #haskell.

[You can even buy the
T-shirt!](http://haskell.spreadshirt.com/i-m-not-a-category-theorist-A6502231)

It seems like nobody truly *gets* monads until they write a monad
tutorial.  In fact, given by the number of monad tutorials on the web,
I must only conclude that this is the best monad tutorial in history:

> Step one: write a monad tutorial.

So I'm telling *you* to do that!  That's right!  But I've got a few
rules for you!

- Make your tutorial five minutes or less.

- Do whatever you see fit to get the main point of monads across to
  your audience.  (*Don't* take your clothes off and flip them inside
  out, *unless* you're going to describe monads by proxy of the `Cont`
  monad and continuations.)

- Don't use any slides, unless they contain animations.  Basically,
  you can use a whiteboard, and if you don't want to show your snazzy
  khaki pants and sweater vest waving your hands across a slightly
  hazy whiteboard (just erased from your trying to figure out what the
  hell homotopy type theory is all about), I can forgive you for
  instead making an animation.

- (If you really want to use slides to show formulas and pictures
  things, you can, but I feel like having a bunch of bullet points and
  speech really kills the mood.  But hey, prove me wrong.)

I want to make a small meta comment: I'm not writing this because I'm
implying that I have a great five minute monad speech: *I don't*!  I'm
writing this because I think it will be very hard to get across the
main point of monads in a very short interval, and I think that most
of the tutorials out there on the web are instances of people half
understanding the main point, writing up a bunch of stuff, and putting
it on their blog.  (But hey, that's probably me right now, too, so you
can't feel too bad.)

Some points:

- I don't think monads are the hard part about learning monads!  I
  think it's that using monads forces you to really grapple with
  higher order behavior in a very direct way. Monads can be used to
  create very elaborate higher order control structures, and figuring
  these out really gives you a run for your money.

- I say that monads let you chain things together and hide stuff off
  to the side.  Obviously that's a vast trivialization and not quite
  right, but that's why I'm not saying I have a good five minute monad
  speech yet.

- I heard a very good quote about monads from [Mike
  Hicks](http://www.cs.umd.edu/~mwh/): "Monads are just an API..."

- By the way, when you finish your five minute monad madness tutorial,
  please *send me a link to it!* I would like to post it here!  My
  email address is the obvious one for the name that's not my first.

- Eventually I have the idea to get a session at an FP workshop where
  people can give these...

Love the lambda!

-- Kris Micinski
