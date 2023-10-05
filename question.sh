#!/bin/bash

echo "Are you good ?"

read -p "Yes/No: " Answer

case $Answer in
	Yes|yes|y|Y)
		echo -e "\e[31m cool \e[0m"
		echo
		;;
	No|no|n|N)
		echo -e "\e[32m connard \e[0m"
		;;
esac
