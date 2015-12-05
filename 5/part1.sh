#!/bin/bash

#           find three vowels                | find a character that repeats    | remove any string containing these certain strings
cat input | grep "[aeiou].*[aeiou].*[aeiou]" | grep "\(.\)\1"                   | egrep -v "(ab|cd|pq|xy)" | wc -l
