#!/bin/bash
# Learned from https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
# About args in https://tecadmin.net/tutorial/bash-scripting/bash-command-arguments/
# Yes/No answer from https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script

# https://linuxacademy.com/blog/linux/conditions-in-bash-scripting-if-statements/
# Contains stuff not working as intended? https://unix.stackexchange.com/questions/445713/is-parameter-expansion-on-not-supported-by-the-sh-shell#445715
# For example...
# % and # do the same thing... should cut from beginning or end...
# %% or ## should take the last match for the pattern, ignored in this script...
# Had trouble on other pc, cant have ${} or $() inside ${} ;)
# Gedit showed color on $() so I tried it and it seemed to work...
# For example:
# echo $(dpkg -l vlc)

# Debug flag up if debug is on. Lowercase the text.
if [ "${1,,}" = "debug" ]; then DEBUG=true; fi

# Path to this script.
# If it's different from home, it's probably in a root folder.
# If it's in /usr/bin folder, use filename to run the command from terminal.
# NOTE: Check help command how to use the program commands.
if [[ $0 != "/home/"* ]]
then
CDPATH="${PWD%%*/}/"

else
CDPATH="${PWD%%*/}/${0#*/}"
CDPATH="${CDPATH%/*.sh}"
fi

# Make flag for each option.
FLAG=0
FLAGHASVALUE=0

# Flags
HELP=false

# If I ever add installer... this goes false
CHECK=true

FILE="$CDPATH/Deps.txt"
SLEEP="2s"

simple_test_home_folder ()
{
SIMPLETEST=$(ls $HOME)
echo $SIMPLETEST
echo ${SIMPLETEST,,}
}

debug_on ()
{
if [ $DEBUG ]; then

echo "----------- Debug messages ON -----------"
echo "Script path: $0"
echo "Program Id: $$"
echo "Args count: $#, Args: $@"
echo "Exit status of last command: $?"
echo "Process Id of last command: $!"

echo "Default file target: $FILE"
echo "Default sleep time: $SLEEP"
echo "Parsed path used in script: $CDPATH"

# Ask for path test, optional. Third link.
while true; do
    read -p "(Optional) Want to test lower case method with home directory? (y/n): " optional_question
    case ${optional_question,,} in
        [y]* ) simple_test_home_folder; break;;
        * ) break;;
    esac
done

echo "-----------------------------------------"

fi
}

print_help ()
{
echo "Flags used in program and explanation:"
echo "debug - As first argument, you get all debug messages if there are problems running the script."
echo "file filename - Use filename as read file (default Deps.txt)"
echo "sleep seconds - After each dependency sleeps for seconds (default 0.1)"
echo "check - checks if dependency is installed, version and prints required version."
echo "TODO: install - Install the dependencies mentioned in file instead of checking"
echo ""
echo "-------- Additional notes --------"
echo "Remember to check the supported version. It might not meet the requirement."
echo "You could save these inputs to log and parse through them with other program."
echo "--- Log command example ---"
echo "# ./CheckDependencies.sh debug sleep 0 > deps.log"
echo ""
echo "Some programs return the messages straight to active terminal and might not show up in the log."
echo "Pretty good for dpkg as you get to see straight away what you dont have"

# Flags in use... help, check, install, file X, sleep y
# Maybe add check for forced version installation...?

# Leave program.
exit
}

# Program starts from here
run_program ()
{
# Is debug on?
debug_on

if [ $DEBUG ]; then echo "Debug: Program started"; fi

# Check link 2 for args...
check_flags $@
read_lines

if [ $DEBUG ]; then echo "Debug: Program ended"; fi
date

}

check_flag ()
{
if [ $DEBUG ]; then echo "Debug: Flag! $1"; fi

if [ ${1,,} == "help" ]; then HELP=true
#elif [ ${1,,} == "check" ]; then CHECK=true
elif [ ${1,,} == "install" ]; then CHECK=false
elif [ ${1,,} == "file" ]; then FLAGHASVALUE=4
elif [ ${1,,} == "sleep" ]; then FLAGHASVALUE=8
else echo "Flag not found: $1"
fi

sleep 0.5
}

check_flag_value ()
{
if [ $DEBUG ]; then echo "Debug: Flag value! $1"; fi

if [ $FLAGHASVALUE == 4 ]; then
FILE="$CDPATH/$1"
if (( $DEBUG )); then echo "Debug: File! $FILE"; fi
elif [ $FLAGHASVALUE == 8 ]; then
SLEEP="$1"
if (( $DEBUG )); then echo "Debug: Sleep! $SLEEP"; fi
fi
FLAGHASVALUE=0

sleep 0.5
}

check_flags ()
{
if [ $DEBUG ]; then echo "Debug: Flags! $@"; fi

# Loop through flags... https://stackoverflow.com/a/255913
for VAR in "$@"; do

if [ $FLAGHASVALUE == 0 ]; then check_flag $VAR
else check_flag_value $VAR; fi

done

if [ $HELP == true ]; then print_help; fi
}

check_dependency ()
{
TEST_DEP=$1

# Check current installation...
if [ $CHECK == true ]; then
echo "Checking: ${TEST_DEP%(*}"

CHECKED_DEP="$(dpkg -s ${TEST_DEP%(*} | grep '^Version:')"
if [ ${#CHECKED_DEP} == 0 ]; then
echo "   ! ! ! Missing dependency ! ! !   "
else echo "$CHECKED_DEP"
fi

# Install...
else
echo "TODO: Installing: ${TEST_DEP%(*}"
fi

# Check dependency version if it's mentioned
DEP_VER=${TEST_DEP#*(}
if [[ $DEP_VER == *")"* ]]; then
echo "Supported: ($DEP_VER"
echo "   < < < Check version! > > >   "
fi

# Sleep for...
sleep "$SLEEP"

}

read_line ()
{
LINE="$1"

if [ $DEBUG ]; then echo "Debug: Read line! $LINE"; fi

# Leave if line is empty.
if [ ${#LINE} -eq 0 ]; then return; fi

# If you want to comment your dependency file to parts, start with dash character. '-'
if [[ $LINE == "-"* ]]; then
echo "#####################################################################"
echo "# $LINE #"
echo "#####################################################################"
return
fi

echo "#------- Fetching dependency -------#"

VALUE=${LINE%|*}
check_dependency "$VALUE"

# Optional version...
if [ $DEBUG ]; then echo "Read line: $VALUE"; fi

# Additional if inside if...
if [[ $LINE == *"|"* ]]; then
VALUE=${LINE#*|};
echo "Optional dependency..."
check_dependency "$VALUE"
fi

}

read_lines ()
{
# Need ; if you want if statement with then on same line!
# Cut text before(%) '|' character and forget the rest(*). Optional cut after(%%).
# Check both first and optional version.

echo "#------ Fetching dependencies ------#"
while read -r line; do
read_line "$line"
done < "$FILE";
echo "#------ Dependencies fetched! ------#"
}


# Don't edit bash here. Function "run_program" deals with the program.
# Program is made of multiple functions and it deals how it is handled.
run_program $@

# End of file
