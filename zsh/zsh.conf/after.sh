# this file is the last to be run
source ~/.aliases

for file in ~/functions/*; do
  source $file
done
