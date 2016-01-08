;;; uri-templates-tests.el --- Tests URI templates for Emacs     -*- lexical-binding: t; -*-

;; Copyright (C) 2016 William Clifford

;; Author: William Clifford <wobh@yahoo.com>

;; This file is not part of Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Tests of Emacs Lisp implementation of RFC 6570.

;;; Code:

(require 'uri-template)

(ert-deftest uri-template-tests-expand ()
  "Basic test of `uri-template-expand'"
  (let ((subject-template "{scheme}://{host}/{url-path}")
	(subject-mapping '((scheme   . "http")
			   (host     . "zombo.com")
			   (url-path . "welcome"))))
    (should
     (string= "http://zombo.com/welcome"
	      (uri-template-expand subject-template
				   subject-mapping)))))

(ert-deftest uri-template-tests-extract ()
  "Basic test of `uri-template-extract'"
  (let ((subject-template "{scheme}://{host}/{url-path}")
	(subject-uri "http://zombo.com/welcome"))
    (should
     (equal '((scheme . "http") (host . "zombo.com") (url-path . "welcome"))
	    (uri-template-extract subject-template subject-uri)))))

(provide 'uri-template-tests)
;;; uri-templates.el ends here
