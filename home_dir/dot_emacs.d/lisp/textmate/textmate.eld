;ELC   
;;; Compiled by tpalacio@tpalacio.vm.ny4dev.etsy.com on Sat Jul 20 15:06:32 2013
;;; from file /home/tpalacio/.emacs.d/lisp/textmate/textmate.el
;;; in Emacs version 24.3.1
;;; with all optimizations.

;;; This file uses dynamic docstrings, first added in Emacs 19.29.

;;; This file does not contain utf-8 non-ASCII characters,
;;; and so can be loaded in Emacs versions earlier than 23.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'textmate-mode)
#@95 Non-nil if TexTMate mode is enabled.
Use the command `textmate-mode' to change this variable.
(defvar textmate-mode nil (#$ . 567))
(make-variable-buffer-local 'textmate-mode)
#@173 Toggle Textmate mode.
     With no argument, this command toggles the mode.
     Non-null prefix argument turns on the mode.
     Null prefix argument turns off the mode.

(defalias 'textmate-mode #[(&optional arg) "\304 	\305=\203 \n?\202 \306	!\307V\310\311\312\n\203  \313\202! \314\"\210\315\316!\203B \304 \2035 \304 \232\203B \317\320\n\203? \321\202@ \322\"\210)\323 \210\n\207" [#1=#:last-message arg textmate-mode skeleton-pair current-message toggle prefix-numeric-value 0 t run-hooks textmate-mode-hook textmate-mode-on-hook textmate-mode-off-hook called-interactively-p any message "TexTMate mode %sabled" "en" "dis" force-mode-line-update] 3 (#$ . 750) (list (or current-prefix-arg 'toggle))])
#@29 Keymap for `textmate-mode'.
(defvar textmate-mode-map (byte-code "\301\302!\203\f \202 <\203 \303!\202 \304\305\")\207" [m (([backspace] . textmate-backspace2) ("\"" . move-over-dbl-quote) ("'" . move-over-quote) (")" . move-over-bracket) ("]" . move-over-square) ("}" . move-over-curly) ("[" . skeleton-pair-insert-maybe) ("(" . skeleton-pair-insert-maybe) ("{" . skeleton-pair-insert-maybe)) keymapp easy-mmode-define-keymap error "Invalid keymap %S"] 3) (#$ . 1469))
(byte-code "\302\303\304\305\211%\210\306\305\207" [textmate-mode-map textmate-pairs add-minor-mode textmate-mode " TM" nil ((40 . 41) (39 . 39) (34 . 34) (91 . 93) (123 . 125))] 6)
(defalias 'is-empty-pair #[nil "\301`Sf\"A\302f=\207" [textmate-pairs assoc nil] 3 nil nil])
(defalias 'textmate-backspace2 #[nil "\300f\300=\204 \301 \203 \302\303!\210\304\303!\207" [nil is-empty-pair delete-char 1 delete-backward-char] 2 nil nil])
(byte-code "\302\303\304\207" [pushovers defaults ((34 lambda nil (forward-char 1)) (39 lambda nil (forward-char 1)) (41 lambda nil (up-list 1)) (93 lambda nil (up-list 1)) (125 lambda nil (up-list 1))) ((34 lambda nil (skeleton-pair-insert-maybe nil)) (39 lambda nil (skeleton-pair-insert-maybe nil)) (41 lambda nil (insert-char 41 1)) (93 lambda nil (insert-char 93 1)) (125 lambda nil (insert-char 125 1))) nil] 1)
(defalias 'move-over #[(char) "\303f=\203 \304	\"A \207\304\n\"A \207" [char pushovers defaults nil assoc] 3])
(defalias 'move-over-bracket #[nil "\300\301!\207" [move-over 41] 2 nil nil])
(defalias 'move-over-curly #[nil "\300\301!\207" [move-over 125] 2 nil nil])
(defalias 'move-over-square #[nil "\300\301!\207" [move-over 93] 2 nil nil])
(defalias 'move-over-quote #[nil "\300\301!\207" [move-over 39] 2 nil nil])
(defalias 'move-over-dbl-quote #[nil "\300\301!\207" [move-over 34] 2 nil nil])
