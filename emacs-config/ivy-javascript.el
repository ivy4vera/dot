;;; ivy-javascript -- Ivy Witter's Javascript configuration
;;; Commentary:
;; this is a configuration file
;;
;;; Code:
(defun setup-js ()
  "Setup Javascript packages."
  ;; (require 'indium)
  (require 'eslint-fix)
  (require 'add-node-modules-path)

  ;; Setup basic js stuff.
  (defvar js-basic-indent)
  (defvar js-indent-level)
  (defvar js-switch-indent-offset)
  (setq js-basic-indent 2)
  (setq js-indent-level 2)
  (setq js-switch-indent-offset 2)
  (lsp)

  (with-eval-after-load 'flycheck
    (add-to-list 'flycheck-disabled-checkers 'javascript-jshint)
    (flycheck-add-mode 'javascript-eslint 'js-mode)
    (flycheck-add-next-checker 'lsp-ui 'javascript-eslint))

  (with-eval-after-load 'dap
    (require 'dap-firefox)
    (require 'dap-node))
  
  (add-node-modules-path) ;; add node modules to path
  (projectile-register-project-type 'javascript '("package.json")
                                    :compile "npm install"
                                    :test "npm test"
                                    :run "npm start"
                                    :test-suffix ".spec")
  (add-hook 'after-save-hook 'eslint-fix)) ;; ESLint fix

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js-mode))
(add-hook 'web-mode-hook 'setup-js)
(add-hook 'js-mode-hook 'setup-js)

(provide 'ivy-javascript)
;;; ivy-javascript.el ends here
