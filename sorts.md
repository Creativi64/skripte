

Here's a pure Bash quicksort implementation:

#!/bin/bash

# quicksorts positional arguments
# return is in array qsort_ret
qsort() {
   local pivot i smaller=() larger=()
   qsort_ret=()
   (($#==0)) && return 0
   pivot=$1
   shift
   for i; do
      # This sorts strings lexicographically.
      if [[ $i < $pivot ]]; then
         smaller+=( "$i" )
      else
         larger+=( "$i" )
      fi
   done
   qsort "${smaller[@]}"
   smaller=( "${qsort_ret[@]}" )
   qsort "${larger[@]}"
   larger=( "${qsort_ret[@]}" )
   qsort_ret=( "${smaller[@]}" "$pivot" "${larger[@]}" )
}

Use as, e.g.,

$ array=(a c b f 3 5)
$ qsort "${array[@]}"
$ declare -p qsort_ret
declare -a qsort_ret='([0]="3" [1]="5" [2]="a" [3]="b" [4]="c" [5]="f")'

This implementation is recursive… so here's an iterative quicksort:

#!/bin/bash

# quicksorts positional arguments
# return is in array qsort_ret
# Note: iterative, NOT recursive! :)
qsort() {
   (($#==0)) && return 0
   local stack=( 0 $(($#-1)) ) beg end i pivot smaller larger
   qsort_ret=("$@")
   while ((${#stack[@]})); do
      beg=${stack[0]}
      end=${stack[1]}
      stack=( "${stack[@]:2}" )
      smaller=() larger=()
      pivot=${qsort_ret[beg]}
      for ((i=beg+1;i<=end;++i)); do
         if [[ "${qsort_ret[i]}" < "$pivot" ]]; then
            smaller+=( "${qsort_ret[i]}" )
         else
            larger+=( "${qsort_ret[i]}" )
         fi
      done
      qsort_ret=( "${qsort_ret[@]:0:beg}" "${smaller[@]}" "$pivot" "${larger[@]}" "${qsort_ret[@]:end+1}" )
      if ((${#smaller[@]}>=2)); then stack+=( "$beg" "$((beg+${#smaller[@]}-1))" ); fi
      if ((${#larger[@]}>=2)); then stack+=( "$((end-${#larger[@]}+1))" "$end" ); fi
   done
}

In both cases, you can change the order you use: I used string comparisons, but you can use arithmetic comparisons, compare wrt file modification time, etc. just use the appropriate test; you can even make it more generic and have it use a first argument that is the test function use, e.g.,

#!/bin/bash

# quicksorts positional arguments
# return is in array qsort_ret
# Note: iterative, NOT recursive! :)
# First argument is a function name that takes two arguments and compares them
qsort() {
   (($#<=1)) && return 0
   local compare_fun=$1
   shift
   local stack=( 0 $(($#-1)) ) beg end i pivot smaller larger
   qsort_ret=("$@")
   while ((${#stack[@]})); do
      beg=${stack[0]}
      end=${stack[1]}
      stack=( "${stack[@]:2}" )
      smaller=() larger=()
      pivot=${qsort_ret[beg]}
      for ((i=beg+1;i<=end;++i)); do
         if "$compare_fun" "${qsort_ret[i]}" "$pivot"; then
            smaller+=( "${qsort_ret[i]}" )
         else
            larger+=( "${qsort_ret[i]}" )
         fi
      done
      qsort_ret=( "${qsort_ret[@]:0:beg}" "${smaller[@]}" "$pivot" "${larger[@]}" "${qsort_ret[@]:end+1}" )
      if ((${#smaller[@]}>=2)); then stack+=( "$beg" "$((beg+${#smaller[@]}-1))" ); fi
      if ((${#larger[@]}>=2)); then stack+=( "$((end-${#larger[@]}+1))" "$end" ); fi
   done
}

Then you can have this comparison function:

compare_mtime() { [[ $1 -nt $2 ]]; }

and use:

$ qsort compare_mtime *
$ declare -p qsort_ret

to have the files in current folder sorted by modification time (newest first).

NOTE. These functions are pure Bash! no external utilities, and no subshells! they are safe wrt any funny symbols you may have (spaces, newline characters, glob characters, etc.).

NOTE2. The test [[ $i < $pivot ]] is correct. It uses the lexicographical string comparison. If your array only contains integers and you want to sort numerically, use ((i < pivot)) instead. Please don't edit this answer to change that. It has already been edited (and rolled back) a couple of times. The test I gave here is correct and corresponds to the output given in the example: the example uses both strings and numbers, and the purpose is to sort it in lexicographical order. Using ((i < pivot)) in this case is wrong.

---




In the 3-hour train trip from Munich to Frankfurt (which I had trouble to reach because Oktoberfest starts tomorrow) I was thinking about my first post. Employing a global array is a much better idea for a general sort function. The following function handles arbitary strings (newlines, blanks etc.):

declare BSORT=()
function bubble_sort()
{   #
    # @param [ARGUMENTS]...
    #
    # Sort all positional arguments and store them in global array BSORT.
    # Without arguments sort this array. Return the number of iterations made.
    #
    # Bubble sorting lets the heaviest element sink to the bottom.
    #
    (($# > 0)) && BSORT=("$@")
    local j=0 ubound=$((${#BSORT[*]} - 1))
    while ((ubound > 0))
    do
        local i=0
        while ((i < ubound))
        do
            if [ "${BSORT[$i]}" \> "${BSORT[$((i + 1))]}" ]
            then
                local t="${BSORT[$i]}"
                BSORT[$i]="${BSORT[$((i + 1))]}"
                BSORT[$((i + 1))]="$t"
            fi
            ((++i))
        done
        ((++j))
        ((--ubound))
    done
    echo $j
}

bubble_sort a c b 'z y' 3 5
echo ${BSORT[@]}

This prints:

3 5 a b c z y

The same output is created from

BSORT=(a c b 'z y' 3 5) 
bubble_sort
echo ${BSORT[@]}

Note that probably Bash internally uses smart-pointers, so the swap-operation could be cheap (although I doubt it). However, bubble_sort demonstrates that more advanced functions like merge_sort are also in the reach of the shell language.

