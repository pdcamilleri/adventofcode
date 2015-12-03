#!/bin/bash

# turns ( into +1 and ) into -1, and pass the result into a calculator.
cat input | sed -e "s/(/+1/g" -e "s/)/-1/g" -e "s/^/0/g" | bc

