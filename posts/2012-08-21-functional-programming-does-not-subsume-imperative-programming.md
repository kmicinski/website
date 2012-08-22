--
title: Functional programming does *not* subsume imperative programming.
tags: pl,monads,functional,imperative
--

Bob Harper always has interesting articles on his personal blog, his
most recent one is about CMU's new [introductory
curriculum](http://existentialtype.wordpress.com/2012/08/17/intro-curriculum-update/).
His post details many interesting developments into how their new
course organization will help do many things, including:

- Dumping the long standing and overdone courses that indoctrinate
  freshmen into an "object oriented is everything" mindset.  While
  there is [a good amount of academic material on object
  orientation](http://www.amazon.com/Theory-Objects-Monographs-Computer-Science/dp/0387947752),
  most intro courses seem to box freshman into a cookie cutter
  mentality of categorizing everything in the world as an object, but
  Bob's post notes that typically programming using large frameworks
  and object orientation leaves students doing "something" without
  really understanding how it works.

- Revamping the coursework so that students would face more
  fundamental issues in computing rather than the traditional
  "programming" views they might have picked up in high school.  One
  interesting thing about this is that it "levels the playing field"
  for kids who might come from non programming backgrounds.  An
  interesting consequence is that people who are typically less
  encouraged into computing from a younger age (i.e., women) will
  (*hopefully!*) feel less pressured by other students.

However, Bob's post does have one thing that I sort of both agree and
disagree with:

> For the sake of those readers who may not be up to date on such
> topics, it seems important to emphasize that functional programming
> subsumes imperative programming

At some level, I really love this comment, but one another level, I
think it's entirely misguided with respect to *teaching*.  First of
all, I should say that I *do* agree that "one hundred level" freshmen
courses in computer science tend to be horribly organized and more
about pattern matching on bits of Java code than I'd like.  Most of
these courses purport to give students a bunch of code, have them
think about carefully analyze what it's doing, and extrapolate from
that solution to build a larger piece of something.  Unfortunately,
what I generally see happening is people throwing up large pieces of
Java code, and having students try to pattern match on the *syntax*.
Instead, what we really need to teach people is that the *semantics*
is the thing that matters most!

I love Bob's quote because it really highlights this point!  If we
could teach one thing to younger students, it would be that ---
although we necessarily have to teach you one introductory language
--- our goal is to have you extrapolate from that the semantics.  What
is semantics?  Well, that's sort of a sticky part.  If you take an
[old school approach to
semantics](http://www.amazon.com/Denotational-Semantics-Scott-Strachey-Approach-Programming/dp/0262690764),
you wind up with interpreting computer programs in some mathematical
domain.  So why don't we teach this to freshmen?

- Semantics --- even the more comprehensible and intuitive step based
  semantics --- is just plain hard.

- If you're trying to retain / bootstrap a freshmen class of students,
  throwing the math at them might not be as enticing.

- Actually being able to have a program you can play with and run
  gives people the kind of "video game" like experience.

- Most freshmen just don't know that much math.  Few high schools
  teach with a proof based foundation for discrete math, and most
  students think "math" is *calculus*!  (In reality, I would suspect
  that the vast majority of what *I* call computer science has little
  of this at its foundation.)

So basically, we want to keep freshmen enticed, long enough for them
to get past the stage where there's the scary math, have them write
some cute programs, and get the "cool" experience.  After we've hooked
them, we tell them the cool stories.

Now, semantics *should* tell us that functional programming subsumes
imperative programming, and indeed it does.  *However*, FP does *not*
subsume imperative programming from a teaching standpoint.  Why?
Because, while it's easy enough to relate FP and imperative
programming at a basic level, it's much harder to do it at a practical
level.  What do I mean by a "basic" level?  I mean, take the lambda
calculus and the ever popular "Imp" language.  These are two languages
that have relatively simple semantics, and we can reduce them both to
"sort of" the same behavior, or model one in the other. (For "Imp,"
you take the classical semantic desugarings, typically a monadic
store.  To go from lambda to Imp, write an interpreter or abstract
machine.)  But *we're not teaching people Imp!* In reality, any
imperatively trained student --- even one coming out of a Java 101
background --- will think about modeling programs / computation by way
of complex heap models!  In fact, I believe the most common question
asked by incoming FPers is "okay, so how do I make a hash table?
Wait, what, I have to use a tree / something impure / something very
complex?"  In reality, we *can* model the more interesting imperative
features of languages like Java, but it's quite hard.  The typical way
(of which I'm aware) is to stick heap assertions (by way of separation
logic) into polymonadic binds.  (The best working example I've seen of
this is in the [Ynot](http://ynot.cs.harvard.edu/) project.)  But
generally what you learn after trying to model imperative things in
pure languages is: avoid it, as much as possible.  (Even Ynot sort of
does this, you generally define a functional representation of an
object with which you reason about structures, and then prove the
lower level implementation respects this set of assertions.)

So what makes languages like Java and C++ so cool for freshmen, but
bad for proving?  It turns out that they have a *mostly* intuitive
model of imperative state.  Once you get the "feel" for the language,
you can generally feel out the semantics.  However, there are always
troubling points!  (For example, strange aliasing and obligations
within APIs, not really specified in C, but addressed by fancier
systems with regions, etc..)  When you try to get complete soundness,
it turns out that most things are horribly unsafe, but a social aspect
in learning the language (in fact, the most important part of learning
a language, it seems!) is to learn the "idioms" by which to avoid the
krufty parts.  Occasionally, it seems the semantics of the language is
not really expressive enough to do what you need.  Pretty much all
general purpose languages (except the Turing incomplete proof
langauges!) are "turing complete."  At first, this seems like argument
to say that you can do anything in any language.  In practice, it
generally means that you have to do something really unsafe or hacky
to get things to work.  (Example, the visitor pattern in object
oriented languages to abstract higher order traversal by instantiating
possible higher order control flows through a data structure, which
tends to be even more yucky as you accumulate state implicitly
dependent on traversal order!)

In summary, it's great to be able to find programmers who can handle
the ideas at the core of computer science, and starting freshmen in
the program thinking that way should be an interesting experiment, but
I'm a little hesitant to say that all of the interesting (and
intuitively simple) semantics of languages with elaborate heap models
can be subsumed by functional programs.  As much as I really believe
in and love functional programming, the devil is in trying to make
expressive and blaringly fast programs.  (Full disclosure: I still
don't write zippy functional code, or grok the cute functional data
structures.)

