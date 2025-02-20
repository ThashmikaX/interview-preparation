#!/bin/bash

# Set the output HTML file
OUTPUT_FILE="index.html"

# Start the HTML file
cat <<EOF > $OUTPUT_FILE
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Directory Listing</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<script>
const dirs = {
EOF

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

# Close the dirs object and the script tag
echo "};" >> $OUTPUT_FILE
echo "</script>" >> $OUTPUT_FILE

echo "Generated $OUTPUT_FILE"



