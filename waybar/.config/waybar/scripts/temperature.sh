#!/bin/sh
def_val="default value"
thinkpad_data="$(sensors | grep 'thinkpad' -A 10)"

if [[ $thinkpad_data == "" ]]; then
  printf "$def_val"
else
  printf "{\"temperature\": \"$(sensors | grep 'thinkpad' -A 10 | grep '^CPU' | sed -e 's/CPU: *+//g')\"}"
  # printf '{"temperature": $(sensors | grep "thinkpad" -A 10 | grep '^CPU' | sed -e "s/CPU: *+//g")}'
fi
