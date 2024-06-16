#!/bin/bash

number=${N:-1}


while :;do
  duration=$(N=${number} /usr/bin/time -f "%e" ./dist/main 2>&1 > /dev/null)
  printf "%-20d %f\n" ${number} ${duration}

  if [ "$(echo "${duration} > 3" | bc)" -eq 1 ]; then
    exit 0
  else
    number=$((number * 2))
  fi
done
