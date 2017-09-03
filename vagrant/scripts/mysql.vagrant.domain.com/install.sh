#!/usr/bin/env bash
#
# Simple bootstrapping program for the "phonect" project.
# Should work on Darwin and Debian
set -o errtrace
set -o errexit
set -o pipefail

# Text color variables
declare -r txtund=$(tput sgr 0 1)          # Underline
declare -r txtbld=$(tput bold)             # Bold
declare -r bldred=${txtbld}$(tput setaf 1) #  red
declare -r bldyellow=${txtbld}$(tput setaf 3) #  yellow
declare -r bldgreen=$(tput setaf 2) #  green
declare -r bldpurp=${txtbld}$(tput setaf 5) #  purple
declare -r bldblu=${txtbld}$(tput setaf 4) #  blue
declare -r bldwht=${txtbld}$(tput setaf 7) #  white
declare -r txtrst=$(tput sgr0)             # Reset
declare -r isNumber='^[0-9]+$';
# make sure we don't leave the terminal with some strange color
trap "printf '%b${txtrst}'" EXIT;

function say () {
    printf "\n${bldwht}%b${txtrst}\n" "$*";
}

function brag () {
    printf "\n${bldpurp}%b${txtrst}\n" "$*";
}

function warn () {
    printf "\n${bldyellow}WARN: %b${txtrst}\n" "$*";
}

function error () {
    printf "\n${bldred}ERROR: %b${txtrst}\n" "$*";
}

function fail () {
    printf "\n${bldred}FATAL ERROR: %b${txtrst}\n" "$*";
    exit 1;
}

function info () {
    printf "\n${bldgreen}%b${txtrst}\n" "$*";
}

## Run db inserts

brag "Successfully installed http://mysql.vagrant.domain.com"

function show_welcome_message () {

    printf "${bldblu}%b" "";

    cat <<"EOF"

                  (\.---./)
                   /.-.-.\
                  /| 0_0 |\
                 |_`-(v)-'_|
                 \`-._._.-'/      .-.
           -~-(((.`-\_|_/-'.)))-~' <_
                  `.     .'
        Hello, I am `._.' the phonect
                 bootstrapper!!
           -----~--~---~~~----~-`.-;~
EOF
say "
you should now be able to log into mysql by connecting with:
    mysql -u root -proot 192.168.77.23
";
}

show_welcome_message;
exit 0;
