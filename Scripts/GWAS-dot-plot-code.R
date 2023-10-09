## Load libraries 
require(ggplot2)
require(ggrepel)
library(ggrepel)

## Load gene hits file from GWAS output. Can be downloaded from this repo.

gene_hits = read.table("gene_hits-file-for-dot-plot.txt", stringsAsFactors=FALSE, header=TRUE)

# Plot the results as a dot plot using colour blind friendly palatte. At the same time, write an appropriate title. 

ggplot(gene_hits, aes(x=avg_beta, y=maxp, colour=avg_maf, size=hits, label=gene)) +
    geom_point(alpha=0.5) +
    geom_text_repel(aes(size=1.4), show.legend = FALSE, colour='black') +
    scale_size("Number of k-mers", range=c(1,10)) +
    scale_colour_gradient('Average MAF') +
    theme_bw(base_size=11) +
    ggtitle("GWAS - milk phenotype") +
    xlab("Average effect size") +
    ylab("Maximum -log10(p-value)") + theme_classic() -> d
d + scale_color_viridis_c()
