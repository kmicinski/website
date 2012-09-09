--
title: Don't be so quick to formalize things
tags: formalizations,android
--

Most of the time the things we dislike most in other people are really
flaws that we realize (perhaps subconsciously) in ourselves.  Over the
past few months, I've played with some relatively industrial codebases
for Android security research.  I've noticed a somewhat understandable
trend among people who write papers over these topics: they're very
quick to give a formalization to what they're doing, but little
evidence as to why their formalization means anything!  This is
somewhat scarily ironic: we give these formalisms and then *give no
basis for why they should be correct*.  This is somewhat backwards: in
the olden days of math, we wrote down some axioms, inference rules,
and then used that to do some proofs, but I argue that this is a bad
idea for doing systems research.

Why?  This much is clear?

> Math is *small*, systems are *large*.

Math is pretty, it's regraded in society as being a very good thing to
have pretty theorems.  It's succinct, it's clear, it's unambiguous.
This is *not* how systems work.  I'll be concrete: we've been working
in Android security and system modeling for the past year or so.  As
such, I typically read quite a few papers on this topic, each paper
has a different formalization for how some part of the platform works.
 But it's *just not correct*.  You can't take a large API, with tons
of edge cases, intricate behavior, and systems-y properties, and
regard it as an instance of some linear logic or simple process
calculus.

But for some reason, people still fell compelled to give these small
accounts of how their formalization works.  This isn't the same thing
as in math.  In math we're *defining* a large system, in systems we're
*modeling* a large system.  Modeling necessarily incurs approximation.
 Is this to say that formalizations of the system are useless?
Certainly not, but each one will be smaller or larger, and will incur
tradeoffs (computational complexity, parallel implementation details,
security flow properties, etc...) that must be justified to go along
with the model.  [Mike]() had a good way to describe monads (I will
soon write a blog post titled "why you shouldn't write a monad
tutorial"):

> A monad is an API

This describes some very typical behavior in the nasty PL/systems
stepchild community: we use formalizations as an approximations to
system behavior rather than axioms for building the system.  As such,
proofs have now changed roles!  Proofs used to specify the
computational aspects of your system (with the axioms describing the
core aspects of your system): they justify your formalization.  Now,
when you write something that goes something like "we define an
Android permission to be an effect label on a method in..."
(example..), you also need to do a number of proofs that demonstrate
why your formalization, as well as show some bad things that you can't
prove.

Instead of proofs constructing behavior in a system you're building,
your proofs now analyze behavior in an existing system.  Once you've
done enough proofs of the system model, you have satisfied the reader
that you can justify your formalization to build new tools inside that
system.  Formalizations help us because they're smaller than the
entire system, they get at the "essence" of what's going on, but you
have to convince the reader that the essence you're suggesting is
indeed something meaningful, and too many papers leave this knot
untied, blazing on with development of features (static analysis
backends, for example) using formalizations that have little
soundness.

This is an exciting problem in systems research: we need system models
(try doing static analysis without source for the Java standard
library), but those models are boring and uninteresting, read:
unpublishable.  This is logistical hell: people who want to work on
new systems would really like to use a uniform formalization,
otherwise they'll roll their own (like all of the papers are doing)
which (for the problems described above) will probably be wrong, miss
something important, and be generally untrustworthy. There *is* an
interesting meta problem, however: how do we deal with *this* problem?
 How do we automatically construct usable models that we can prove are
"correct?"

So the next time you build a systems model for something complicated,
make sure it's really helpful, and you're not just doing to satisfy
the mathematical itch you get when you've skipped your morning "warm
up proofs."

