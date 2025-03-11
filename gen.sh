#!/bin/bash

OUTPUT_FILE="data.json"

# Start the JSON object
echo "{" > $OUTPUT_FILE

# Track if this is the first directory for valid JSON formatting
first_dir=true

# Find all directories (excluding hidden and .git folders)
for dir in */ ; do
    # Skip special directories like .git, .github, and hidden folders
    [[ "$dir" =~ ^(\.git|\.github|_|.*\.) ]] && continue

    # Remove trailing slash from directory name
    dir_name="${dir%/}"

    # Collect all .md files in the directory
    md_files=("$dir_name"/*.md)

    # Skip if no .md files exist
    if [ ! -f "${md_files[0]}" ]; then
        continue
    fi

    # Add a comma only if it's not the first directory
    if [ "$first_dir" = true ]; then
        first_dir=false
    else
        echo "," >> $OUTPUT_FILE
    fi

    # Start adding the directory to the JSON object
    echo "  \"$dir_name\": [" >> $OUTPUT_FILE

    # Process .md files
    first_file=true
    for file in "${md_files[@]}"; do
        # Skip if no actual files (in case of glob expansion failure)
        [[ ! -f "$file" ]] && continue

        # Add a comma only if it's not the first file
        if [ "$first_file" = true ]; then
            first_file=false
        else
            echo "    ," >> $OUTPUT_FILE
        fi

        # Add the file name (basename to avoid full path)
        echo "    \"$(basename "$file")\"" >> $OUTPUT_FILE
    done

    # Close the directory array
    echo "  ]" >> $OUTPUT_FILE
done

# Close the JSON object
echo "}" >> $OUTPUT_FILE

echo "Generated $OUTPUT_FILE"
