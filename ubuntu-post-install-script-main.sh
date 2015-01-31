#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Sam Hewitt <hewittsamuel@gmail.com>
#
# Description:
#   A post-installation bash script for Ubuntu
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# tab width
tabs 4
clear
echo '#------------------------------------#'
echo '#     Ubuntu Post-Install Script     #'
echo '#------------------------------------#'

#----- FUNCTIONS -----#

dir="$(dirname "$0")"

. $dir/functions/cleanup.sh
. $dir/functions/sysupgrade.sh
. $dir/functions/system.sh
. $dir/functions/development.sh
. $dir/functions/favourites.sh
. $dir/functions/thirdparty.sh

#----- MESSAGE FUNCTIONS -----#

show_info() {
echo -e "\033[1;34m$@\033[0m"
}

show_success() {
echo -e "\033[1;32m$@\033[0m"
}

show_error() {
echo -e "\033[1;31m$@\033[m" 1>&2
}

#----- MAIN FUNCTIONS -----#

# Main
function main {
echo ''

#echo "sysupgrade---------------------------------------------------------"
#sysupgrade && upgrade  # System Upgrade
#echo "Install system Tools"
#clear && system  # Install System Tools
#echo 'Install Dev Tools'
#clear && development # Install Dev Tools
#echo 'Install Third-Party Applications'
#clear && thirdparty # Install Third-Party Applications

}



#----- RUN MAIN FUNCTION -----#
main

#END OF SCRIPT