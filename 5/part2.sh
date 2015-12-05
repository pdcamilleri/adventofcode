#!/bin/bash

# First grep matches a 2-character sequence that repeats anywhere in the string
# Second grep matches a 3-character sequence where the first and last character are the same
cat input | grep "\(..\).*\1" | grep "\(.\).\1" | wc -l
