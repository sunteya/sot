#!/usr/bin/env bash

T='gYw'

echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done
echo

# echo -e "\n                 100m    101m    102m    103m\
#      104m    105m    106m    107m";

# for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
#            '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
#            '  36m' '1;36m' '  37m' '1;37m';
#   do FG=${FGs// /}
#   echo -en " $FGs \033[$FG  $T  "
#   for BG in 100m 101m 102m 103m 104m 105m 106m 107m;
#     do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
#   done
#   echo;
# done
# echo

echo -e "\033[0mNC (No color)"
echo -e "\033[1;37mWHITE\t\033[0;30mBLACK"
echo -e "\033[0;34mBLUE\t\033[1;34mLIGHT_BLUE"
echo -e "\033[0;32mGREEN\t\033[1;32mLIGHT_GREEN"
echo -e "\033[0;36mCYAN\t\033[1;36mLIGHT_CYAN"
echo -e "\033[0;31mRED\t\033[1;31mLIGHT_RED"
echo -e "\033[0;35mPURPLE\t\033[1;35mLIGHT_PURPLE"
echo -e "\033[0;33mYELLOW\t\033[1;33mLIGHT_YELLOW"
echo -e "\033[1;30mGRAY\t\033[0;37mLIGHT_GRAY"
