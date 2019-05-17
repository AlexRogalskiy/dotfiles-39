
function printPagesPerDay
  set -l bookPath /Users/adrian/Projects/programmiersprachenbuch/main.pdf
  set -l writtenPages (pdfinfo $bookPath | grep Pages | cut -c 9-)
  set -l pagesToWrite (echo "300 - $writtenPages" | bc -l)
  set -l deadline (gdate -d '2019-06-01' +%s)
  set -l today (gdate +%s)
  set -l pagesPerDay \
    (echo "scale=2; $pagesToWrite * 86400" / \($deadline - $today\) | bc -l)

  printf ' %s p | %s p/d ' (math "round($writtenPages * 10)/10") $pagesPerDay
end


function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  # Disable path shortening
  set -g fish_prompt_pwd_dir_length 0

  set_color -b 000000 $fish_color_cwd
  printf ' %s%s ' (prompt_pwd) (__fish_git_prompt)

  set_color -b 333333 000000
  printf '\ue0b0'

  set_color cyan
  printf ' %s' (whoami)

  set_color black
  printf '@'

  set_color red
  printf '%s ' (hostname | cut -d . -f 1)

  set_color -b 000000 333333
  printf '\ue0b0'
  set_color -b 000000

  # Show datetime
  # set_color white
  # printf ' %s ' (date -u "+%Y-%m-%d %H:%M:%S")

  # set_color -b 333333 000000
  # printf '\ue0b0'
  # set_color -b 333333

  set_color red

  # if command -sq tasklite
  #   set --local taskCount (tasklite runsql \
  #     "select count(*) from tasks where state is 'Open'" \
  #     | tail -n 1)

  #   set --local taskDesc (tasklite next \
  #     | grep '^body: ' \
  #     | cut -c 7- \
  #     | sed -E 's/(.{40})(.{1,})$/\1…/')

  #   printf ' %s | %s ' $taskCount $taskDesc
  # end

  printPagesPerDay

  # Gray Arrow End
  # set_color -b normal 333333
  # printf '\ue0b0'
  # set_color normal

  # Black Arrow End
  set_color -b normal 000000
  printf '\ue0b0'
  set_color normal

  printf '\n'

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  set_color -b 000000 magenta
  printf '$'

  set_color -b normal 000000
  printf '\ue0b0 '
  set_color normal
end
