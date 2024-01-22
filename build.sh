#!/usr/bin/env sh

emacs -Q --script build-site.el

(cd jekyll ; jekyll build ; cd ..)
