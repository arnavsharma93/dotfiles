(defun my-spotify-get-buffers ()
  "get all buffers of spotify el"
  (mapcar #'buffer-name
          (cl-remove-if-not
           (lambda (buf)
             (with-current-buffer buf
               (member major-mode '(spotify-track-search-mode spotify-playlist-search-mode))))
           (buffer-list)))
  )

(defun my-spotify-ivy-track-search ()
  "ivy interface to find list of open spotify.el buffers. If a match is not found,
search on spotify."
  (interactive)
  ;; find all open buffers of the mode
  (ivy-read "Spotify Buffers:" (my-spotify-get-buffers)
            :action '(1
                      ("t" my-spotify-ivy-track-search-action "default track and search play")
                      ("p" spotify-playlist-search "search playlist")
                      ("s" spotify-track-search "search track"))
            ))

(defun my-spotify-ivy-track-search-action (name)
  "ivy action which switches to spotify.el buffer if buffer exists
else search spotify"
  (if (not (get-buffer name))
      (spotify-track-search ivy-text)
    (switch-to-buffer-other-window name)))

(defun my-spotify-delete-all-buffers()
  "delete all spotify el buffers"
  (interactive)
  (mapcar 'kill-buffer (my-spotify-get-buffers))
  )
