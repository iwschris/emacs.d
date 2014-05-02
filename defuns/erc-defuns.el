;; ERC Macros for Connecting & Autojoin

(defmacro asf-erc-bouncer-connect (command server port nick ssl pass)
   "Create interactive command `command', for connecting to an IRC server. The
   command uses interactive mode if passed an argument."
   (fset command
         `(lambda (arg)
           (interactive "p")
              (if (not (= 1 arg))
                         (call-interactively 'erc)
                     (let ((erc-connect-function ',(if ssl
                                                              'erc-open-ssl-stream
                                                          'open-network-stream)))
                              (erc :server ,server :port ,port :nick ,nick :password ,pass))))))

;; Create ERC command to connect to IWS & Freenode servers
(asf-erc-bouncer-connect erc-iws "107.20.193.74" 6667 "Chris" nil nil)
(asf-erc-bouncer-connect erc-freenode "irc.freenode.net" 6667 "iwschris" nil nil)

(defmacro erc-autojoin (&rest args)
    `(add-hook 'erc-after-connect
       '(lambda (server nick)
          (cond
           ,@(mapcar (lambda (servers+channels)
                       (let ((servers (car servers+channels))
                             (channels (cdr servers+channels)))
                         `((member erc-session-server ',servers)
                           (mapc 'erc-join-channel ',channels))))
                     args)))))

;; Use macro to define autojoin rooms for IWS
(erc-autojoin
    (("107.20.193.74") "#engineering" "#devops" "#triforce" "#office" "#jlu"))
