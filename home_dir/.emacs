(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(let ((default-directory "~/.emacs.d/lisp/"))
(normal-top-level-add-subdirs-to-load-path))

;; split window
(global-set-key (kbd "\C-x _") 'split-window-vertically)
(global-set-key (kbd "\C-x |") 'split-window-horizontally)

;; ack-and-a-half
(add-to-list 'load-path "~/.emacs.d/elpa/ack-and-a-half-1.1.3/")
(require 'ack-and-a-half)
;; create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same) ;; same file type as buffer
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; highlight indentations
;; (require 'highlight-indentation)
;; (add-hook 'python-mode-hook 'highlight-indentation-mode)
;; (add-hook 'js2-mode-hook 'highlight-indentation-mode)
;; (add-hook 'sql-mode-hook 'highlight-indentation-mode)
;; (add-hook 'scala-mode-hook 'highlight-indentation-mode)
;; set color for highlight indent
;; (set-face-background 'highlight-indentation-face "gray13")
;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; buffer tweak
(require 'bs)
(global-set-key "\C-x\C-b" 'bs-show)

;; tsv mode
(require 'tsv-mode)
(autoload 'tsv-mode "tsv-mode" "A mode to edit table like file" t)
(autoload 'tsv-normal-mode "tsv-mode" "A minor mode to edit table like file" t)

;; cypher mode (neo4j)
(require 'cypher-mode)
(autoload 'cypher-mode "cypher-mode" "A mode to edit cypher (neo4j) scripts" t)

;; set theme
;; (require 'color-theme)

;; set default path to ~/.emacs.d/lisp/
;; (setq default-directory "~/.emacs.d/lisp/")

;; save all backups to this directory
(setq backup-directory-alist `(("." . "~/.saves_emacs")))

;; save backups by copying them instead of renaming the originals/creating new files from buffer
(setq backup-by-copying t)

;; version control for your backups
;; (setq delete-old-versions t
;;   kept-new-versions 6
;;   kept-old-versions 2
;;   version-control t)

;; paste and replace
(delete-selection-mode 1)

;; Deletes trailing whitespace when saving
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set Linum-Mode on
;; (require 'linum)
;; (global-linum-mode t)

;; Linum-Mode and add space after the number


;; Get rid of menu bar
(menu-bar-mode 0)

;; show column number
(column-number-mode t)

;; set word wrap - good for splitting screen using C-x 2 and C-x 3 (C-x 1 will remove them) 
(setq truncate-partial-width-windows nil)

;; last lines should end in a carriage return
(setq require-final-newline t)

;; highlight incremental search
;; (setq search-highlight t)

;; follow-mode allows easier editing of long files
;; (follow-mode t)

;; Marmalade marmalade-repo.org
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Comment/Uncomment Region or Line
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)

;; Stop asking for confirmation
(setq revert-without-query
'("\.[ch]$"
  "/Makefile$"
  "\.py$"
  "\.php$"
  "\.sql"
  "\\.sql\\"
  "\\.\\"))

;; highlight current line (seems to have issues with xterm settings)
;; change hl-line color
;; (require 'hl-line)
;; (set-face-background 'hl-line "gray13")
;; (global-hl-line-mode)

;; highlight current line (different, but works fine)
(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "gray13")

;; ;; highlight current column ;; this made pasting text VERY slow!
;; (require 'col-highlight)
;; (column-highlight-mode)
;; (set-face-background 'col-highlight "gray13")

;; highlight matching paren (and other delimiters)
(require 'paren)
(show-paren-mode t)

;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; C-k kills whole line and newline if at beginning of line
(setq kill-whole-line t)

;; Turn on mouse wheel
;; (mouse-wheel-mode t)

;; get rid of hard tabs
(setq-default indent-tabs-mode nil)

;; Set tab width
;; (setq tab-width 4)
(setq default-tab-width 4)
;; (setq c-basic-offset 4)

;; set tab stops at intervals of 4 with a max of 200
(setq tab-stop-list (number-sequence 4 200 4))

;; textmate settings
;; textmate skeleton-pairs snippet
(load-file "~/.emacs.d/lisp/textmate/textmate.elc")
(require 'textmate-mode)
(mapc (lambda (mode)
        (let ((hook (intern (concat (symbol-name mode)
                                        "-mode-hook"))))
            (add-hook hook (lambda () (textmate-mode +1)))))
      '(c c++ inferior-lisp java lisp objc perl php ruby scala sql))
;;    '(c c++ emacs-lisp inferior-lisp java lisp objc perl php python ruby scala sql))
;; removed emacs-lisp from the list so that .el files would not have problems when pasting in blobs of text that contain paired delimiters
;; removed python as closing

;; set [return] to insert newline-and-indent ;; disabled the indent autoindent mode from textmate.el
(define-key global-map (kbd "RET") 'newline)
(define-key global-map (kbd "M-RET") 'newline-and-indent)

(defun insert-indented-newline-and-indent ()
    (interactive)
            (newline-and-indent)
            (tab-to-tab-stop)
)

;; (defun insert-indented-newline-and-unindent ()
;;     (interactive)
;;             (newline-and-indent)
;;             ;; (tab-to-tab-stop)
;;             (indent-for-tab-command (* -1))
;; )

(global-set-key (kbd "C-c RET") 'insert-indented-newline-and-indent)
;; (global-set-key (kbd "C-C RET") 'insert-indented-newline-and-unindent)

;; change TAB to use tab-to-tab-stop
(global-set-key (kbd "TAB") 'tab-to-tab-stop)

;; remap <option-right/left> to jump words using white space only instead of special characters
;; (global-set-key (kbd "M-[ 5 C") 'forward-whitespace)
;; this uses `forward-whitespace'
(defun backward-whitespace ()
    (interactive)
      (forward-whitespace -1)
)
(global-set-key (kbd "C-c b") 'backward-whitespace)
(global-set-key (kbd "C-c f") 'forward-whitespace)

;; multiple-cursors set up
(require 'load-directory)
;;(load-directory "~/.emacs.d/lisp/multiple_cursors/multiple-cursors.el")
(require 'multiple-cursors)
;; When you have an active region that spans multiple lines, the following will add a cursor to each line:
(global-set-key (kbd "C-c a") 'mc/edit-lines)
;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c A") 'mc/mark-all-like-this)

;; set encoding
(set-terminal-coding-system 'utf-8)

;; Scala mode
;; (add-to-list 'load-path "~/.emacs.d/lisp/scala/scala-dist/tool-support/src/emacs")
;; (require 'scala-mode-auto)
;; (require 'scala-mode)

;; R and other Stats setup
;; (require 'ess-site)

;; PHP mode
;; (require 'php-mode)
;; To use abbrev-mode, add lines like this:
;; (add-hook 'php-mode-hook
;;  '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

;; crontab mode
(require 'crontab-mode)

;; auto modes
(setq auto-mode-alist (append auto-mode-alist '(
("\\.ad[bs]\\'"   . ada-mode)
("\\.awk\\'"      . awk-mode)
("\\.lex\\'"      . c-mode)
("\\.cypher\\'"   . cypher-mode)
("\\.[cy]\\'"     . c++-mode)
("\\.h\\'"        . c++-mode)
("\\.hxx\\'"      . c++-mode)
("\\.[CH]\\'"     . c++-mode)
("\\.java\\'"     . java-mode)
("\\.cc\\'"       . c++-mode)
("\\.hh\\'"       . c++-mode)
("\\.cxx\\'"      . c++-mode)
("\\.cpp\\'"      . c++-mode)
("\\.rc\\'"       . c++-mode) ;; resource files
("\\.rcv\\'"      . c++-mode)
("\\.m\\'"        . matlab-mode)
("\\.p[lm]\\'"    . perl-mode)
("\\.sh\\'"       .shell-mode)
("\\.cgi\\'"      . perl-mode)
("\\.f\\'"      . fortran-mode)
("\\.F\\'"      . fortran-mode)
("\\.f90\\'"      . f90-mode)
("\\.F90\\'"      . f90-mode)
("\\.el\\'"       . emacs-lisp-mode)
("\\.emacs\\'"    . emacs-lisp-mode)
("\\.tex\\'"      . LaTeX-mode)
("\\.bib\\'"      . bibtex-mode)
("[Mm]akefile\\'" . makefile-mode)
("\\.mak\\'"      . makefile-mode)
("\\[Mm]akefile.\\'" . makefile-mode)
("\\.bat\\'"      . shell-script-mode)
("\\.tar\\'"      . tar-mode)
("\\.php\\'"     . php-mode)
("\\.html\\'"     . html-mode)
("\\.jnlp\\'"     . html-mode)
("\\.xml\\'"     . html-mode)
("\\.pddl\\'"     . lisp-mode)
("\\.scala\\'"    . scala-mode)
("\\.rb\\'"       . ruby-mode)
("\\.css\\'"      . css-mode)
("\\.py\\'"       . python-mode)
("\\.yml\\'"      . yaml-mode)
("\\.tpl\\'"      . html-mode)
("\\.lisp\\'"     . lisp-mode)
("/vsql.edit.[0-9]+\\'"  . sql-mode)
("/psql.edit.[0-9]+\\'" . sql-mode)
("/sql[A-Z,0-9]+\\'" . sql-mode)
("\\crontab\\'"    . crontab-mode)
("\\.tsv\\'"      . tsv-mode)
)))

;; (defun my-indent-region (N)
;;   (interactive "p")
;;   (if mark-active
;;       (progn (indent-rigidly (min (mark) (point)) (max (mark) (point)) (* N 4))
;;              (setq deactivate-mark nil))
;;     (self-insert-command N)))

;; (defun my-unindent-region (N)
;;   (interactive "p")
;;   (if mark-active
;;       (progn (indent-rigidly (min (mark) (point)) (max (mark) (point)) (* N -4))
;;              (setq deactivate-mark nil))
;;     (self-insert-command N)))

;; (global-set-key ">" 'my-indent-region)
;; (global-set-key "<" 'my-unindent-region)

;; Indent Region or Line
(defun shift-text (distance)
    (if (use-region-p)
        (let ((mark (mark)))
            (save-excursion
                (indent-rigidly (region-beginning)
                    (region-end)
                    distance)
                (push-mark mark t t)
                (setq deactivate-mark nil)))
        (indent-rigidly (line-beginning-position)
            (line-end-position)
            distance)))

(defun shift-right (count)
    (interactive "p")
      (shift-text (* count 4)))

(defun shift-left (count)
    (interactive "p")
      (shift-text (* count -4)))

(define-key global-map (kbd "M-]") 'shift-right)

(define-key global-map (kbd "M-[") 'shift-left)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; (require 'pabbrev)
;; (global-pabbrev-mode)

;; (global-set-key "\M-c"  'compile)

;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'reverse)

;; remove git from your vc-mode via .emacs:
(delete 'Git vc-handled-backends)

;; send region to tmux buffer
(defvar tmux-send-hist nil)
(defun tmux-send (&optional no-new-line)
  "Send selected region or currently-surrounding blank line-separated \
block of text to tmux buffer."
  (interactive "P")
    (let ((selected (if (region-active-p)
                        (buffer-substring-no-properties (region-beginning) (region-end))
                      (read-from-minibuffer "Command: " nil nil nil 'tmux-send-hist)))
          (tmpfile (make-temp-file "tmux-send.")))
      (when (region-active-p)
        (add-to-history 'tmux-send-hist selected))
      (with-temp-file tmpfile
        (insert selected))
      (call-process "tmux" nil nil nil
                    "load-buffer" tmpfile ";"
      )
      (delete-file tmpfile)
      (deactivate-mark)))

(define-key global-map (kbd "C-c w") 'tmux-send)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; org-mode stuff
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)

;; ctags/etags
;; specify TAGS table(s)
;; zzz (setq tags-table-list
;; zzz '("~/development/BigData"))

;; etags-select plugin
;; zzz (require 'etags-select)
;; bind this to 
;; (defun my-find-tag ()
;;     (interactive)
;;       (if (file-exists-p (concat (eproject-root) "TAGS"))
;;                 (visit-project-tags)
;;             (build-ctags))
;;         (etags-select-find-tag-at-point))

;; zzz (global-set-key (kbd "C-]") 'etags-select-find-tag-at-point)

;; transpose windows
(require 'transpose-frame)
(define-key global-map (kbd "C-c <left>") 'flop-frame)
(define-key global-map (kbd "C-c <right>") 'flop-frame)
(define-key global-map (kbd "C-c <up>") 'flip-frame)
(define-key global-map (kbd "C-c <down>") 'flip-frame)
(define-key global-map (kbd "C-c [") 'rotate-frame-anticlockwise)
(define-key global-map (kbd "C-c ]") 'rotate-frame-clockwise)

;; M-k kills the line to the left
(global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) )

;; taken from http://www.emacswiki.org/emacs/motion-and-kill-dwim.el
(defun backward-kill-to-char-dwim (n char)
    "Kill backwards up to CHAR. With argument, do this that many times"
    (interactive "p\ncBackward kill to char: ")
    (unless (and n (> n 0)) (setq n 1))
    (let ((case-fold-search nil))
        (kill-region (point) (progn
            (search-backward (char-to-string char) nil nil n)
            (forward-char)
            (point)))))

;; better version of deleting words forward or backward
;; modified this from http://stackoverflow.com/questions/13896402/kill-word-forward-word-should-stop-at-newline
(defun backward-word-stop-bol (arg)
    (interactive "p")
      (let ((start (point)))
            (save-restriction
                    (save-excursion
                          (move-beginning-of-line 1)
                              (narrow-to-region start (point)))
                          (backward-word arg))))

(defun kill-to-start-of-word-or-line (arg)
    (interactive "p")
      (progn (backward-delete-char-untabify arg) (kill-region (point) (progn (backward-word-stop-bol arg) (point)))))

(defun forward-word-stop-eol (arg)
    (interactive "p")
      (let ((start (point)))
            (save-restriction
                    (save-excursion
                              (move-end-of-line 1)
                                      (narrow-to-region start (point)))
                          (forward-word arg))))

(defun kill-to-end-of-word-or-line (arg)
    (interactive "p")
      (progn (delete-char arg) (kill-region (point) (progn (forward-word-stop-eol arg) (point)))))

(global-unset-key "\M-\d")
(global-set-key "\M-\d" 'kill-to-start-of-word-or-line)
(global-unset-key "\M-d")
(global-set-key "\M-d" 'kill-to-end-of-word-or-line)

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; Jump to next punctuation
(defun jump-forward-comma ()
  "Move cursor to the next occurrence of 「,」
URL `http://ergoemacs.org/emacs/emacs_jump_to_punctuations.html'
Version 2015-03-24"
  (interactive)
  (forward-char)
  (search-forward-regexp "\\,+" nil t (backward-char)))

(defun jump-backward-comma ()
  "Move cursor to the previous occurrence of 「,」
URL `http://ergoemacs.org/emacs/emacs_jump_to_punctuations.html'
Version 2015-03-24"
  (interactive)
  (backward-char)
  (search-backward-regexp "\\,+" nil t)
  (forward-char)
)

(global-unset-key "\C-c,")
(global-set-key "\C-c," 'jump-forward-comma)
(global-unset-key "\C-x,")
(global-set-key "\C-x," 'jump-backward-comma)

(defun jump-forward-dot ()
  "Move cursor to the next occurrence of 「.」
URL `http://ergoemacs.org/emacs/emacs_jump_to_punctuations.html'
Version 2015-03-24"
  (interactive)
  (forward-char)
  (search-forward-regexp "\\.+" nil t (backward-char)))

(defun jump-backward-dot ()
  "Move cursor to the previous occurrence of 「.」
URL `http://ergoemacs.org/emacs/emacs_jump_to_punctuations.html'
Version 2015-03-24"
  (interactive)
  (backward-char)
  (search-backward-regexp "\\.+" nil t)
  (forward-char)
)

(global-unset-key "\C-c.")
(global-set-key "\C-c." 'jump-forward-dot)
(global-unset-key "\C-x.")
(global-set-key "\C-x." 'jump-backward-dot)

(defun jump-forward-semicolon ()
  "Move cursor to the next occurrence of 「;」
URL `http://ergoemacs.org/emacs/emacs_jump_to_punctuations.html'
Version 2015-03-24"
  (interactive)
  (forward-char)
  (search-forward-regexp "\\;+" nil t (backward-char))
)

(defun jump-backward-semicolon ()
  "Move cursor to the previous occurrence of 「;」
URL `http://ergoemacs.org/emacs/emacs_jump_to_punctuations.html'
Version 2015-03-24"
  (interactive)
  (backward-char)
  (search-backward-regexp "\\;+" nil t)
  (forward-char)
)

(global-unset-key "\C-c;")
(global-set-key "\C-c;" 'jump-forward-semicolon)
(global-unset-key "\C-x;")
(global-set-key "\C-x;" 'jump-backward-semicolon)
