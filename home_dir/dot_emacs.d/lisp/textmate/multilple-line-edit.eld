;ELC   
;;; Compiled by tpalacio@tpalacio.vm.ny4dev.etsy.com on Thu Jul 18 16:02:50 2013
;;; from file /home/tpalacio/.emacs.d/lisp/textmate/multilple-line-edit.el
;;; in Emacs version 23.1.1
;;; with all optimizations.

;;; This file uses dynamic docstrings, first added in Emacs 19.29.
(if (and (boundp 'emacs-version)
	 (< (aref emacs-version (1- (length emacs-version))) ?A)
	 (or (and (boundp 'epoch::version) epoch::version)
	     (string-lessp emacs-version "19.29")))
    (error "`multilple-line-edit.el' was compiled for Emacs 19.29 or later"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(byte-code "\301\302!\210\303B\304\305!\210\306B\307\306!\204 \310\306\311\"\210\312B\307\312!\204* \310\312\311\"\210\313B\307\313!\2049 \310\313\311\"\210\314\313!\210\315\302\311\316\317\320%\207" [current-load-list provide multiple-line-edit multiple-line-edit/version (lambda (#1=#:defconst-tmp-var) (defconst multiple-line-edit/version #1#)) "1.6" mulled/\.running-primitive-undo-p default-boundp set-default nil mulled/\.undo-at mulled/\.last-pt make-variable-buffer-local custom-declare-group "Multiple line edit" :group editing] 6)
#@59 Non-nil means reactivate multiple line edit by undo/redo.
(custom-declare-variable 'mulled/reactivate-by-undo 't '(#$ . 1181) :type 'boolean :group 'multiple-line-edit)
(byte-code "\300\301\302\303\304\305%\210\300\306\307\310\304\305%\210\300\311\312\313\304\305%\207" [custom-declare-face mulled/cursor-face ((((class color) (background light)) :background "grey") (((class color) (background dark)) :background "white") (t :inverse-video t)) "Face used for cursor of multiple line edit." :group multiple-line-edit mulled/out-of-range-cursor-face ((((class color)) :foreground "white" :background "Red1") (t :inverse-video t :weight bold)) "Face used for cursor of multiple line edit when\nwhen either cursor is outside of each line." mulled/fringe-face ((((class color) (background light)) nil) (t nil)) "The face used to display icons on the fringes."] 6)
#@255 Non-nil means special functions defined in `mulled/special-fn-alist'
will be applied to each lines instead of mirroring the result of
a function applied at 1st line.

Default value is `t'.

*THIS FEATURE IS EXPERIMENTAL AND MAY BE REMOVED IN THE FUTURE*
(custom-declare-variable 'mulled/apply-special-fn-to-each-line-p 'nil '(#$ . 2048) :type 'boolean :group 'multiple-line-edit)
#@235 Alist name of special functions and callback function which have to
be applied to each line directory instead of mirroring the result of
a function applied at 1st line.

*THIS FEATURE IS EXPERIMENTAL AND MAY BE REMOVED IN THE FUTURE*
(custom-declare-variable 'mulled/special-fn-alist ''((capitalize-region lambda (beg end &rest orig-args) (capitalize-region beg end)) (downcase-region lambda (beg end &rest orig-args) (downcase-region beg end)) (upcase-region lambda (beg end &rest orig-args) (upcase-region beg end))) '(#$ . 2435) :group 'multiple-line-edit)
#@361 Start editing on trailing edge of multiple line.

You have to select lines, that you want to edit at a time,
before you run this command.

When called with prefix argument, cursor remains at current
position.

Otherwise, cursor will be moved to beginning of the lines.

You can abort multiple lines edit by typing "C-g"
or move cursor to outside of each line.
(defalias 'mulled/edit-trailing-edges #[(&optional keep-offset) "\301 \203	 \302!\207\303 \203 \304\305!\207\306 \203  \307\310 \311 \312$\207\304\313!\207" [keep-offset mulled/is-leading-edges-edit-in-progress mulled/switch-direction mulled/is-trailing-edges-edit-in-progress message "[mulled] Multiple line edit on trailing edge is in progress." mulled/lines-selected-p mulled/ov-1st-line/activate region-beginning region-end t "[mulled] Select multiple line first."] 5 (#$ . 3002) "P"])
#@354 Start editing on leading edge of multiple line.

You have to select lines, that you want to edit at a time,
before you run this command.

When called with prefix argument, cursor remains at current
position.

Otherwise, cursor will be moved to end of the lines.

You can abort multiple lines edit by typing "C-g"
or move cursor to outside of each line.
(defalias 'mulled/edit-leading-edges #[(&optional keep-offset) "\301 \203	 \302!\207\303 \203 \304\305!\207\306 \203  \307\310 \311 \312$\207\304\313!\207" [keep-offset mulled/is-trailing-edges-edit-in-progress mulled/switch-direction mulled/is-leading-edges-edit-in-progress message "[mulled] Multiple line edit on leading edge is in progress." mulled/lines-selected-p mulled/ov-1st-line/activate region-beginning region-end nil "[mulled] Select multiple line first."] 5 (#$ . 3862) "P"])
#@298 Switch Leading Edges Edit and Trailing Edges Edit.
      
When called with prefix argument, cursor won't be moved to
each edges.
      
Otherwise, cursor will be moved to either edge.

You can also switch editing direction by commands
`mulled/edit-leading-edges' and `mulled/edit-trailing-edges'.
(defalias 'mulled/switch-direction #[(&optional keep-offset) "\302`!\211\203 \303	\"\202 \304\305!)\207" [ov keep-offset mulled/ov-1st-line/find-at mulled/ov-1st-line/switch-direction message "[mulled] Multiple line edit is not in progress."] 4 (#$ . 4715) "P"])
#@131 Exit from multiple line edit.
You can restore multiple line edit session, which aborted
by this command, with the command `undo'.
(defalias 'mulled/abort #[nil "\301`!\211\203 \302!\210\303\304!\202 \305 )\207" [ov mulled/ov-1st-line/find-at mulled/ov-1st-line/dispose message "[mulled] Multiple line edit exited." mulled/force-abort] 3 (#$ . 5286) nil])
#@95 Force abort multiple line edit.
Try this command when multiple line edit is broken
by errors.
(defalias 'mulled/force-abort #[nil "\214~\210\304ed\"\305\211\305\211\203( @\306\n!\203! \307\n!\210\310A\211\204 *\2050 \311\312!+\207" [disposed-p ov-lst ov #1=#:--cl-dolist-temp-- overlays-in nil mulled/ov-1st-line/ov-1st-line-p mulled/ov-1st-line/dispose t message "[mulled] Multiple line edit force exited."] 4 (#$ . 5651) nil])
(defalias 'mulled/lines-selected-p #[nil "\203 	\202	 \302\205 \303\304\305 \306 \"W\207" [transient-mark-mode mark-active t 1 count-lines region-beginning region-end] 4])
(defalias 'mulled/is-trailing-edges-edit-in-progress #[nil "\301`!\211\205 \302!)\207" [ov mulled/ov-1st-line/find-at mulled/ov-1st-line/edit-trailing-edges-p] 3])
(defalias 'mulled/is-leading-edges-edit-in-progress #[nil "\301`!\211\205\f \302!?)\207" [ov mulled/ov-1st-line/find-at mulled/ov-1st-line/edit-trailing-edges-p] 3])
#@227 Calculate point offset from PT-BEG by COL-NUM.

Line break character will be counted as one column.

When COL-NUM is negative number, returns PT-BEG.
When the result exceeds `point-max' of current buffer,
returns `point-max'.
(defalias 'mulled/pt-offset-by-col-num #[(pt-beg col-num) "\304\212\214~\210	d}\210eb\210m\2049 \2049 \304\210i\nX\203+ \305\306]!\210\307\2025 `Tb\210\310\n\311#)\202 ~\210`+\207" [done pt-beg cur-col col-num nil move-to-column 0 t - 1] 4 (#$ . 6608)])
#@158 Calculate number of columns, based on visible char width,
in the region specified by PT-BEG and PT-END.

Line break character will be counted as one column.
(defalias 'mulled/col-num-in-region #[(pt-beg pt-end) "\303\212\214~\210	\n}\210eb\210`dU\204* \304\210i\\`dU\204 `Tb\210T\202 *)\207" [col-num pt-beg pt-end 0 nil] 2 (#$ . 7105)])
#@62 The keymap active while a multiple line edit is in progress.
(defvar mulled/ov-1st-line/keymap (make-sparse-keymap) (#$ . 7458))
(define-key mulled/ov-1st-line/keymap [7] 'mulled/abort)
(defalias 'mulled/ov-1st-line/ov-1st-line-p #[(unknown-obj) "\301!\205\n \302\303\"\207" [unknown-obj overlayp overlay-get mulled/ov-1st-line-p] 3])
(defalias 'mulled/ov-1st-line/find-at #[(point) "\300\301\215\207" [--cl-block-nil-- (byte-code "\303!\304\211\203  \n@\305	\306\"\203 \307\310	\"\210\nA\211\204\n *\304\207" [point ov #1=#:--cl-dolist-temp-- overlays-at nil overlay-get mulled/lines throw --cl-block-nil--] 4)] 2])
(defalias 'mulled/ov-1st-line/find-and-dispose-at #[(point) "\302!\211\205 \303	!)\207" [point ov mulled/ov-1st-line/find-at mulled/ov-1st-line/dispose] 3])
(defalias 'mulled/ov-1st-line/activate #[(r-pt-beg r-pt-end edit-trailing-edges-p &optional keep-offset) "\304\305	\n#\n#\207" [r-pt-beg r-pt-end edit-trailing-edges-p keep-offset mulled/ov-1st-line/activate-aux mulled/lines/new] 5])
(defalias 'mulled/ov-1st-line/reactivate #[(be-pair-lst edit-trailing-edges-p &optional keep-offset) "\303\304	\"	\n#\207" [be-pair-lst edit-trailing-edges-p keep-offset mulled/ov-1st-line/activate-aux mulled/lines/new-by-be-pair-lst] 4])
(defalias 'mulled/ov-1st-line/activate-aux #[(lines edit-trailing-edges-p &optional keep-offset) "\306\307\"\310\307\"	eU\311\203 	\202 	S\nT\312\211\211%`\313	!\211\203. \314\f!\210)\315\f\316\317#\210\315\f\320#\210\315\f\321-#\210\315\f\322#\210\315\f\323\324#\210\315\f\325\326#\210\315\f\327\312#\210\315\f\330.#\210\331\332!\331\333!/\2110\fL\210/\312L\210/\334\335\336\337\340/D\3400D\341\257EL\210\342\343/J\"\210\342\344/J\"\210\3150J\345/J#\210*1\203\275 2<\203\275 \346\f!2B2\336\347E2B23\203\350`\"\203\350`\"4\3514\"5\351\307\"6-\203\362 5iZ7\30767Z])\202\366 5i^8	b\210\352 \210\3538!\210,\202	b\210-\203\312\210\202\352 \210\3129\354-\"\210\f-\207" [lines beg end beg-from-point-min-p ov cur-pt mulled/lines/pt-nth-beg 0 mulled/lines/pt-nth-end make-overlay nil mulled/ov-1st-line/find-at mulled/ov-1st-line/dispose overlay-put mulled/ov-1st-line-p t mulled/lines mulled/edit-trailing-edges-p mulled/beg-from-point-min-p modification-hooks (mulled/ov-1st-line/mod-hook-fn) insert-in-front-hooks (mulled/ov-1st-line/mod-hook-fn) insert-behind-hooks keymap make-symbol "--ov--" "--fn--" lambda (&rest --cl-rest--) apply #[(#1=#:G78500 #2=#:G78501) "\300\301\302\217\207" [c (byte-code "\306J!\205P \307J!\310J!\311J!\f\203 \fb\210\312`p=\205O 	X\2033 \nX\204? \313J!\210\314\315!\210\202K \232\204K \316J!\210\211,\207" [#2# ov-beg ov-end ov-buf mulled/\.undo-at cur-pt mulled/ov-1st-line/ov-1st-line-p mulled/ov-1st-line/get-beg-without-padding mulled/ov-1st-line/get-end-without-padding overlay-buffer nil mulled/ov-1st-line/dispose message "[mulled] Multiple line edit exited." mulled/ov-1st-line/update-cursor-pos mulled/\.last-pt] 2) ((error (byte-code "\302\303\"\210\304	J!\207" [c #2# message "[mulled] Multiple line edit exited by error:\n%s." mulled/ov-1st-line/dispose] 3)))] 3] quote --cl-rest-- add-hook pre-command-hook post-command-hook mulled/hook-fn mulled/ov-1st-line/make-dispose-form goto-char mulled/lines/nth-from-pt mulled/lines/col-num-nth beginning-of-line move-to-column mulled/lines/update-cursor-ov-lst edit-trailing-edges-p mulled/ov-1st-line/keymap #3=#:--cl-fn-- #4=#:--cl-ov-- mulled/reactivate-by-undo buffer-undo-list keep-offset nth col-num col-num-1st offset new-col-1st mark-active] 9])
(defalias 'mulled/ov-1st-line/dispose #[(ov) "\306\307\"\306\310\"\311	!\306\312\"\306\307\"\203E <\203E @\203. \313B\203= \314\315EB\316!B\317	!\210\320\321\313#\210\320\307\313#\210\320\310\313#\210\320\322\313#\210\320\312\313#\210\320\323\313#\210\320\324\313#\210\320\325\313#\210\320\326\313#\210\327\330\f\"\210\327\331\f\"\210\332!\210\313\211\211-\207" [ov lines edit-trailing-edges-p line-num fn mulled/reactivate-by-undo overlay-get mulled/lines mulled/edit-trailing-edges-p mulled/lines/count-of mulled/hook-fn nil apply goto-char mulled/ov-1st-line/make-reactivate-form mulled/lines/dispose overlay-put mulled/ov-1st-line-p mulled/beg-from-point-min-p modification-hooks insert-in-front-hooks insert-behind-hooks keymap remove-hook pre-command-hook post-command-hook delete-overlay buffer-undo-list mulled/\.last-pt mulled/\.undo-at] 5])
(defalias 'mulled/ov-1st-line/make-reactivate-form #[(ov) "\301\302\303\304\305\306\"!!\305\307\"F\207" [ov apply mulled/ov-1st-line/reactivate mulled/lines/be-pair-lst/dup-without-marker mulled/lines/be-pair-lst-of overlay-get mulled/lines mulled/edit-trailing-edges-p] 7])
(defalias 'mulled/ov-1st-line/make-dispose-form #[(ov) "\301\302\303!E\207" [ov apply mulled/ov-1st-line/find-and-dispose-at mulled/ov-1st-line/get-beg-without-padding] 4])
(defalias 'mulled/ov-1st-line/update-cursor-pos #[(ov) "\303\304\"\303\305\"\306	\n\"*\207" [ov lines edit-trailing-edges-p overlay-get mulled/lines mulled/edit-trailing-edges-p mulled/lines/update-cursor-ov-lst] 3])
(defalias 'mulled/ov-1st-line/switch-direction #[(ov &optional keep-offset) "\305\306\"\307\310	!!\305\311\"\312!\210\313\n?\f#+\207" [ov lines be-pair-lst-wo-marker edit-trailing-edges-p keep-offset overlay-get mulled/lines mulled/lines/be-pair-lst/dup-without-marker mulled/lines/be-pair-lst-of mulled/edit-trailing-edges-p mulled/ov-1st-line/dispose mulled/ov-1st-line/reactivate] 4])
(defalias 'mulled/ov-1st-line/get-beg-without-padding #[(ov) "\301!\302\303\"\203 \304\202 \305\\\207" [ov overlay-start overlay-get mulled/beg-from-point-min-p 0 1] 4])
(defalias 'mulled/ov-1st-line/get-end-without-padding #[(ov) "\301!S\207" [ov overlay-end] 2])
(defalias 'mulled/ov-1st-line/get-beg-with-padding #[(ov) "\301!\302\303\"\203 \304\202 \305Z\207" [ov overlay-start overlay-get mulled/beg-from-point-min-p 1 0] 4])
(defalias 'mulled/ov-1st-line/get-end-with-padding #[(ov) "\301!\207" [ov overlay-end] 2])
(defalias 'mulled/ov-1st-line/edit-trailing-edges-p #[(ov) "\301\302\"\207" [ov overlay-get mulled/edit-trailing-edges-p] 3])
(byte-code "\301B\302\301!\204 \303\301\304\"\210\305\301!\207" [current-load-list mulled/ov-1st-line/\.str-to-be-modified default-boundp set-default nil make-variable-buffer-local] 3)
(defalias 'mulled/ov-1st-line/mod-hook-fn #[(&rest args) "\306\307!\211A@9\205# \310A@!\311\312	\"\203 \313\314\315\211	$\316	!)\211\205, \317\n\"AA*@+*A@,\320*8-\307*8.\321*8/\322+!\205\203\323+\324\"0\3250\326-#1\3250\326.#2\323+\327\"3,\204\244 -.{45?\205\202\3300-\"\204\231 \3300.\"\205\202\331+!\210\332\333!\202\2025\203\257 `6\202{47\334\335!8r8q\210\336\2167c\210\337ee/\\\"+9\34003129%:;\203\371 \f\203\371 \34103129\n\fA&\210\202z\342/!\203:\203\331+!\210\332\333!\210\202z\3430312$\210\202z-.U\2047\34403129%\210\202z.\345+!U.\346+!U<=:\204`=\204`<\203l\323+\347\"\204l\331+!\210\332\333!\210\202y\35003129%\210*+\3144\351+!,.	\207" [parent-frame name fn-name mulled/special-fn-alist fn-callback-pair orig-fn-args backtrace-frame 3 symbol-name string-match "^ad-Orig-" replace-match "" nil intern assoc 2 4 mulled/ov-1st-line/ov-1st-line-p overlay-get mulled/lines mulled/lines/col-from-pt-in-nth 0 mulled/edit-trailing-edges-p mulled/lines/out-of-1st-line-p mulled/ov-1st-line/dispose message "[mulled] Multiple line edit exited. (out of range)" generate-new-buffer " *temp*" ((byte-code "\301!\203\n \302!\210\301\207" [#1=#:temp-buffer buffer-name kill-buffer] 2)) mulled/col-num-in-region mulled/lines/out-of-range-op-p mulled/lines/mirror-special-fn zerop mulled/lines/mirror-insert-op mulled/lines/mirror-replace-op mulled/ov-1st-line/get-end-with-padding mulled/ov-1st-line/get-beg-with-padding mulled/beg-from-point-min-p mulled/lines/mirror-delete-op mulled/ov-1st-line/update-cursor-pos args ov after-p pt-beg pt-end len-removed lines col-beg col-end edit-trailing-edges-p mulled/ov-1st-line/\.str-to-be-modified mulled/\.running-primitive-undo-p mulled/\.undo-at str-maybe-removed #1# col-num-removed out-of-range-p mulled/apply-special-fn-to-each-line-p backspace-at-bol-p remove-newline-at-eol-p] 10])
(byte-code "\300\301\302\303\304$\210\305\301!\207" [ad-add-advice primitive-undo (mulled/undo-hook-fn nil t (advice lambda (n list) (setq mulled/\.running-primitive-undo-p t) (unwind-protect ad-do-it (setq mulled/\.running-primitive-undo-p nil)))) around nil ad-activate] 5)
(defalias 'mulled/lines/new #[(r-pt-beg r-pt-end edit-trailing-edges-p) "\303\304	\"\n\"\207" [r-pt-beg r-pt-end edit-trailing-edges-p mulled/lines/new-by-be-pair-lst mulled/lines/be-pair-lst/new] 4])
(defalias 'mulled/lines/new-by-be-pair-lst #[(be-pair-lst edit-trailing-edges-p) "\304!\210\305C	\"\306C	\"\nE*\207" [be-pair-lst edit-trailing-edges-p fringe-ov-lst cursor-ov-lst mulled/lines/be-pair-lst/activate-marker mulled/lines/init-fringe-ov-lst mulled/lines/init-cursor-ov-lst] 3])
(byte-code "\300\301!\203 \301\302\303\"\210\301\304\305\"\210\300\207" [fboundp define-fringe-bitmap mulled/indicator-left [0 204 102 51 51 102 204 0] mulled/indicator-right [0 51 102 204 204 102 51 0]] 3)
(defalias 'mulled/lines/init-fringe-ov-lst #[(lines edit-trailing-edges-p) "\306\307!\306\310!\211\311L\210\312 L\210\313\314!\203` \315 \203` \n\206. J\203- \316J!@\206. \317\320Y\203` \206I J\203H \316J!\211A@)\206I \317\320Y\203` \321\322\323\324\325\326D\326	D\327\257E\"\210\330	J!*\207" [#1=#:--cl-cur-win-- #2=#:--cl-fringe-ov-lst-- left-fringe-width right-fringe-width x lines make-symbol "--fringe-ov-lst--" "--cur-win--" nil selected-window boundp fringe-bitmaps display-images-p window-fringes 0 8 mulled/lines/map lambda (&rest --cl-rest--) apply #[(#3=#:G78502 #4=#:G78503 nth) "\306	\"\307	\"\310\f\203 \311\202 \312!\310\f\203 \311\202  \312!\f\203+ \313\202, \314\f\2036 \315\2027 \316\317\n\320\211\321% \322\323!\203d \324\325G\326\314\327E%\210\324\325G\326\313\327E%\210\330 \331#\210\330 \332#\210\330 \333\334#\210! !JBL.\207" [lines nth beg end edit-trailing-edges-p indicator-l mulled/lines/pt-nth-beg mulled/lines/pt-nth-end copy-sequence "<" ">" right-fringe left-fringe mulled/indicator-right mulled/indicator-left make-overlay nil t boundp fringe-bitmaps put-text-property 0 display mulled/fringe-face overlay-put before-string after-string priority 100 indicator-r fringe fringe-bmp ov #4#] 7] quote --cl-rest-- reverse] 10])
(defalias 'mulled/lines/init-cursor-ov-lst #[(lines edit-trailing-edges-p) "\302\303!\211\304L\210\305	\306\307\310\311\312D\313FE\"\210J)\207" [#1=#:--cl-cursor-ov-lst-- lines make-symbol "--cursor-ov-lst--" nil mulled/lines/map lambda (&rest --cl-rest--) apply #[(#2=#:G78504 idx) "\302``\"\303	\304\305#\210	)JBL\207" [#2# ov make-overlay overlay-put priority 1000] 5] quote --cl-rest--] 9])
(defalias 'mulled/lines/dispose #[(lines) "\304!\305\211\203 \n@\306	!\210\nA\211\204\n *\307!\305\211\2031 @\306	!\210A\211\204# *\310\311!!\207" [lines ov #1=#:--cl-dolist-temp-- #2=#:--cl-dolist-temp-- mulled/lines/indicator-ov-lst-of nil delete-overlay mulled/lines/cursor-ov-lst-of mulled/lines/be-pair-lst/dispose mulled/lines/be-pair-lst-of] 3])
#@68 Fetch list of `beginning-of-line/end-of-line' pairs of each lines.
(defalias 'mulled/lines/be-pair-lst-of #[(lines) "@\207" [lines] 1 (#$ . 18857)])
(defalias 'mulled/lines/indicator-ov-lst-of #[(lines) "A@\207" [lines] 1])
(defalias 'mulled/lines/cursor-ov-lst-of #[(lines) "\3018\207" [lines 2] 2])
#@56 Total amount of lines targeted for multiple line edit.
(defalias 'mulled/lines/count-of #[(lines) "\301!G\207" [lines mulled/lines/be-pair-lst-of] 2 (#$ . 19167)])
#@32 Start point of the `NTH' line.
(defalias 'mulled/lines/pt-nth-beg #[(lines nth) "\302\303	!8@!\207" [nth lines marker-position mulled/lines/be-pair-lst-of] 4 (#$ . 19338)])
#@30 End point of the `NTH' line.
(defalias 'mulled/lines/pt-nth-end #[(lines nth) "\302\303	!8A!\207" [nth lines marker-position mulled/lines/be-pair-lst-of] 4 (#$ . 19518)])
#@97 Returns index of the line in LINES which
contains PT.

Returns nil when PT is outside of LINES.
(defalias 'mulled/lines/nth-from-pt #[(lines pt) "\302\303	\304\"\210)\207" [retval lines nil mulled/lines/map #[(nth) "\305	\"\306	\"X\205 \307	\"X\205 	\211)\207" [lines nth col-num-cur-line pt retval mulled/lines/col-num-nth mulled/lines/pt-nth-beg mulled/lines/pt-nth-end] 4]] 3 (#$ . 19696)])
#@31 Get column at PT in NTH line.
(defalias 'mulled/lines/col-from-pt-in-nth #[(lines nth pt) "\305	\"\306	\"\211\fX\203 \f\nX\204 \307\310	\f#\210\311\f\"*\207" [lines nth pt-end pt-beg pt mulled/lines/pt-nth-beg mulled/lines/pt-nth-end error "[mulled/lines/pt-to-col-num-nth] Out of range: nth[%s], pt[%s]." mulled/col-num-in-region] 5 (#$ . 20107)])
#@31 Get column at PT in NTH line.
(defalias 'mulled/lines/pt-from-col-in-nth #[(lines nth col) "\303\304	\"\n\"\207" [lines nth col mulled/pt-offset-by-col-num mulled/lines/pt-nth-beg] 4 (#$ . 20469)])
#@38 Count number of columns in NTH line.
(defalias 'mulled/lines/col-num-nth #[(lines nth) "\302\303	\"\304	\"\"\207" [lines nth mulled/col-num-in-region mulled/lines/pt-nth-beg mulled/lines/pt-nth-end] 5 (#$ . 20674)])
#@55 Count number of columns in the longest line of LINES.
(defalias 'mulled/lines/col-num-max #[(lines) "\304\305	!\304\nW\203 \306	\n\"]\nT\211\202	 *)\207" [retval lines nth #1=#:--cl-dotimes-temp-- 0 mulled/lines/count-of mulled/lines/col-num-nth] 5 (#$ . 20898)])
#@56 Count number of columns in the shortest line of LINES.
(defalias 'mulled/lines/col-num-min #[(lines) "\304\305	!\306\nW\203# \206 \307	\n\"\307	\n\"^\nT\211\202	 *\206) \306)\207" [retval lines nth #1=#:--cl-dotimes-temp-- nil mulled/lines/count-of 0 mulled/lines/col-num-nth] 5 (#$ . 21177)])
#@61 Apply the function `FN' to each line of multiple line edit.
(defalias 'mulled/lines/map #[(lines fn) "\304\305	!S\nX\203 !\210T\211\202 *\306\207" [i lines #1=#:--cl-var-- fn 0 mulled/lines/count-of nil] 3 (#$ . 21486)])
#@78 Apply the function `FN' to each line of multiple line edit, except 1st line.
(defalias 'mulled/lines/map-but-1st #[(lines fn) "\304\305	!S\nX\203 !\210T\211\202 *\306\207" [nth lines #1=#:--cl-var-- fn 1 mulled/lines/count-of nil] 3 (#$ . 21722)])
#@39 Test if the point is within 1st-line.
(defalias 'mulled/lines/out-of-1st-line-p #[(lines pt) "\304\305\"\306\305\"\211X\205 	X*?\207" [lines end beg pt mulled/lines/pt-nth-beg 0 mulled/lines/pt-nth-end] 5 (#$ . 21985)])
#@124 Test if the operation, specified by `COL-BEG', `COL-END' and `LEN-REMOVE', is
accepted by each line of multiple line edit.
(defalias 'mulled/lines/out-of-range-op-p #[(lines edit-trailing-edges-p col-beg col-end col-num-removed) "\306\307!\211\310L\210\306\311!\211\n\203 \312\f\313\"Z\202 \\L\210\314\f\315\316\317\320\321	D\321D\322\257E\"\210J*\207" [#1=#:--cl-retval-- #2=#:--cl-col-required-- col-num-removed edit-trailing-edges-p lines col-end make-symbol "--retval--" nil "--col-required--" mulled/lines/col-num-nth 0 mulled/lines/map-but-1st lambda (&rest --cl-rest--) apply #[(#3=#:G78505 #4=#:G78506 nth) "\305	\"\211JW\205 \f\306L)\207" [lines nth col-num-cur-line #3# #4# mulled/lines/col-num-nth t] 4] quote --cl-rest-- col-beg] 10 (#$ . 22219)])
(defalias 'mulled/lines/update-cursor-ov-lst #[(lines edit-trailing-edges-p) "\302\303!	#\207" [lines edit-trailing-edges-p mulled/lines/update-cursor-ov-lst-aux mulled/lines/cursor-ov-lst-of] 4])
(defalias 'mulled/lines/update-cursor-ov-lst-aux #[(lines cursor-ov-lst edit-trailing-edges-p) "\306\n\307`#\310\n\307\"	\203 \fZ\202 \311\n	\211\307%\211\203* \312\202+ \313\314\315!\316\307\317\320%\210)\321\n\322\"\210?\205U ?\205U \323\307!.\207" [edit-trailing-edges-p tail-p lines col-1st-line col-num-1st-line offset-1st-line mulled/lines/col-from-pt-in-nth 0 mulled/lines/col-num-nth mulled/lines/out-of-range-op-p mulled/out-of-range-cursor-face mulled/cursor-face copy-sequence " " put-text-property 1 face mulled/lines/map #[(nth) "	8\306\"\203 \307\fZ]\202 \f^\310#\311\211f\312=\203N \313T#\314ZS\315\")\202n f\316=\203b \260\317\202n f\204n \260\320\n\321#\210\320\n\322#\210*\323\n\211T#\210\320\n\324#,\207" [nth cursor-ov-lst ov lines col-num tail-p mulled/lines/col-num-nth 0 mulled/lines/pt-from-col-in-nth nil 9 mulled/lines/col-from-pt-in-nth make-string 32 10 "\n" overlay-put display after-string move-overlay face offset-1st-line col pt after-str col-next-char pseudo-cursor] 4] sit-for out-of-range-err str pseudo-cursor mulled/\.running-primitive-undo-p executing-kbd-macro] 7])
#@75 Reflect input operation, which is occurred in 1st line, to another lines.
(defalias 'mulled/lines/mirror-insert-op #[(lines edit-trailing-edges-p col-beg col-end) "\306\307!\211\310	\311\n#\310	\311#{L\210\306\312!\211\203$ \313	\311\"Z\202% \nL\210\212\214~\210\314	\315\316\317\320\321\fD\321D\322\257E\",\207" [#1=#:--cl-str-- lines col-beg col-end #2=#:--cl-col-offset-- edit-trailing-edges-p make-symbol "--str--" mulled/lines/pt-from-col-in-nth 0 "--col-offset--" mulled/lines/col-num-nth mulled/lines/map-but-1st lambda (&rest --cl-rest--) apply #[(#3=#:G78507 #4=#:G78508 nth) "\305	\n\203 \306	\"JZ\202 J#b\210\fJc\207" [lines nth edit-trailing-edges-p #3# #4# mulled/lines/pt-from-col-in-nth mulled/lines/col-num-nth] 6] quote --cl-rest--] 10 (#$ . 24399)])
#@76 Reflect delete operation, which is occurred in 1st line, to another lines.
(defalias 'mulled/lines/mirror-delete-op #[(lines edit-trailing-edges-p col-beg col-end col-num-removed) "\305\306!\211	\203 \307\n\310\"Z\202 \fL\210\212\214~\210\311\n\312\313\314\315\316D\317FE\"+\207" [#1=#:--cl-col-offset-- edit-trailing-edges-p lines col-end col-beg make-symbol "--col-offset--" mulled/lines/col-num-nth 0 mulled/lines/map-but-1st lambda (&rest --cl-rest--) apply #[(#2=#:G78509 nth) "\203$ \306	\n\307\310	\n\"J\f##\306	\n\310	\n\"JZ#\211	|*\207\306	\nJ#\306	\nJ\f\\#\211	|*\207" [edit-trailing-edges-p lines nth #2# col-num-removed pt-end mulled/lines/pt-from-col-in-nth - mulled/lines/col-num-nth pt-beg] 8] quote --cl-rest--] 9 (#$ . 25186)])
(defalias 'mulled/lines/mirror-replace-op-aux #[(lines edit-trailing-edges-p col-beg col-end col-num-removed fn) "\306\307!\211	L\210\306\310!\211L\210\306\311!\211L\210\306\312!\211J\203. \313\314\"Z\2020 L\210\212\214~\210\315\316\317\320\321\322D\322\fD\322\nD\322D\323\257E\".\207" [#1=#:--cl-edit-trailing-edges-p-- edit-trailing-edges-p #2=#:--cl-col-num-removed-- col-num-removed #3=#:--cl-fn-- fn make-symbol "--edit-trailing-edges-p--" "--col-num-removed--" "--fn--" "--col-offset--" mulled/lines/col-num-nth 0 mulled/lines/map-but-1st lambda (&rest --cl-rest--) apply #[(#4=#:G78510 #5=#:G78511 #6=#:G78512 #7=#:G78513 nth) "J\203* \306	\n\307\310	\n\"J\fJ##\306	\n\310	\n\"JZ#	\nJ	\"*\207\306	\nJ#\306	\nJ\fJ\\#	\nJ	\"*\207" [#7# lines nth #4# #6# pt-end mulled/lines/pt-from-col-in-nth - mulled/lines/col-num-nth pt-beg #5#] 7] quote --cl-rest-- #8=#:--cl-col-offset-- lines col-end col-beg] 12])
#@77 Reflect replace operation, which is occurred in 1st line, to another lines.
(defalias 'mulled/lines/mirror-replace-op #[(lines edit-trailing-edges-p col-beg col-end col-num-removed) "\306\307!\211\310	\311\n#\310	\311#{L\210\312	\f\n\313\314\315\316\317D\320FE&)\207" [#1=#:--cl-str-- lines col-beg col-end edit-trailing-edges-p col-num-removed make-symbol "--str--" mulled/lines/pt-from-col-in-nth 0 mulled/lines/mirror-replace-op-aux lambda (&rest --cl-rest--) apply #[(#2=#:G78514 pt-beg pt-end) "	|\210b\210\nJc\207" [pt-beg pt-end #2#] 2] quote --cl-rest--] 13 (#$ . 26898)])
#@77 Reflect replace operation, which is occurred in 1st line, to another lines.
(defalias 'mulled/lines/mirror-special-fn #[(lines edit-trailing-edges-p col-beg col-end col-num-removed fn-name callback-fn orig-args) "\306\307!\211	L\210\306\310!\211L\210\306\311!\211L\210\312\313\314\315\316\317\fD\317\nD\317D\320\257E&+\207" [#1=#:--cl-fn-name-- fn-name #2=#:--cl-callback-fn-- callback-fn #3=#:--cl-orig-args-- orig-args make-symbol "--fn-name--" "--callback-fn--" "--orig-args--" mulled/lines/mirror-replace-op-aux lambda (&rest --cl-rest--) apply #[(#4=#:G78515 #5=#:G78516 #6=#:G78517 pt-beg pt-end) "\300\301\302\217\207" [c (byte-code "\304J	\nJ$\207" [#5# pt-beg pt-end #4# apply] 5) ((error (byte-code "\302\303J	#\207" [#6# c message "[mulled] Error in special function `%s':\n%s"] 4)))] 3] quote --cl-rest-- lines edit-trailing-edges-p col-beg col-end col-num-removed] 15 (#$ . 27493)])
(defalias 'mulled/lines/be-pair-lst/new #[(r-pt-beg r-pt-end) "\305\212	b\210\306	\n\"\307\fW\203/ \310 \210`\305\210`BBd`U\204( \305u\210T\211\202 +\311\312!!)\207" [be-pair-lst r-pt-beg r-pt-end i #1=#:--cl-dotimes-temp-- nil count-lines 0 beginning-of-line mulled/lines/be-pair-lst/activate-marker reverse] 4])
(defalias 'mulled/lines/be-pair-lst/activate-marker #[(be-pair-lst) "\212\304\211\2035 \n@\211@b\210	\305 \306\304\"\210)\240\210	Ab\210	\305 \306\307\"\210)\241\210\nA\211\204	 +\207" [be-pair-lst be-pair #1=#:--cl-dolist-temp-- m nil point-marker set-marker-insertion-type t] 5])
(defalias 'mulled/lines/be-pair-lst/dispose #[(be-pair-lst) "\303\211\203, \n@\304	@!\203 	@\303\211\223\210\304	A!\203% 	A\303\211\223\210\nA\211\204 *\303\207" [be-pair-lst be-pair #1=#:--cl-dolist-temp-- nil markerp] 4])
(defalias 'mulled/lines/be-pair-lst/dup-without-marker #[(be-pair-lst) "\301\302\"\207" [be-pair-lst mapcar #[(pair) "\301@!\301A!B\207" [pair marker-position] 3]] 3])
(defalias 'mulled/mod-hook-fix/run-orig-insert #[(&rest args) "\306`!\307!\203 \310\301!\203 	\203 \311\n\"\202= \312`\313\314\f\211$\210\311\n\"\214~\210`)\313\312\f\315%\210,)\207" [ov run-orig-insert-fn-p mulled/mod-hook-fix/orig-insert-fn args insert-beg retval mulled/ov-1st-line/find-at mulled/ov-1st-line/ov-1st-line-p boundp apply t mulled/ov-1st-line/mod-hook-fn nil 0 insert-end] 6])
(defalias 'mulled/mod-hook-fix/run-orig-delete-region #[(start end) "\306!\307	!\203 \310\302!\203 \n\203 \f\"\202L \311\212b\210`)\212\fb\210`)\211\fZ\f{\312	\313\f$\210\f\"\312	\311\211%\210-)\207" [start ov run-orig-delete-region-fn-p mulled/mod-hook-fix/orig-delete-region-fn end remove-beg mulled/ov-1st-line/find-at mulled/ov-1st-line/ov-1st-line-p boundp t mulled/ov-1st-line/mod-hook-fn nil remove-end remove-len mulled/ov-1st-line/\.str-to-be-modified] 8 nil "r"])
(defalias 'mulled/mod-hook-fix/run-orig-replace-match #[(newtext &optional fixedcase literal string subexp) "\306`!\307\310!\203 \311!\203 \312\301!\203& 	\203& \n\f%\202^ \212\310\224b\210\313 )\212\310\225b\210\313 )\307\310!G\314\315$\210\n\f%\210\314\316%+)\207" [ov run-orig-delete-region-fn-p mulled/mod-hook-fix/orig-replace-match-fn newtext fixedcase literal mulled/ov-1st-line/find-at match-string 0 mulled/ov-1st-line/ov-1st-line-p boundp point-marker mulled/ov-1st-line/mod-hook-fn nil t string subexp match-beg match-end len-removed] 6])
(defalias 'mulled/mod-hook-fix/run-with-mod-hook-fix #[(fn) "\304K\305K\306K\307\216\304\310M\210\305\311M\210\306\312M\210 ,\207" [mulled/mod-hook-fix/orig-replace-match-fn mulled/mod-hook-fix/orig-delete-region-fn mulled/mod-hook-fix/orig-insert-fn fn insert delete-region replace-match ((byte-code "\303M\210\304	M\210\305\nM\207" [mulled/mod-hook-fix/orig-insert-fn mulled/mod-hook-fix/orig-delete-region-fn mulled/mod-hook-fix/orig-replace-match-fn insert delete-region replace-match] 2)) mulled/mod-hook-fix/run-orig-insert mulled/mod-hook-fix/run-orig-delete-region mulled/mod-hook-fix/run-orig-replace-match] 3])
(defalias 'mulled/experimental/install-yas-support-aux #[nil "\300\301\302\"\210\303\304\305\306\307$\210\310\304!\210\303\311\312\313\307$\210\310\311!\210\303\314\315\313\307$\210\303\316\317\313\307$\210\310\316!\207" [remove-hook yas/minor-mode-hook mulled/experimental/install-yas-support-aux ad-add-advice yas/expand-snippet (mulled/yas-hook-fn nil t (advice lambda (template &optional start end expand-env) (let ((ov (mulled/ov-1st-line/find-at (point)))) (when (and ov (string= ad-return-value "[yas] snippet expanded.")) (let* ((remove-at (cdr (nth 2 buffer-undo-list))) (remove-str (car (nth 2 buffer-undo-list))) (remove-len (length (car (nth 2 buffer-undo-list)))) (insert-beg (car (nth 1 buffer-undo-list))) (insert-end (cdr (nth 1 buffer-undo-list))) (insert-len (- insert-end insert-beg)) (edit-trailing-edges-p (mulled/ov-1st-line/edit-trailing-edges-p ov))) (setq mulled/ov-1st-line/\.str-to-be-modified remove-str) (mulled/ov-1st-line/mod-hook-fn ov t (+ remove-at (if edit-trailing-edges-p insert-len 0)) (+ remove-at (if edit-trailing-edges-p insert-len 0)) remove-len) (mulled/ov-1st-line/mod-hook-fn ov nil insert-beg insert-beg) (mulled/ov-1st-line/mod-hook-fn ov t insert-beg insert-end 0)))))) after nil ad-activate yas/skip-and-clear (mulled/yas/skip-and-clear-hook-fn nil t (advice lambda (field) (mulled/mod-hook-fix/run-with-mod-hook-fix (lambda nil ad-do-it)))) around yas/mirror-update-display (mulled/yas/mirror-update-display-hook-fn nil t (advice lambda (mirror field) (mulled/mod-hook-fix/run-with-mod-hook-fix (lambda nil ad-do-it)))) yas/on-field-overlay-modification (mulled/turn-on-yas/mirror-update-display nil t (advice lambda (overlay after\? beg end &optional length) (ad-enable-advice 'yas/mirror-update-display 'around 'mulled/yas/mirror-update-display-hook-fn) (ad-activate 'yas/mirror-update-display) (unwind-protect ad-do-it (ad-disable-advice 'yas/mirror-update-display 'around 'mulled/yas/mirror-update-display-hook-fn) (ad-activate 'yas/mirror-update-display))))] 5])
(defalias 'mulled/experimental/install-yas-support #[nil "\300\301!\203	 \302 \207\303\304\302\"\207" [featurep yasnippet mulled/experimental/install-yas-support-aux add-hook yas/minor-mode-hook] 3])
