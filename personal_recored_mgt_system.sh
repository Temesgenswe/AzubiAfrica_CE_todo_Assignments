#!/bin/bash
# This is Todo Assignments for personal Record Management System
while true; do
    clear
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "@ Automate Personal Record Management System using bash @"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "===================================="
    echo "=1. Add a new record		     ="
    echo "=2. Edit existing records          ="
    echo "=3. Search for specific records    ="
    echo "=4. Generate reports               ="
    echo "=5. Exit                           ="
    echo "===================================="
    echo 
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

    read -p "Enter your Option: " choice
    echo

    case $choice in
        1)
            # This is the first option (Adding new Record)

    	    echo "Add a New Record"
		        read -p "Enter First Name: " fname
			read -p "Enter other name(s): " lname
            read -p "Enter the age: " age
    	    read -p "Enter the address: " address
			full_name="$fname $lname"
    	    echo "$full_name,$age,$address" >> records.csv
			echo "Record added successfully."
            ;;
        2)
		# This is the second option( Edit existing records)
			echo "Edit Existing Records"
			read -p "Enter the name to search for: " search_name
			search=$(echo "$search_name" | tr '[:upper:]' '[:lower:]')

			# be sure this is case-insensitive
			match_record=$(grep -i "$search" records.csv)

			if [ -z "$match_record" ]; then
				echo "No records found, Please put the correct maching record: $search_name"
			else
				echo "The Record is Maching:"
				echo "$match_record"

				read -p "Enter the record number to edit: " record_number

				# the following is validating the record
				if ! [[ "$record_number" =~ ^[0-9]+$ ]]; then
					echo "Invalid Input is inserted. Please enter the cocrreect number."
				elif (( record_number <= 0 || record_number > $(grep -c '^' records.csv) )); then
					echo "Record number is out of range."
				else
					# Retrive 
					record=$(sed -n "${record_number}p" records.csv)

					# Extract the individual fields from the record
					existing_full_name=$(echo "$record" | cut -d ',' -f 1)
					existing_age=$(echo "$record" | cut -d ',' -f 2)
					exsting_address=$(echo "$record" | cut -d ',' -f 3)

					echo "Editing Record $record_number:"
					echo "Full Name: $existing_full_name"
					echo "Age: $existing_age"
					echo "Address: $existing_address"

					read -p "Enter the new full name: " new_full_name
					read -p "Enter the new age: " new_age
					read -p "Enter the new address: " new_address

					# Replace the old record with the updated record in the file
					sed -i "${record_number}s/$existing_full_name,$existing_age,$existing_address/$new_full_name,$new_age,$new_address/" records.csv

					echo "Record $record_number updated successfully."
				fi
			fi
	    
            ;;
        3)
			# This is the third Option (Searching The specific)
			echo "Search for The Records"

			read -p "Enter the name to search for: " search_name

			# Convert the search_name to lowercase
			search=$(echo "$search_name" | tr '[:upper:]' '[:lower:]')
		
			# Search 
			match_record=$(grep -i "$search" records.csv)

			if [ -z "$match_record" ]; then
				echo "No records found matching the search name: $search_name"
			else
				echo "Mach Recording:"
				echo "$match_record"
			fi
			;;
        4)
			# This is the Last Option (Generating Report)
			echo "Generate Reports"
			echo "  1. All Records"
			echo "  2. Records by Age"
			echo "  3. Records by Address"
			echo "  4. Exit"

			read -p "Enter your choice: " report_choice

			case $report_choice in
				1)
					echo "All Records:"
					cat records.csv
					;;
				2)
					echo "Records by Age:"
					echo "Enter the age range:"
					read -p "From: " age_from
					read -p "To: " age_to
					awk -F',' -v age_from="$age_from" -v age_to="$age_to" '$2 >= age_from && $2 <= age_to' records.csv
					;;
				3)
					echo "Records by Address:"
					echo "-------------------"
					read -p "Enter the address to search for: " search_address
					grep -i "$search_address" records.csv
					;;
				4)
					echo "Exiting report generation."
					;;
				*)
					echo "Invalid choice. Please try again."
					;;
			esac
			;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    read -p "Press Enter to continue..."
done
