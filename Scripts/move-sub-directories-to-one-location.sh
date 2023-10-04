## Occasionally, there are multiple analysis directories that you want to move to a single, central directory. I can do this with regular expression (if a similar format is followed for outputs).

# Create the target directory if it doesn't exist already. Change directory name as needed.
target_dir="private_db_out_results"
mkdir -p "$target_dir"

# Find all directories containing "_out" in their name. The "_out" is my regular expression in analysed outputs I want to move. This can be changed as required.
while IFS= read -r -d '' directory; do
    # Check if the directory contains "_out" and is a directory (not a file).
    if [[ "$directory" == *_out && -d "$directory" ]]; then
        # Move the directory to the target directory.
        mv "$directory" "$target_dir"
    fi
done < <(find . -maxdepth 1 -type d -name "*_out" -print0)
