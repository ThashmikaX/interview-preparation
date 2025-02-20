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
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        h1 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 10px 0; }
        a { text-decoration: none; color: #007bff; cursor: pointer; }
        a:hover { text-decoration: underline; }
        #file-list { margin-top: 20px; }
        #file-list ul { list-style-type: none; padding: 0; }
        #file-list li { margin: 5px 0; }
    </style>
</head>
<script>

EOF

echo "const dirs = {" >> $OUTPUT_FILE

# Find all directories (excluding hidden and .git folder)
for dir in */ ; do
    # Skip special directories like .git, .github, and hidden folders
    [[ "$dir" =~ ^(\.git|\.github|_|.*\.) ]] && continue

    # Remove trailing slash from directory name
    dir_name="${dir%/}"

    echo \"$dir_name\" >> $OUTPUT_FILE
    echo ": [" >>  $OUTPUT_FILE

    # List each .md file in the directory
    for file in "$dir_name"/*.md; do
        # Check if the file exists to avoid errors if no .md files are found
        if [[ -f "$file" ]]; then
            echo \"$file\" >> $OUTPUT_FILE
            echo " ," >> $OUTPUT_FILE
        fi
    done
    echo  "], " >> $OUTPUT_FILE
done

echo "};" >> $OUTPUT_FILE

