--
title: Why is Android security different?
tags: android,security
--

It's 4:30 AM, I can't sleep, and I feel horribly guilty about wasting
so much time this weekend, not writing up notes for my logic class,
and how much sugar was just in that margarita I just made in a last
ditch effort to try to go to sleep (and how I should probably go brush
my teeth!), and how silly I was for leaving my keys at the Ethiopian
restaurant I went to for my friend's birthday tonight.  I love types,
logic, monads, and symbols I can't really draw, but this post is going
to betray that and step into the practical.

With that being said, I wanted to think for a while about why security
on Android is different than on our desktop or laptop computers...

One first thing that sticks out to me is that you maintain a much more
personal relationship with your phone than you do with your computer.
Let me take you back to a scene a year ago, I was an entering grad
student with a horribly disorganized and somewhat depressing life
trying to navigate the battlefield of acquiring "research intersts."
My (very supportive!) advisor Jeff was gracious enough to fly me out
to meet up with our colleagues at UCLA.  We all were supposed to come
up with one reason why security on smartphones was different.  Well,
it was a three hour time difference, and I was being super loopy and
gave this horribly tacky half baked speech about how I felt like I had
a more personal and sensitive connection to my phone than I did my
computer just because of the kinds of information I shared via text
and phone calls.  This long speech was quickly summarized by someone
else at the meeting (with a brilliantly foreign accent) as my "sexy
texts."  I'll be honest: I don't have any such texts on my phone, but
I _do_ feel like we use our phones in a much more personal way than we
do our computers: we talk to our closest friends (or in my case,
really just my parents), and consider it to be the closest level of
connection to our person.

So there's the personal connection we have.  What else?  Well, I think
one thing that's not to be underestimated is the sheer amount of
personal data you're feeding into your phone:

- Just your phone usage pattern reveals quite a bit!  Your sleep
  schedule, and how hastily you use your device can be used to
  "fingerprint" you quite uniquely.

- Many services on phones are based on your location.  Your location
  reveals quite a bit of information, especially when coupled with
  temporal information and information about what app you're using.
  As an example, consider the app which reads the device logs to poll
  the list of open apps, and then sends your significant other
  information revealing that you're using the "pickup lines" app near
  the bar.

- I'm writing a paper on the previous point right now, and will have
  it done within the next two weeks (_or else_!), our story deals with
  how we can deterministically detect how much we can skew inputs to
  apps and still get usable outputs.

- Phone logs are pretty sensitive stuff, along with your personal
  information, could you imagine what the combination of temporal and
  location information would allow?

One thing that scares me (well, let's face it, not really scares me,
because I just plain am not someone who really fears all that much
about my privacy as a consequence of my loudly outspoken and edgy
personality) is the possibiliy to determine your location from another
app's usage, possibly via an implicit flow.

Another thing that is somewhat difficult is just how homogenous
operating systems on phones are.  With desktops you've got Linux,
Windows, Macs, all running hundreds of different browser
configurations, with possibilities of different antivirus software
installed.  All of this means that any _particular_ exploit is going
to work on only a _very small_ percentage of systems!  But if you
write a real exploit for Android -- even just a single version of
Android -- you've got quite an audience.  (This is _somewhat_ less
true if you discover a hole in a vendor non vanilla ROM.., but still
pretty bad.)

This goes further, in desktop systems you store your data all over the
place.  Your financial data will be scattered in an ad hoc format in
an Excel or CSV file in an obscure path on your machine, the list of
your relatives will be scattered throughout your hard drive in emails
strewn all over the place.  You use a multitude of different programs
to archive and manipulate your personal information: word, emacs,
Illustrator, etc..., and it's all organized a slightly different way
because it means something slightly different thing to you.

Not so in Android.  Instead, security through obscurity is replaced by
an organized hierarchy of data accessed through well defined
interfaces.  Sure, the gateways to this information are guarded by the
typical access control lists, permissions, things of that nature, but
what about the _nonstandard_ ways of accessing them?  One could argue
this is the way it should be done: the limited and targeted use case
(as opposed to the general purpose) of orgazining one's contacts and
text messages lends itself to a very simple API.  But because of this
simple API, we've created _one stop shopping_ for our private
information on our devices!

I think that's mostly what I have for now.  Phones are easy to use,
but we also use them in a much more personal way than our computers.
You might say that your phone is sort of the home of your social life
(which is why mine's usually dead and when I need to call someone I
use Google voice), where your ocomputer is yourwork life.  To make the
matter worse, the APIs designed for Android (and I suspect iOS, iirc)
make these systems very attractive targets for attacks.