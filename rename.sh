#!/usr/bin/bash

# TODO: Consider replacing echo with printf.

# Returns an updated file name with an optional prepend and whitespace removed.
update() {
    # Set the first argument argument as file name.
    file_name="$1"

    # Get prepended content.
    prepend="$start"

    # Replace white space with hyphen.
    replaced="${file_name// /-}"

    # Return concatenated prepend and replaced file name.
    echo "${prepend}${replaced}"
}


# Set -p as an option to prepend using the $start variable, and require an argument
while getopts "p:" opt; do
    case $opt in

	# Set up -p option.
	p)
	start="$OPTARG"
	;;

	# Register an invalid option.
	\?) echo "Invalid option: -$OPTARG" ;;
	
	# Return an error message for an option that needs an argument.
	:)
  	echo "Option -$OPTARG requires an argument."
  	;;
    esac
done

# Give user a warning that the files will be renamed.
echo "Important! The following files will be renamed."
echo "--------"

# Return the original file names and the updated file names to the user for review.
for FILE in *; do
    echo "$FILE" "-->"  $(update "$FILE" "$start")
done

# Ask the user to confirm the renaming.
read -p "Are you sure you want to rename these files? " user_response

# If the user types yes, rename the files.
if [[ "$user_response" == "yes" ]]; then
    for FILE in *; do
	new=$(update "$FILE" "start")
	mv "$FILE" "$new"
    done

    # Let the user know that the files have been renamed.
    echo "Your files have been renamed."
else
    # If the user doesn't type yes, confirm that that the files haven't been changed.
    echo "Your files were left the same."
fi
