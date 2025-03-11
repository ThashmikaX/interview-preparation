#!/bin/bash

OUTPUT_FILE="data.json"

# Start the JSON object
echo "{" >> $OUTPUT_FILE


# Find all directories (excluding hidden and .git folder)
for dir in */ ; do
    # Skip special directories like .git, .github, and hidden folders
    [[ "$dir" =~ ^(\.git|\.github|_|.*\.) ]] && continue

    # Remove trailing slash from directory name
    dir_name="${dir%/}"

    # Start adding the directory to the JavaScript object
    echo "    \"$dir_name\": [" >> $OUTPUT_FILE

    # List each .md file in the directory
    first=true
    for file in "$dir_name"/*.md; do
        # Check if the file exists to avoid errors if no .md files are found
        if [[ -f "$file" ]]; then
            # Add a comma only if it's not the first file
            if [ "$first" = true ]; then
                first=false
            else
                echo "        ," >> $OUTPUT_FILE
            fi

            # Add the file name to the directory list
            echo "        \"$file\"" >> $OUTPUT_FILE
        fi
    done

    # Close the directory list
    echo "    ]," >> $OUTPUT_FILE
done

# Close the JSON object

echo "}" >> $OUTPUT_FILE

echo "Generated $OUTPUT_FILE"



