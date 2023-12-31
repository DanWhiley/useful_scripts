## for loop designed to take in all files (amino acid FASTA formatted files) within a directory and run BLASTP on each file against a custom local BLASTP database to identify virulent SUB1154 gene variants.
for i in BLASTdb/*.faa; do
   blastp -task blastp -query $i -db SUB1154 -out $i.SUB1154.out.tsv -outfmt '6 qseqid qstart qend qlen sseqid sstart send slen sstrand evalue length pident gaps gapopen stitle' -num_threads 8
done ;

# Now show off with a message to the user
echo "BLASTP complete!."
