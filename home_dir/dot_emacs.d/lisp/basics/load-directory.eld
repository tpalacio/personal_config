;ELC   
;;; Compiled by tpalacio@tpalacio.vm.ny4dev.etsy.com on Thu Jul 18 19:58:56 2013
;;; from file /home/tpalacio/.emacs.d/lisp/basics/load-directory.el
;;; in Emacs version 23.1.1
;;; with all optimizations.

;;; This file uses dynamic docstrings, first added in Emacs 19.29.
(if (and (boundp 'emacs-version)
	 (< (aref emacs-version (1- (length emacs-version))) ?A)
	 (or (and (boundp 'epoch::version) epoch::version)
	     (string-lessp emacs-version "19.29")))
    (error "`load-directory.el' was compiled for Emacs 19.29 or later"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'load-directory)
#@37 The files loaded by load-directory.
(defvar load-directory-loaded nil (#$ . 645))
#@47 The number of bytes loaded by load-directory.
(defvar load-directory-bytes 0 (#$ . 733))
#@187 Pattern for which files to load when loading all elisp in a directory.
Unfortunately, directory-files insists on treating its pattern
case-sensitively, case-fold-search notwithstanding.
(defvar load-directory-pattern "\\.\\(elc?\\)\\|\\(ELC?\\)$" (#$ . 829))
(byte-code "\301\302\207" [load-directory-pattern "\\.elc?$" nil] 1)
#@98 Functions to be called on each filename loaded by load-directory, just before loading that file.
(defvar load-directory-pre-load-file-hooks nil (#$ . 1164))
#@97 Functions to be called on each filename loaded by load-directory, just after loading that file.
(defvar load-directory-post-load-file-hooks nil (#$ . 1327))
#@53 How much storage was allocated by each file loaded.
(defvar load-directory-file-conses nil (#$ . 1490))
#@248 Load all the el or elc files in DIR.
If the optional second argument is not given, or is nil:
if there are both an elc and an el file for the same base name, load only
the elc file.
If the optional second argument is non-nil, load only .el files.
(defalias 'load-directory #[(dir &optional lisp-only) "\306\307\310!!\311	#\n?\312 \313\314\315\"\210\311\205] @\2032 \316\317\"\204; \320\321P!\204R \322\323\324\217\210B\325\326!8\\)A\211\204! \313-\207" [dir load-directory-pattern lisp-only gc-after gc-before load-compiled directory-files expand-file-name substitute-in-file-name t garbage-collect nil message "load-directory: files are %s" string-match "c$" file-exists-p "c" error-var (byte-code "\305\306\"\210\305\307\"\210\310\311\"\210\312!\210\313 	@@\n@@Z	A@@\nA@@Z\314	8\314\n8ZFB	\f\315=\203E \305\316\317\320\321\322 \"!\"\210\310\323\"\210\305\324\"\207" [file gc-after gc-before load-directory-file-conses system-type message "Loading %s..." "(load-file \"%s\")" run-hook-with-args load-directory-pre-load-file-hooks load-file garbage-collect 4 berkely-unix "PS: %s" shell-command-to-string format "ps  -vp %d" emacs-pid load-directory-post-load-file-hooks "Loading %s... done"] 6) ((error (byte-code "\303\304!\203 \304q\210\305\306\307\"\310\"\210	@\311=\203 \312\313\n\"\210\312\314	#\210\315\316!\207" [file error-var load-path get-buffer "*Backtrace*" rename-buffer format "*Backtrace-%s*" t file-error message "load-path is %S" "Problem in loading %s: %s" sit-for 2] 4))) 7 file-attributes files stack-trace-on-error file load-directory-loaded load-directory-bytes] 5 (#$ . 1601) "DDirectory to load emacs files from: \nP"])
#@79 Return a full pathname for SUBDIR as a subdirectory of something on load-path
(defalias 'find-subdirectory-from-path #[(subdir) "\300\301\215\207" [found (byte-code "\211\203# \305	@!\305\n\"\306\f!\203 \307\310\f\"\210*	A\211\204 )\311\207" [load-path lp fulldir subdir fullsubdir expand-file-name file-directory-p throw found nil] 4)] 2 (#$ . 3304) "sFind subdir from path: "])
