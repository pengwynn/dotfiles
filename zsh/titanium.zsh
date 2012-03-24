# Titanium stuff

export ANDROID_SDK="/Users/wynn/android_sdk"
alias adb='/Users/wynn/android_sdk/platform-tools/adb'


alias titan='~/Library/Application\ Support/Titanium/mobilesdk/osx/1.8.2/titanium.py'
alias tic='coffee -c --bare -o Resources src'
alias tib='titan run --platform=iphone'

function tss() {
  rm Resources/app.jss;
  sass --compass -C -t expanded sass/app.sass > Resources/app.jss;
}

alias ticl='rm -rf build/iphone'



