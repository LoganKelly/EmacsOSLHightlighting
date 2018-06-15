# EmacsOSLHightlighting
A major mode for Emacs that supports syntax highlighting for Open Shading Language.

Setup instructions:

1. Copy the osl-mode.el to your .emacs.d/ folder.
2. Add the following lines to the end of your .emacs file:
(load-file "~/.emacs.d/osl-mode.el")
(setq auto-mode-alist (append '(("\\.osl$" . osl-mode))
      auto-mode-alist))
4. Restart Emacs and the OSL major mode should be enabled by default for all files with the .osl extension.
