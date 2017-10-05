# new-org-site
Write and publish a website with just Emacs org-mode

## Idea

Write a blog, but keep it simple.  I know Emacs org-mode (well enough), and I need to build a static website with a blog.  I don't really think I need a static pages compiler written in a language I don't know, and which has waaaay too much code for what I want to do.  And, I don't really feel like installing, for instance, a whole Ruby ecosystem on my machine(s).  Blech!

The setup file, [init.el](init.el), was stolen from, er inspired by, http://nicolas-petton.fr/blog/blogging-with-org-mode.html.

## What To Do

This repo is just a skeleton -- something for you/me to start out with.

1. Clone this repo.
2. Fire up emacs, visit the file `init.el`, edit it to suit you, then eval it.
3. Edit the `.org` files already under the `src/` directory, or create new ones under `src/`.
4. When you're ready to publish, do a `M-x org-publish` `website`.
5. Point your browser to the `htdocs/` directory to see the result.
6. Lather, rinse, repeat. (Face it; you're never going to get it right.)

## TODO

- Write/steal some elisp to generate a roundup of blog posts on the main blog (landing) page.
