# this file is the last to be run
source ~/.aliases

for file in ~/functions/*; do
  source $file
done

if command -v pokeget 2>&1 >/dev/null; then
  pokeget random --hide-name | fastfetch --file-raw -
fi
