#!/bin/bash

printf "This software allows you to rebrand Bitcoin Core v0.11.2 to something else.\n"
printf "Press [ENTER] to start."
read
printf  "\n"
printf "Choose the name of your software. [Default: Bitcoin Core] > "
read software_name
printf "Choose the name of the client as it appears on the network. [Default: Satoshi] > "
read client_name
software_hyphenated_name=`echo "$software_name" | tr " " "-"`
lowercase_hyphenated_name=`echo "$software_hyphenated_name" | tr "[:upper:]" "[:lower:]"`
translation_software_name=$software_name
translation_software_lowercase_hyphenated_name=$software_lowercase_hyphenated_name

cp -f patches/v0.11.2.patch ./rebranded.patch
sed -i "s/_REBRAND_SOFTWARE_NAME_/$software_name/g" rebranded.patch
sed -i "s/_REBRAND_SOFTWARE_HYPHENATED_NAME_/$software_hyphenated_name/g" rebranded.patch
sed -i "s/_REBRAND_LOWERCASE_HYPHENATED_NAME_/$lowercase_hyphenated_name/g" rebranded.patch
sed -i "s/_REBRAND_CLIENT_NAME_/$client_name/g" rebranded.patch
sed -i "s/_REBRAND_TRANSLATION_SOFTWARE_NAME_/$translation_software_name/g" rebranded.patch
sed -i "s/_REBRAND_TRANSLATION_SOFTWARE_LOWERCASE_HYPHENATED_NAME_/$translation_software_lowercase_hyphenated_name/g" rebranded.patch
