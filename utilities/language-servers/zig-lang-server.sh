ZIG_CONFIG=$HOME/zls

# if no zls directory in home, then create the directory run the script and add to path
if [ ! -d $ZIG_CONFIG ]; then
  mkdir $HOME/zls
  cd $HOME/zls
  curl -L https://github.com/zigtools/zls/releases/download/0.9.0/x86_64-macos.tar.xz | tar -xJ --strip-components=1 -C .
  cd -
fi
