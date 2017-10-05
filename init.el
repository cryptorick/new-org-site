(require 'org)

;; IIRC ox-rss is not part of stock emacs.  Try installing the
;; org-plus-contrib package to get it.
(require 'ox-rss)

;; Change the following to suit your site.
(setq my-website-link-home            "http://www.example.org/"
      my-website-description          "My great site"
      my-website-keywords             "org-mode excellent"
      my-website-first-copyright-year "2016"
      my-website-copyright-holder     "COPYRIGHT HOLDER")

(setq my-website-project-root (file-name-directory (or load-file-name (buffer-file-name))))
(setq my-website-src (file-name-directory (concat my-website-project-root "src/")))
(setq my-website-htdocs (file-name-directory (concat my-website-project-root "htdocs/")))

(setq my-website-html-head
  "<link rel=\"stylesheet\" href=\"css/site.css\" type=\"text/css\"/>")

(setq my-website-html-blog-head
  "<link rel=\"stylesheet\" href=\"../css/site.css\" type=\"text/css\"/>")

(setq my-website-html-preamble
  "<div class=\"nav\">
<ul>
<li><a href=\"/\">Home</a></li>
<li><a href=\"/blog/\">Blog</a></li>
</ul>
</div>")

(setq my-website-html-postamble
  (let ((latest-copyright-year (format-time-string "%Y")))
    (concat "<div class=\"footer\">\n"
            "Copyright "
            (if (string-equal my-website-first-copyright-year latest-copyright-year)
                my-website-first-copyright-year
              (concat my-website-first-copyright-year "-" latest-copyright-year))
            " "
            my-website-copyright-holder
            "<br/>\n"
            "Last updated %C\n"
            "</div>")))

(setq org-publish-project-alist
  `(("org"
     :base-directory ,my-website-src
     :base-extension "org"
     :publishing-directory ,my-website-htdocs
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :with-toc nil
     :html-head ,my-website-html-head
     :html-preamble ,my-website-html-preamble
     :html-postamble ,my-website-html-postamble
     :description ,my-website-description
     :keywords ,my-website-keywords
     :html-head-include-default-style nil
     :html-head-include-scripts nil
     :time-stamp-file nil
     :with-author nil)

    ("blog"
     :base-directory ,(concat my-website-src "blog")
     :base-extension "org"
     :publishing-directory ,(concat my-website-htdocs "blog/")
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :with-toc nil
     :html-head ,my-website-html-blog-head
     :html-head-extra
     ,(concat "<link rel=\"alternate\" type=\"application/rss+xml\" href=\""
              my-website-link-home
              "blog/blog.xml\" title=\"RSS feed\">")
     :html-preamble ,my-website-html-preamble
     :html-postamble ,my-website-html-postamble
     :description ,my-website-description
     :keywords ,my-website-keywords
     :html-head-include-default-style nil
     :html-head-include-scripts nil
     :time-stamp-file nil
     :with-author nil)

    ("images"
     :base-directory ,(concat my-website-src "images/")
     :base-extension "jpg\\|gif\\|png"
     :publishing-directory ,(concat my-website-htdocs "images/")
     :publishing-function org-publish-attachment)

    ("js"
     :base-directory ,(concat my-website-src "js/")
     :base-extension "js"
     :publishing-directory ,(concat my-website-htdocs "js/")
     :publishing-function org-publish-attachment)

    ("css"
     :base-directory ,(concat my-website-src "css/")
     :base-extension "css"
     :publishing-directory ,(concat my-website-htdocs "css/")
     :publishing-function org-publish-attachment)

    ("rss"
     :base-directory ,(concat my-website-src "blog")
     :base-extension "org"
     :publishing-directory ,(concat my-website-htdocs "blog")
     :publishing-function (org-rss-publish-to-rss)
     :html-link-home ,my-website-link-home
     :html-link-use-abs-url t)

    ("website" :components ("org" "blog" "images" "js" "css" "rss"))))
