;;; packages.el --- my-spotify layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Arnav <arnavsharma93@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-spotify-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-spotify/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-spotify/pre-init-PACKAGE' and/or
;;   `my-spotify/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-spotify-packages
  '((spotify
     :location local))
  "The list of Lisp packages required by the my-spotify layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here

(defun my-spotify/init-spotify ()
  (use-package spotify
    :config
    (spacemacs/declare-prefix "am" "music")
    (spacemacs/set-leader-keys
      "amp" 'spotify-toggle-play
      "amr" 'spotify-toggle-repeat
      "amS" 'spotify-toggle-shuffle
      "amj" 'spotify-previous-track
      "amk" 'spotify-next-track
      "amPm" 'spotify-my-playlists
      "amPf" 'spotify-featured-playlists
      "amPu" 'spotify-user-playlists
      "amPs" 'spotify-playlist-search
      "amPc" 'spotify-api-playlist-create
      "ams" 'spotify-track-search
      )
    (spacemacs/set-leader-keys-for-minor-mode 'spotify-remote-mode
      "r" 'spotify-toggle-repeat
      "S" 'spotify-toggle-shuffle
      "p" 'spotify-toggle-play
      "RET" 'spotify-track-select
      "l" 'spotify-track-load-more
      "R" 'spotify-track-reload
      "j" 'spotify-previous-track
      "k" 'spotify-next-track
      "Pm" 'spotify-my-playlists
      "Pf" 'spotify-featured-playlists
      "Pu" 'spotify-user-playlists
      "Ps" 'spotify-playlist-search
      "Pc" 'spotify-api-playlist-create
      "PF" 'spotify-playlist-follow
      "PU" 'spotify-playlist-unfollow
      "s" 'spotify-track-search
      "q" 'kill-buffer-and-window
      )

    )

  )
