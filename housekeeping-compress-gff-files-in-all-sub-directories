## Memory availability can sometimes be a problem and it is good to keep directories well maintained. This script will find all uncompressed gff files (this can be adapted to any file that can be gzipped such as FASTA files etc.) and will compress them using pigz. I prefer to use pigz as it is a multi-thread version of gzip - so it is quicker to run. This script will work on all sub-directories as well, so be mindful of where you execute this script.

# Function to compress a file using pigz.
compress_file() {
    if [ -f "$1" ]; then
        pigz -p 12 "$1"
        echo "Compressed: $1"
    fi
}

# Find all *.gff files in subdirectories and compress them using pigz.
find_files_and_compress() {
    while IFS= read -r -d '' file; do
        compress_file "$file"
    done < <(find . -type f -name "*.gff" -print0)
}

#Run it.
find_files_and_compress
