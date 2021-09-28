alias ls="ls -G"
alias clip="nc localhost 8377"
alias gitremote='open $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )/$(git rev-parse --show-prefix)'
