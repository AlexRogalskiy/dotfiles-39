if status --is-login
  set systemType (uname)

  # Set locales
  set -x LANG en_US.UTF-8
  set -x LC_ALL en_US.UTF-8

  # Set paths for MacOS scripts
  set -x OSA_LIBRARY_PATH $HOME/dotfiles/script-libraries $OSA_LIBRARY_PATH


  # Add paths to path variable with increasing priority

  ## User
  set -x PATH /usr/local/sbin $PATH

  ## Postgres
  # if test $systemType = "Darwin"
  #   set -x PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH
  # end


  ## Programming Languages

  ### PHP
  # if test $systemType = "Darwin"
  #   set -x PATH (brew --prefix php)/bin $PATH
  # end

  ### Rust
  set -x PATH ~/.cargo/bin $PATH

  ### Go
  set -x GOPATH $HOME/.go $GOPATH
  set -x PATH $GOPATH/bin $PATH

  ### Ruby
  if test $systemType = "Darwin"
    set -x PATH /usr/local/opt/ruby/bin $PATH
    set -x PATH /usr/local/lib/ruby/gems/2.7.0/bin $PATH
    set -x GEM_HOME $HOME/.gem
  end

  ### Haskell
  set -x PATH ~/.local/bin $PATH

  ### Java
  set -x CLASSPATH \
    ".:/usr/local/Cellar/antlr/4.7/antlr-4.7-complete.jar:$CLASSPATH"

  ### JavaScript

  #### For cli tools installed with `yarn global add`
  # Use hardcoded path instead of `(yarn global bin)` to decrease load time
  set -x PATH /usr/local/bin $PATH

  #### Tools installed with `npm --global install`
  # Use hardcoded path instead of `(npm bin --global)` to decrease load time
  set -x PATH /usr/local/Cellar/node/*/bin $PATH


  ### Python
  set -g fish_user_paths "/usr/local/opt/python@3.9/bin" $fish_user_paths
  set -x PATH ~/Library/Python/3.9/bin/ $PATH


  ## Custom
  set -x PATH ~/dotfiles/bin $PATH


  ## Homebrew
  set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

  ### Token allows reading public repos, creating gists)
  if test $systemType = "Darwin"
    ################# DO NOT COMMIT #########################################
    set -x HOMEBREW_GITHUB_API_TOKEN 1de66c2243ae059adcc536c664066361dfd54baa
  end

  set -x HOMEBREW_CASK_OPTS "--no-quarantine"


  # MatplotLib in iTerm

  ## Set iTerm as backend for Python's Matplotlib
  set -x MPLBACKEND module://itermplot

  ## Optimize appearance for dark background
  set -x ITERMPLOT rv


  # Default editor
  set -x EDITOR sublime-wait

  # Default visual editor
  set -x VISUAL sublime-wait


  # Default locations
  set filesRootPath ~/'Dropbox'

  set -x AUDIOBOOKS $filesRootPath/Audiobooks
  set -x BOOKS $filesRootPath/Books
  set -x CARDS $filesRootPath/Cards
  set -x CHECKLISTS $filesRootPath/Checklists
  set -x CONTACTS $filesRootPath/Contacts
  set -x COMPANIES $filesRootPath/Companies
  set -x DOCUMENTS $filesRootPath/Documents
  set -x EVENTS $filesRootPath/Events
  set -x IDEAS $filesRootPath/Ideas
  set -x LINKS $filesRootPath/Links
  set -x LEADSHEETS $filesRootPath/Leadsheets
  # set -x MAIL ~/Mails
  set -x MAILS $filesRootPath/Mails
  set -x NEWS $filesRootPath/News
  set -x NOTES $filesRootPath/Notes
  set -x PHOTOS $filesRootPath/Photos
  set -x POSTS $filesRootPath/Posts
  set -x RECEIPTS $filesRootPath/Receipts
  set -x SHEETMUSIC $filesRootPath/Sheetmusic
  set -x SONGS $filesRootPath/Songs
  set -x TASKS $filesRootPath/Tasks
  set -x THINGS $filesRootPath/Things
  set -x VOUCHERS $filesRootPath/Vouchers


  # Fish

  ## Zoxide
  zoxide init fish | source

  ## iTerm
  test -e {$HOME}/.iterm2_shell_integration.fish
  and source {$HOME}/.iterm2_shell_integration.fish


  # thefuck
  # if type -q thefuck # Check if `thefuck` is something executable
  #   eval (thefuck --alias | tr '\n' ';')
  # end

  # GPG (Necessary for signing git commits and tags)
  set -x GPG_TTY (tty)

  # Enable color output for github.com/chrisallenlane/cheat
  set -x CHEATCOLORS true
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/adrian/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/adrian/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/adrian/.config/yarn/global/node_modules/tabtab/.completions/sls.fish ]; and . /Users/adrian/.config/yarn/global/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/adrian/.config/yarn/global/node_modules/tabtab/.completions/slss.fish ]; and . /Users/adrian/.config/yarn/global/node_modules/tabtab/.completions/slss.fish
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
