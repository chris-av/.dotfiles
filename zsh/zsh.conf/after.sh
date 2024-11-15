# this file is the last to be run
source ~/.aliases

for file in ~/functions/*; do
  source $file
done

echo ""
echo ""
if [ ! command -v pokeget > /dev/null 2>&1 || ! command -v fastfetch > /dev/null 2>&1 ]; then
  pokeget random --hide-name | fastfetch --file-raw -
fi
