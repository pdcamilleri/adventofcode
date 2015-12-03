#!/bin/bash

# The approach is to group pairs of parens until no more can be grouped.
# The first ungrouped close paren indicates the point at which Santa enters the basement.

cat input | tr '()' '+-' |                # Not strictly necessary, but makes the rest easier to follow
            sed -e ':start;               # Label for start of loop  
                s/+\(\**\)-/**\1/g;       # Turn any pattern of (****any number of stars****) into pure stars e.g. (****) becomes ******
                t start;'    |            # Jump back to :start if there were no substitutions on the last pass.
            sed -e "s/-.*//" |            # We now have a string of "***...***-...", just trim it down to "***...***-"
            wc -c                         # and do a character count to give us the point where santa enters the basement.



