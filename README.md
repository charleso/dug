dug
===

**WARNING** Just me stuffing around, please don't use this.


## Goals

1. Implement a distributed issue tracker
2. Implement a distributed review tool


## Why?

I suspect the rationale for this tool aren't necessarily strong enough to
really warrant it's existence. However I was recently inspired by the [blog
post from JaneStreet](https://blog.janestreet.com/putting-the-i-back-in-ide-towards-a-github-explorer/)
about their local review tool.

These days I spend as much time reviewing code as I do writing it, and having
a tool that can be used for every project regardless of the team or company
seems like it might pay off if it has enough desirable properties.

I'm starting with issue tracking as I suspect it might be slightly easier than
reviews, but I think the general principals and requirements should hold.


## Requirements

- Two-way syncing ability to at least one other centralised tool (ie. github).

  I don't believe a tool like this can really be used in anger if it doesn't
  support a _very_ reliable two-way synchronisation. I'm not sure how possible
  this actually is in reality, but I'll focus on this first to prove out the
  idea.


## Data Format

TBD.

This largely depends on the storage and distribution mechanism. Using git is
an easy and obvious solution but requires some condition around merging and how
much burder, if any, is placed on the user.

1. Snapshot

  Store files in human-readable, text-based files. This will require dig to
  be aware of, and potentially handle, merge conflicts.

2. Event

  In theory to avoid any merge conflicts we could store immutable events in
  files which in turn are stored as immutable blobs. Using the dug cli is now
  essential and debugging becomes much harder.


## References

- http://syncwith.us/sd/
- https://github.com/dspinellis/git-issue
- https://github.com/google/git-appraise
- https://blog.janestreet.com/putting-the-i-back-in-ide-towards-a-github-explorer/
