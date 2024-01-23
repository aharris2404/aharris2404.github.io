;;; build-site.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Andrew Harris
;;
;; Author: Andrew Harris <andrewharris@Andrews-MBP>
;; Maintainer: Andrew Harris <andrewharris@Andrews-MBP>
;; Created: January 18, 2024
;; Modified: January 18, 2024
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/andrewharris/build-site
;; Package-Requires: ((emacs "29.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(provide 'build-site)

;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

;;(setq org-html-validation-link nil
;;      org-html-head-include-scripts nil
;;      org-html-head-include-default-style nil
;;      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; (setq org-publish-project-alist
;;      (list
;;      (list "aharris2404.github.io"
;;          :recursive t
;;          :base-directory "./content"
;;          :publishing-directory "./public"
;;          :publishing-function 'org-html-publish-to-html
;;          :with-author nil
;;          :with-creator nil
;;          :with-toc nil
;;          :section-numbers nil
;;          :time-stamp-file nil)))

(setq org-publish-project-alist
      '(
        ("org-andrew-harris"
          ;; Path to org files.
          :base-directory "~/code/aharris2404.github.io/org/"
          :base-extension "org"
          ;; Path to Jekyll project.
          :publishing-directory "~/code/aharris2404.github.io/jekyll/"
          :recursive t
          :publishing-function org-html-publish-to-html
          :headline-levels 4
          :html-extension "html"
          :with-toc nil
          :body-only t)
        ("org-static-andrew"
          :base-directory "~/code/aharris2404.github.io/org/"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
          :publishing-directory "~/code/aharris2404.github.io/"
          :recursive t
          :publishing-function org-publish-attachment)
        ("andrew" :components ("org-andrew-harris" "org-static-andrew"))))

(org-publish-all t)

(message "Build complete!")

;;; build-site.el ends here
