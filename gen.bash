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
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Available Directories</h1>
    <ul>
EOF

# Find all directories (excluding hidden and .git folder)
for dir in */ ; do
    # Skip special directories like .git, .github, and hidden folders
    [[ "$dir" =~ ^(\.git|\.github|_|.*\.) ]] && continue

    # Remove trailing slash from directory name
    dir_name="${dir%/}"

    # Add each directory as a link to index.html
    echo "        <li><a href=\"./$dir_name/\">$dir_name/</a></li>" >> $OUTPUT_FILE
done

# Close HTML tags
cat <<EOF >> $OUTPUT_FILE
    </ul>
</body>
</html>
EOF

echo "Generated $OUTPUT_FILE"
