alias assets="rake assets:precompile RAILS_ENV=development RAILS_ASSETS_NONDIGEST=true"
alias killpg="ps xa | grep postgres: | grep purecharity | grep -v grep | awk '{print $1}' | xargs kill"

alias autocuke='AUTOFEATURE=true autotest'

alias cgj="find tmp/capybara | tail -1 | xargs open"
alias tl='tail -f log/development.log'
alias tts="touch tmp/restart.txt"
alias fs="foreman start"
alias ri='ri -f ansi'


function bbu() {
  if [[ -z $1 ]]; then
    UNICORN_PORT=3000;
  else
    UNICORN_PORT=$1;
  fi
  bundle exec unicorn -E development -c /usr/local/etc/unicorn.rb -l 127.0.0.1:$UNICORN_PORT
}


