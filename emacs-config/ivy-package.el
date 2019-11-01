;;; ivy-package -- Ivy Witter's package configuration
;;; Commentary:
;; this is a configuration file
;;
;;; Code:

(setq load-prefer-newer t)
(require 'auto-compile)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(setq package-archive-priorities
      '(("melpa" . 10)
	("gnu" . 5)))

(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(provide 'ivy-package)
;;; ivy-package.el ends here
