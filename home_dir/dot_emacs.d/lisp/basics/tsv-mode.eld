;ELC   
;;; Compiled by tpalacio@tpalacio.vm.ny4dev.etsy.com on Mon Aug 12 15:43:39 2013
;;; from file /home/tpalacio/.emacs.d/lisp/basics/tsv-mode.el
;;; in Emacs version 24.3.1
;;; with all optimizations.

;;; This file uses dynamic docstrings, first added in Emacs 19.29.

;;; This file does not contain utf-8 non-ASCII characters,
;;; and so can be loaded in Emacs versions earlier than 23.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(byte-code "\300\301!\210\302\303\304\305\306\307%\207" [provide tsv-mode custom-declare-group TSV nil "Major mode for editing tab separate files" :group convenience] 6)
(defvar tsv-separator-list '("	" ":" "," ";" " "))
(defvar tsv-comment-char "#")
(defvar tsv-col-separator " ")
(defvar tsv-elide-string ">")
(defvar tsv-write-annotation t)
(defvar tsv-separator-char nil)
(defvar tsv-formatter nil)
(defvar tsv-column nil)
(defvar tsv-has-header-p nil)
(defvar tsv-table nil)
#@93 A list of column information.
 (column-name curr-width min-width max-width aver-width show)
(defvar tsv-header nil (#$ . 1020))
#@30 Keymap for `tsv-normal-mode'
(defvar tsv-normal-mode-map (byte-code "\301 \302\303\304#\210\302\305\306#\210\302\307\310#\210\302\311\312#\210\302\313\314#\210\302\315\316#\210\302\317\320#\210)\207" [map make-sparse-keymap define-key "" #[nil "\300\301!\207" [tsv-normal-mode -1] 2 nil nil] "	" tsv-normal-next-field [backtab] tsv-normal-prev-field "" tsv-normal-end-of-field/line "" tsv-normal-beginning-of-field/line "" tsv-scroll-up [246] tsv-scroll-down] 4) (#$ . 1154))
#@23 Keymap for `tsv-mode'
(defvar tsv-mode-map (byte-code "\301 \302\303\304#\210\302\305\306#\210\302\307\310#\210\302\311\312#\210\302\313\314#\210\302\315\316#\210\302\317\320#\210\302\321\322#\210\302\323\324#\210\302\325\326#\210\302\327\330#\210\302\331\332#\210\302\333\334#\210\302\335\336#\210\302\337\340#\210\302\341\342#\210\302\343\344#\210\302\345\346#\210\302\347\350#\210\302\351\352#\210\302\353\354#\210\302\355\356#\210\302\357\360#\210\302\361\362#\210\302\363\364#\210\302\365\366#\210\302\367\370#\210\302\371\372#\210)\207" [map make-sparse-keymap define-key "" tsv-scroll-up "\366" tsv-scroll-down "j" next-line "k" previous-line "	" tsv-next-field [backtab] tsv-prev-field ">" tsv-widen-column "<" tsv-narrow-column "<" tsv-narrow-to-min ">" tsv-widen-to-max "" tsv-set-column-width "" tsv-set-all-column-width "s" tsv-show-field-at-point "w" tsv-copy-field-at-point "" tsv-edit-field-at-point "" tsv-kill-line "" tsv-yank "" tsv-kill-region "\367" tsv-kill-ring-save "H" tsv-hide-column "S" tsv-show-column "Q" tsv-exit "" tsv-normal-mode "\f" tsv-sort-lines-region "" tsv-sort-column "" tsv-revert-with-separator "nn" tsv-narrow-to-region "nw" tsv-widen] 4) (#$ . 1650))
(byte-code "\300\301\302\303#\210\300\304\302\305#\210\300\306\302\303#\210\300\307\302\310#\210\311\312N\204& \300\311\312\313\314!#\210\315\316!\2042 \300\316\317\320#\210\300\207" [put tsv-separator-char safe-local-variable stringp tsv-header listp tsv-comment-char tsv-has-header-p symbolp tsv-mode-hook variable-documentation purecopy "Hook run when entering TSV mode.\nNo problems result if this variable is not bound.\n`add-hook' automatically binds it.  (This is true for all hook variables.)" boundp tsv-mode-map definition-name tsv-mode] 5)
(defvar tsv-mode-map (make-sparse-keymap))
(byte-code "\300\301N\204 \302\300\301\303\304!#\210\305\306!\204 \302\306\307\310#\210\300\207" [tsv-mode-map variable-documentation put purecopy "Keymap for `tsv-mode'." boundp tsv-mode-syntax-table definition-name tsv-mode] 5)
(defvar tsv-mode-syntax-table (make-syntax-table))
(byte-code "\300\301N\204 \302\300\301\303\304!#\210\302\305\306\307#\207" [tsv-mode-syntax-table variable-documentation put purecopy "Syntax table for `tsv-mode'." tsv-mode-abbrev-table definition-name tsv-mode] 5)
(defvar tsv-mode-abbrev-table (progn (define-abbrev-table 'tsv-mode-abbrev-table nil) tsv-mode-abbrev-table))
(byte-code "\300\301N\204 \302\300\301\303\304!#\210\302\305\306\307#\207" [tsv-mode-abbrev-table variable-documentation put purecopy "Abbrev table for `tsv-mode'." tsv-mode derived-mode-parent nil] 5)
#@187 Major mode for edit or view tsv file. If change major mode, don't
change it directly.

This mode runs the hook `tsv-mode-hook', as the final step
during initialization.

\{tsv-mode-map}
(defalias 'tsv-mode #[nil "\306\300!\210\307\310 \210\311\312\313!\210\314\f!\210\306\315!\210\306\316!\210\306\317!\210\306\320!\210\306\321!\210\306\322!\210\323\306\324!\210\323\325 \210\307\211\306\326!\210\327\326\330\"\210\307)\331\332!\207" [delay-mode-hooks major-mode mode-name tsv-mode-map tsv-mode-syntax-table tsv-mode-abbrev-table make-local-variable t kill-all-local-variables tsv-mode "TSV" use-local-map set-syntax-table tsv-formatter tsv-column tsv-write-annotation tsv-separator-char tsv-table tsv-header nil tsv-has-header-p tsv-read buffer-file-format add-to-list tsv run-mode-hooks tsv-mode-hook local-abbrev-table buffer-read-only buffer-undo-list truncate-lines] 4 (#$ . 4308) nil])
(defalias 'tsv-revert-with-separator #[(sep) "\306\211\306\307\310 \210\311\f!\210\312!)\207" [tsv-header tsv-has-header-p header-line-format inhibit-read-only buffer-file-name sep nil t erase-buffer insert-file-contents-literally tsv-read] 3 nil "cWhich separator: "])
#@29 Detect `tsv-separator-char'
(defalias 'tsv-detect-separator #[nil "\212\306\307\211\211\211\211\310\311 \312 \"\313y\210\310`\312 \"\314\n\231\203\\ \f\204~ \203~ @A\315\"G\315\n\"GU\203' \313V\203' \316\211\202( \f\204~ \203~ @A\315\"G\313V\203\\ \316\211\203` \f\203\206 \202\210 @.\207" [tsv-separator-list len line2 line1 done sep 0 nil buffer-substring-no-properties line-beginning-position line-end-position 1 "" split-string t i seps len1 len2] 8 (#$ . 5498)])
#@48 Execute BODY, preserving buffer modified flag.
(defalias 'save-buffer-modified-p '(macro . #[(&rest body) "\301\302\303B\304BBB\207" [body let ((modified-p (buffer-modified-p))) progn ((set-buffer-modified-p modified-p))] 4 (#$ . 6022)]))
#@41 Execute BODY, preserving line position.
(defalias 'save-tsv-position '(macro . #[(&rest body) "\301\302\303B\304BBB\207" [body let ((line (line-number-at-pos)) (col (current-column))) progn ((goto-line line) (move-to-column col))] 4 (#$ . 6268)]))
(defalias 'tsv-col-name #[(col &optional arg) "\203	 	\302I\207	\302H\207" [arg col 0] 3])
(put 'tsv-col-name 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-col-index #[(col &optional arg) "\203	 	\302I\207	\302H\207" [arg col 1] 3])
(put 'tsv-col-index 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-col-current-width #[(col &optional arg) "\203	 	\302I\207	\302H\207" [arg col 2] 3])
(put 'tsv-col-current-width 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-col-min-width #[(col &optional arg) "\203	 	\302I\207	\302H\207" [arg col 3] 3])
(put 'tsv-col-min-width 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-col-max-width #[(col &optional arg) "\203	 	\302I\207	\302H\207" [arg col 4] 3])
(put 'tsv-col-max-width 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-col-average-width #[(col &optional arg) "\203	 	\302I\207	\302H\207" [arg col 5] 3])
(put 'tsv-col-average-width 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-col-show-p #[(col &optional arg) "\203	 	\302I\207	\302H\303=\207" [arg col 6 show] 3])
(put 'tsv-col-show-p 'byte-optimizer 'byte-compile-inline-expand)
#@37 Indicate whether the column is hide
(defalias 'tsv-col-hide-p #[(col) "\302	\203 \303	I\202 \303H\304=*?\207" [col arg nil 6 show] 3 (#$ . 7694)])
(put 'tsv-col-hide-p 'byte-optimizer 'byte-compile-inline-expand)
#@37 The column names current displaying
(defalias 'tsv-cols #[(&optional predicate) "\302\303\203 \304	\"\202 	\"\207" [predicate tsv-header mapcar tsv-col-name remove-if-not] 5 (#$ . 7920)])
(put 'tsv-cols 'byte-optimizer 'byte-compile-inline-expand)
#@47 Return the index of the column with name NAME
(defalias 'tsv-col-find-index #[(name) "\305\n@\nA	\305\203 	\306I\202 	\306H*\f\230\203 	\2059 	\305\2035 	\307I\2028 	\307H**\207" [tsv-header col cols arg name nil 0 1] 3 (#$ . 8178)])
#@21 Delete current line
(defalias 'tsv-delete-line #[nil "\300 \301 T|\207" [line-beginning-position line-end-position] 2 (#$ . 8434)])
(put 'tsv-delete-line 'byte-optimizer 'byte-compile-inline-expand)
#@87 Return `split-string' result of the current line with separator `tsv-separator-char'.
(defalias 'tsv-line-content #[nil "\301\302\303 \304 \"\"\207" [tsv-separator-char split-string buffer-substring-no-properties line-beginning-position line-end-position] 4 (#$ . 8639)])
(defalias 'tsv-line-number-at-pos #[(&optional pos) "\204 `\214~\210\301!S)\207" [pos line-number-at-pos] 2])
(put 'tsv-line-number-at-pos 'byte-optimizer 'byte-compile-inline-expand)
#@80 Set the Nth element of ROW to elm. Adjust max or min column width
if necessary
(defalias 'tsv-row-set #[(row n elm) "	GW\203\345 \nG	\2338\fG\306\211@G\f\230?\205\342 \307\310!\210\211\306\203I \311I\202M \311H*]\203c \311I\202g \311H*\210\211\306\203 \312I\202\203 \312H*^\203\231 \312I\202\235 \312H*\210\306\203\270 \313I\202\274 \313H*_Z\\\245\203\330 \313I\202\334 \313H*\210\f\240.\207\314\315	#\207" [n row tsv-table tsv-header elm oldlen nil set-buffer-modified-p t 4 3 5 error "Args %d out of range: %S" old len col pos nrow arg] 6 (#$ . 9106)])
#@29 Redisplay the line at point
(defalias 'tsv-update-at-point #[nil "\306 i\307`\302\"\310\311 \312 T|\210\n\313\314\315\316\f#\317Q\302\n#c)\210\320y\210\321!\210+\322!)\207" [modified-p inhibit-read-only row col tsv-formatter tsv-col-separator buffer-modified-p get-text-property t line-beginning-position line-end-position propertize " " mapconcat #[(frt) "\302@	8A\"\207" [frt row tsv-format-string] 3] "\n" -1 move-to-column set-buffer-modified-p] 6 (#$ . 9787)])
#@24 All rows in the region
(defalias 'tsv-rows-in-region #[(beg end) "\303\212	b\210`\nW\203 \304`\305\"B\306y\210\202 )\237)\207" [rows beg end nil get-text-property row 1] 3 (#$ . 10269)])
#@42 Insert contents in `tsv-table' to buffer
(defalias 'tsv-format-buffer #[nil "\305\306!\210\307 \310 i\311\312 \210\313\314\f\"\210)\315\n!\210\316	!\210*\317!\210)\305\320!\207" [modified-p col line inhibit-read-only tsv-table message "wait for formating..." buffer-modified-p line-number-at-pos t erase-buffer mapc tsv-format-line goto-line move-to-column set-buffer-modified-p "format done!"] 3 (#$ . 10468) nil])
#@38 Redisplay the rows in current buffer
(defalias 'tsv-redisplay-table #[nil "\306\307!\210\310 \311 i\312eb\210m\2046 \313`\304\"\314 \315 T|\210\f\316\317\320\321#\322Q\304\f#c)\210\202 )\323\n!\210\324	!\210*\325!\210)\306\326!\207" [modified-p col line inhibit-read-only row tsv-formatter message "wait for formating..." buffer-modified-p line-number-at-pos t get-text-property line-beginning-position line-end-position propertize " " mapconcat #[(frt) "\302@	8A\"\207" [frt row tsv-format-string] 3] "\n" goto-line move-to-column set-buffer-modified-p "format done!" tsv-col-separator] 6 (#$ . 10895)])
#@20 Format header line
(defalias 'tsv-header-line #[nil "\303\203	 \304\202\n \305\306\"\307\310	\n#P\207" [scroll-bar-mode tsv-formatter tsv-col-separator make-string 4 2 32 mapconcat #[(frt) "\304@	8\305\n\203 \306\nI\202 \306H*A\"\207" [frt tsv-header arg col tsv-format-string nil 0] 4]] 5 (#$ . 11519)])
(put 'tsv-header-line 'byte-optimizer 'byte-compile-inline-expand)
#@92 Compile `tsv-header'. This function set `tsv-column',
`tsv-formatter', header-line-format.
(defalias 'tsv-compile-format #[nil "\306\307\211\211\306\306\306\211\203\211 @\211\306\203, \n\310I\2021 \n\310H\311=*\203\200 \312\f\n\306\203I \n\313I\202L \n\313H*\n\306\203_ \n\314I\202b \n\314H*BC\"\n\306\203z \n\314I\202} \n\314H*\\A\211\204 *\f\315\203\226 \316\202\227 \314\317\"\320\321#PG\fGS_\\\322\307\"\f\306\211\205>@\nT	\nI\210AS\307W\203\362 \323	\313#\324ZI\210T\211\202\325 *	A\\\211W\2034G	\307I\210S\307W\203/\323	\313#\324ZI\210T\211\202*	\\A\211\204\274 \306.\207" [j i col len formatter tsv-formatter nil 0 6 show append 1 2 make-string 4 32 mapconcat #[(frt) "\304@	8\305\n\203 \306\nI\202 \306H*A\"\207" [frt tsv-header arg col tsv-format-string nil 0] 4] make-vector + -1 tsv-header --dolist-tail-- arg scroll-bar-mode tsv-col-separator header-line-format tsv-column frt v --dotimes-limit--] 7 (#$ . 11906)])
#@113 If STR longer than COL, substitude exceed charactors with
`tsv-elide-string'. Other wise use blank to fill it.

(defalias 'tsv-format-string #[(str col) "G	V\203 \303	\nGZO\nP\207\304\305\306	!\307Q\"\207" [str col tsv-elide-string 0 format "%-" number-to-string "s"] 4 (#$ . 12984)])
#@28 Convert ROW to raw format.
(defalias 'tsv-stringfy-row #[(row) "\302\303	#\207" [tsv-header tsv-separator-char mapconcat #[(col) "\303	\203 \304	I\202 \304H*\n8\207" [col arg row nil 1] 3]] 4 (#$ . 13279)])
(put 'tsv-stringfy-row 'byte-optimizer 'byte-compile-inline-expand)
#@41 Convert ROW to the format to be display
(defalias 'tsv-format-line #[(row) "\303\304\305\306	#\307Q\302\n#c\207" [tsv-formatter tsv-col-separator row propertize " " mapconcat #[(frt) "\302@	8A\"\207" [frt row tsv-format-string] 3] "\n"] 6 (#$ . 13568)])
(put 'tsv-format-line 'byte-optimizer 'byte-compile-inline-expand)
#@72 Delete DELS from LIST. DELS should have the same order as in the
LIST.
(defalias 'tsv-delete-list #[(list dels) "\305	\305\211\203% @\211\f@=\203 \fA\202 \nBA\211\204\n *\237)\207" [new list elm --dolist-tail-- dels nil] 3 (#$ . 13898)])
#@210 Replace the list from FROM to TO with REPLACE by side effect. If FROM is 0,
the REPLACE is NOT done, therefore write
 `(setq foo (tsv-splice-list foo from to replace))'
to be sure of change the value of foo.

(defalias 'tsv-splice-list #[(list from to replace) "\304W\203\n \305\306!\207\304U\203 \307	\n\233\"\207S\233\307	\n\233\"\241\210\207" [from replace to list 0 error "Args out of range" append] 5 (#$ . 14156)])
#@63 Scan table to get max, min and average length of every column
(defalias 'tsv-scan-table #[nil "\306G\307\"\310\311\211\211\211\311\211\203; @A@\307T\312\313\"\210A\211\204 *\314\315\316\311\"#.\207" [tsv-header i len tmp tmph nrow make-vector 0 0.0 nil mapc #[(col) "G\n\211\306\203 \307I\202 \307H*	^\203& \307I\202) \307H*\210\n\211\306\203; \310I\202> \310H*	]\203N \310I\202Q \310H*\210\f\fH	\\I\210T	@	A\211	\207" [col len tmp arg tlen i nil 3 4 tmph] 4] mapl #[(col len) "@	@\n\245\203 \304I\202 \304H*\207" [col len nrow arg 5] 3] append tlen tsv-table row --dolist-tail--] 7 (#$ . 14591)])
#@117 Write the table to file or BUF. If `tsv-write-annotation' is
non-nil, the file variables will record at first line.
(defalias 'tsv-write #[(from to buf) "\306\214	\n}\210\307 \210rq\210\f\205 \310\311&\205- \310\312\313\314#\"\313\315\316#Q)c\210d*\207" [inhibit-read-only from to buf tsv-write-annotation tsv-comment-char t erase-buffer format "%s -*- mode: tsv; tsv-header: %S; tsv-separator-char: %S; tsv-comment-char: %S; tsv-has-header-p: %S -*-\n" "%s\n" mapconcat tsv-col-name tsv-stringfy-row "\n" tsv-header tsv-separator-char tsv-has-header-p tsv-table] 7 (#$ . 15277)])
(add-to-list 'format-alist '(tsv "Table mode" ". -\\*- mode: tsv; tsv-hader:" nil tsv-write t nil))
(defalias 'tsv-read #[(&optional sep) "\306\307\310\211\310\311 \212\312 \210eb\210\313\314!\203 \310y\210\203) \315!\202+ \316 \2049 \317\320\321 \"\203A \310y\210Gm\204g \321 	GU\204] \322\323\324 `\325 {#\210\fB\326y\210\202E eb\210\313\314!\203w \327 \325 T|\210\203\203 \327 \325 T|\210\f\237\330 \210\331 \210\332 \210)\333!-\207" [row len i inhibit-read-only tsv-table modified-p t 0 nil buffer-modified-p hack-local-variables looking-at ". -\\*- mode: tsv" string tsv-detect-separator mapcar #[(col) "T	G\303\304\305\"S\n\211\211\211\306&\207" [i col len vector format "col%d" show] 8] tsv-line-content error "Line columns not fit at line %d %s" line-number-at-pos line-end-position 1 line-beginning-position tsv-scan-table tsv-compile-format tsv-format-buffer set-buffer-modified-p sep tsv-separator-char tsv-header tsv-has-header-p] 5])
(defalias 'tsv-kill-line #[(arg) "\306 \203 \307\310!!\210\202B m\203 \311\312\313\"\210\212\314 \210`)\212\n\204( \315	w\210`	U)\2047 \203> n\203> \307\316!\210\202A 	b\210)`\317\313	W\203\\ 	)\320	\"\321\f\"\322\323\324\f\325#!\210	|,\207" [arg end show-trailing-whitespace kill-whole-line rows inhibit-read-only line-beginning-position forward-visible-line prefix-numeric-value signal end-of-buffer nil end-of-visible-line " 	" 1 t tsv-rows-in-region tsv-delete-list kill-new mapconcat tsv-stringfy-row "\n" beg tmp tsv-table] 5 nil "p"])
(defalias 'tsv-kill-region #[(beg end) "\212b\210\302\303	!\303!Z!)\207" [beg end tsv-kill-line line-number-at-pos] 4 nil "r"])
(defalias 'tsv-kill-ring-save #[(beg end) "\306\307\310\311	\"\312#!\210\313\204 \n\205\207 \f\314=\203\" \242\314=\202# \f\203[ \315 \203[ \316 \203[ \203> \317\320\"\210\313\202[ \321 \322 U\204[ \323\320!\204R \324\320!\204[ \317\320\321 \322 {\"\210\n\204w \325=\204q \242\314=\203w A\204w \313\211\202\207 \242\314=\203\201 A\313\326\327!)\207" [beg end force transient-mark-mode select-active-regions saved-region-selection kill-new mapconcat tsv-stringfy-row tsv-rows-in-region "\n" nil only region-active-p display-selections-p x-set-selection PRIMARY region-beginning region-end x-selection-owner-p x-selection-exists-p lambda run-hooks deactivate-mark-hook mark-active] 6 nil "r"])
(defalias 'tsv-yank #[(arg) "\306<\203\n \307\202 \310=\203 \311\202 S!	G\214~\210\312`\214~\210\313\n!S+\314\315\307G\312$\210\316\317\320\321\"\"\322\n\211$\323 \210\324\325\",\207" [arg tsv-header pos inhibit-read-only len rows current-kill 0 - -2 nil line-number-at-pos t remove-text-properties mapcar #[(row) "\303	\"\211G\nU\204 \304\305\"\210\207" [row tsv-separator-char len split-string error "length of row not match: %S"] 4] split-string "\n" tsv-splice-list beginning-of-line mapc tsv-format-line tsv-table] 5 nil "P"])
#@58 Return the current column of point. Adjust it if needed.
(defalias 'tsv-current-column #[nil "iS\211\302W\203 \302\202 	GY\203 	GS\202 )\207" [col tsv-column 0] 3 (#$ . 18838)])
(put 'tsv-current-column 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-row-at-point #[nil "\300`\301\"\207" [get-text-property row] 3])
(put 'tsv-row-at-point 'byte-optimizer 'byte-compile-inline-expand)
(defalias 'tsv-col-name-at-point #[nil "\303 8\304	\203 \n\305	I\202 \n\305H*\207" [tsv-header arg col tsv-col-index-at-point nil 0] 3])
(put 'tsv-col-name-at-point 'byte-optimizer 'byte-compile-inline-expand)
#@63 Field name in the `tsv-formatter' according to current column
(defalias 'tsv-col-index-at-point #[nil "iS\211\304W\203 \304\202 	GY\203 	GS\202 )\305	H\211\304W\203/ 	\n\\H\n\304V\205: \nS8@*\207" [col tsv-column field tsv-formatter 0 nil] 4 (#$ . 19462)])
#@25 Echo the field content.
(defalias 'tsv-show-field-at-point #[nil "\304 \211\205% \305\306	8\307\n\203 \310\nI\202 \310H*\311`\312\"8#)\207" [idx tsv-header arg col tsv-col-index-at-point message "%s: %s" nil 0 get-text-property row] 8 (#$ . 19739) nil])
#@45 Add the content of this column to kill ring
(defalias 'tsv-copy-field-at-point #[nil "\302 \211\205# \303`\304\"8	\305=\203 \306\307\"\210\202  \310!\210\311!)\207" [field last-command tsv-col-index-at-point get-text-property row kill-region kill-append nil kill-new message] 5 (#$ . 20008) nil])
(defalias 'tsv-edit-field-at-point #[nil "\302 \303`\300\"\304	\305\306	8\"#\210\307 *\207" [row field tsv-col-index-at-point get-text-property tsv-row-set read-from-minibuffer "Set to: " tsv-update-at-point] 7 nil nil])
#@26 Jump the next ARG fields
(defalias 'tsv-next-field #[(arg) "\305W\203 \306[!\207iS\211\305W\203 \305\202& 	\nGY\203% \nGS\202& 	)\nGS\307\n	H\211\305W\203< 	\\\305V\203b 	\fW\203N 	T\202S \307y\210\305\n	H\305V\203< S\211\202= \310	T!+\207" [arg col tsv-column field len 0 tsv-prev-field nil move-to-column] 4 (#$ . 20543) "p"])
#@30 Jump the previous ARG fields
(defalias 'tsv-prev-field #[(arg) "\305W\203 \306[!\207iS\211\305W\203 \305\202& 	\nGY\203% \nGS\202& 	)\nGS\307\n	H\211\305W\203< 	\\\305V\203b 	\305V\203N 	S\202S \310y\210\f\n	H\305V\203< S\211\202= \311	T!+\207" [arg col tsv-column field len 0 tsv-next-field nil -1 move-to-column] 4 (#$ . 20894) "p"])
#@27 Set current column width.
(defalias 'tsv-set-column-width #[(width) "\305 8\211\n\203 \f\306I\202 \f\306H*\210\307 \210\310 )\207" [tsv-header field width arg col tsv-col-index-at-point 2 tsv-compile-format tsv-redisplay-table] 4 (#$ . 21252) "nSet to width: "])
#@34 Widen the current column by ARG.
(defalias 'tsv-widen-column #[(arg) "\304 8\305\n	\306\n\203 \307\nI\202 \307H*\\!)\207" [tsv-header field arg col tsv-col-index-at-point tsv-set-column-width nil 2] 5 (#$ . 21529) "p"])
#@35 Narrow the current column by ARG.
(defalias 'tsv-narrow-column #[(arg) "\301[!\207" [arg tsv-widen-column] 2 (#$ . 21763) "p"])
#@70 Set current column width to the min length of element is this column
(defalias 'tsv-narrow-to-min #[nil "\304 8\305	\306\n\203 \307\nI\202 \307H*!)\207" [tsv-header field arg col tsv-col-index-at-point tsv-set-column-width nil 3] 4 (#$ . 21898) nil])
#@70 Set current column width to the max length of element is this column
(defalias 'tsv-widen-to-max #[nil "\304 8\305	\306\n\203 \307\nI\202 \307H*!)\207" [tsv-header field arg col tsv-col-index-at-point tsv-set-column-width nil 4] 4 (#$ . 22163) nil])
#@31 Set all column width to WIDTH
(defalias 'tsv-set-all-column-width #[(width) "\305\211\203& \n@\211\f\203 	\306\fI\202 	\306H*\210\nA\211\204 *\307 \210\310 \207" [tsv-header col --dolist-tail-- width arg nil 2 tsv-compile-format tsv-redisplay-table] 4 (#$ . 22427) "nSet all column to width: "])
(defalias 'tsv-hide-column #[(col) "\303!	8\304\n\203 \305\nI\202 \305H\306=*\210\307 \210\310 \207" [col tsv-header arg tsv-col-find-index hide 6 show tsv-compile-format tsv-redisplay-table] 3 nil (list (completing-read "Hide column: " (tsv-cols 'tsv-col-show-p) nil t (tsv-col-name-at-point)))])
#@23 Show the hided column
(defalias 'tsv-show-column #[(col) "\303=\203\n \304\305!\207\306!	8\307\n\203 \310\nI\202\" \310H\307=*\210\311 \210\312 \207" [col tsv-header arg none message "No hiden columns!" tsv-col-find-index show 6 tsv-compile-format tsv-redisplay-table] 3 (#$ . 23045) (list (let ((hides (tsv-cols 'tsv-col-hide-p))) (if hides (completing-read "Add new field: " hides nil t (car hides)) 'none)))])
#@288 Sort lines in the region in the column COL. The sort method can be
"n" if by numeric or "a" if by alpha. A customized function can be
specific by select "o". The function should accept two arguments
which type is string, for example `string<'. With a prefix to sort the
lines descendly.
(defalias 'tsv-sort-lines-region #[(beg end col numericp desc) "\306	\"\307\n!\310\311\211#$%\312\230\203$ \313\314\315&\316\310$!\202= %\317\230\203/ \320\202= %\321\230\203: \322\202= \323\324!'\325\232\203I \326\202J \327\330$\"$\331(\211)\204_ `)\214~\210\332)!S*	\211)\204r `)\214~\210\332)!S*$$(\332 i*b\210\333 	b\210\334\335!\204\227 \336y\210`|\210\337\340$\"\210\341*!\210\342\n!.\207" [beg end col predicate func inhibit-read-only tsv-rows-in-region tsv-col-find-index t nil "o" intern-soft completing-read "Choose a sort function: " #[(sym) "\301\302!!\207" [sym fboundp intern-soft] 3] "n" #[(n1 n2) "\302!\302	!W\207" [n1 n2 string-to-number] 3] "a" string< error "Unknown sort method" "d" #[(r2 r1) "	\n8	8\"\207" [func idx r1 r2] 4] #[(r1 r2) "	\n8	8\"\207" [func idx r1 r2] 4] sort tsv-splice-list line-number-at-pos line-beginning-position looking-at "^" 1 mapc tsv-format-line goto-line move-to-column idx rows numericp obarray desc tsv-table pos line] 7 (#$ . 23472) (list (region-beginning) (region-end) (completing-read "Sort column: " (tsv-cols 'tsv-col-show-p) nil t (tsv-col-name-at-point)) (completing-read "Sorting method: [n]=numeric [a]=alpha [o]=other: " '("n" "a" "o") nil t "n") current-prefix-arg)])
#@288 Sort COL. The sort method can be "n" if by numeric or "a"
if by alpha. A customized function can be specific by select
"o". The function should accept two arguments which type is
string, for example `string<'. With a prefix to sort the lines
descendly.

See also `tsv-sort-lines-region'
(defalias 'tsv-sort-column #[(col numericp desc) "\303ed	\n%\207" [col numericp desc tsv-sort-lines-region] 6 (#$ . 25037) (list (completing-read "Sort column: " (tsv-cols 'tsv-col-show-p) nil t (tsv-col-name-at-point)) (completing-read "Sorting method: [n]=numeric [a]=alpha [o]=other: " '("n" "a" "o") nil t "n") (completing-read "Asc or Desc: [a]=asc [d]=desc: " '("a" "d") nil t "d"))])
#@135 Narrow to select lines. This may useful when visit a large file.
Don't use `widen' to show narrowing region, use `tsv-widen' instead.
(defalias 'tsv-narrow-to-region #[(beg end) "b\210\302 	b\210\303\304!\204 \305y\210`	}\207" [beg end line-beginning-position looking-at "^" 1] 2 (#$ . 25723) "r"])
(defalias 'tsv-widen 'tsv-format-buffer "Remove restrictions from current buffer. ")
#@41 Scroll up without change current column
(defalias 'tsv-scroll-up #[(&optional arg) "i\302	!\210\303!)\207" [col arg scroll-up move-to-column] 2 (#$ . 26118) "P"])
#@43 Scroll down without change current column
(defalias 'tsv-scroll-down #[(&optional arg) "i\302	!\210\303!)\207" [col arg scroll-down move-to-column] 2 (#$ . 26289) "P"])
#@188 Typically, when you enter `tsv-mode' first time, the first
line is not use as header. So use this command when need. If you don't
want it, you can restore it by `tsv-restore-first-line'.
(defalias 'tsv-first-line-as-header #[nil "\203 \306\307!\207\310 \n@\311\nA\212\214~\210eb\210\312 \313 T|\210*\203R @@\203@ \314I\202D \314H*\210AA\211\204) \311\315\203^ \316\202_ \317\320\"\321\322#P+\323	!)\207" [tsv-has-header-p modified-p tsv-table tsv-header inhibit-read-only tmp message "Already use first line as header!" buffer-modified-p t line-beginning-position line-end-position 0 make-string 4 2 32 mapconcat #[(frt) "\304@	8\305\n\203 \306\nI\202 \306H*A\"\207" [frt tsv-header arg col tsv-format-string nil 0] 4] set-buffer-modified-p header arg col scroll-bar-mode tsv-formatter tsv-col-separator header-line-format] 6 (#$ . 26467) nil])
(defalias 'tsv-restore-first-line #[nil "\203\216 \306\307	\"\310\311\312 \212\214~\210eb\210\f\313\314\315\316#\317Q\320#c)\210*\fB	\321\211 \203l  @\nT\322\323\n\"!!\203] \311!I\202a \311H*\210 A\211 \204= *\324\"\203w \325\202x \326\327\"\315\330#P#\331!\210)\321\211+\207\332\333!\207" [tsv-has-header-p tsv-header i inhibit-read-only header modified-p mapcar tsv-col-name t 0 buffer-modified-p propertize " " mapconcat #[(frt) "\302@	8A\"\207" [frt row tsv-format-string] 3] "\n" row nil format "col%d" make-string 4 2 32 #[(frt) "\304@	8\305\n\203 \306\nI\202 \306H*A\"\207" [frt tsv-header arg col tsv-format-string nil 0] 4] set-buffer-modified-p message "Not use first line as header!" tsv-formatter tsv-col-separator tsv-table col --dolist-tail-- arg scroll-bar-mode header-line-format] 7 nil nil])
(defalias 'tsv-exit #[nil "\306=\205! \307 \310edp#\210\311\312 \210\311\313\314\f\"\311\315	!)\207" [major-mode modified-p header-line-format buffer-undo-list buffer-file-format buffer-read-only tsv-mode buffer-modified-p tsv-write nil kill-all-local-variables delq tsv set-buffer-modified-p] 4 nil nil])
#@99 Non-nil if Tsv-Normal mode is enabled.
Use the command `tsv-normal-mode' to change this variable.
(defvar tsv-normal-mode nil (#$ . 28542))
(make-variable-buffer-local 'tsv-normal-mode)
#@52 A minor mode to edit table.
\{tsv-normal-mode-map}
(defalias 'tsv-normal-mode #[(&optional arg) "\306 	\307=\203 \n?\202 \310	!\311V\312=\203a \f\203a \n\203W \313 \314 #\315$\316 \210%\203? \317\320&'#\321\261\210\317\322\f\321#c\210\323#!\210)\315(\324!\210)\202a \325\326'!!\210\327$\330\331\n\203k \332\202l \333\"\210\334\335!\203\215 \306 \203\200 \306 \232\203\215 \336\337\n\203\212 \340\202\213 \341\"\210)\342 \210\n\207" [#1=#:last-message arg tsv-normal-mode major-mode tsv-table modified-p current-message toggle prefix-numeric-value 0 tsv-mode buffer-modified-p line-number-at-pos nil erase-buffer mapconcat tsv-col-name "\n" tsv-stringfy-row goto-line set-buffer-modified-p tsv-read string-to-char t run-hooks tsv-normal-mode-hook tsv-normal-mode-on-hook tsv-normal-mode-off-hook called-interactively-p any message "Tsv-Normal mode %sabled" "en" "dis" force-mode-line-update line buffer-read-only tsv-has-header-p tsv-header tsv-separator-char header-line-format] 4 (#$ . 28734) (list (or current-prefix-arg 'toggle))])
(byte-code "\301\302\303\304\211%\207" [tsv-normal-mode-map add-minor-mode tsv-normal-mode " Tn" nil] 6)
(defalias 'tsv-normal-next-field #[(arg) "\301W\203 \302[!\207m?\205' \301V\205' S\303\304w\210m\204 \305u\210\202 \207" [arg 0 tsv-normal-prev-field "^	\n" nil 1] 2 nil "p"])
(defalias 'tsv-normal-prev-field #[(arg) "\301W\203 \302[!\207\303\304x\210o?\205+ \301V\205+ So\204$ \305u\210\303\304x\210\202 \207" [arg 0 tsv-normal-next-field "^	\n" nil -1] 2 nil "p"])
#@92 Move to the end of current field. If the position doesn't change,
move to the end of line.
(defalias 'tsv-normal-end-of-field/line #[nil "`\301\302w\210`U\205 \302)\207" [pos "^	\n" nil] 2 (#$ . 30281) nil])
#@104 Move to the beginning of current field. If the position doesn't change,
move to the beginning of line.
(defalias 'tsv-normal-beginning-of-field/line #[nil "`\301\302x\210`U\205 \303 )\207" [pos "^	\n" nil beginning-of-line] 2 (#$ . 30500) nil])
