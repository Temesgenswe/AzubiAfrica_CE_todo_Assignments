#!/bin/bash
#This is the  Automate Personal Record Management System
#Develop menu
echo "The following are the option to operate in record managemnt system"
echo "*****Menus*****"
echo "1)Record :"
echo "2)Edit : "
echo "3)Search: "
echo "4)Generate Report: "
echo "5)Exit : "
echo "Enter the option that you want to operate on the record management system:"
read option
case $option in 
	"Record")
		echo "Recording new records"
		,,
	"Edit")
		echo "Editing the existing record"
		,,
esac

