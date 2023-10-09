## This R code/script will crate a circular phylogeentic tree and add two dataframes as coloured concentric rings. 

## Load libraries.

library(ggnewscale)
library(ggplot2)
library(ggtree)
library(TDbook)
library(treeio)
library(aplot)

## Load in the first data table which will be the first concentric ring displaying the country of isolate origin. We will edit this DF to ensure it is compatable with the code/libraries we will use. 

read.csv('df_1_for_circular_phylogeny.csv') -> df_1
## add row name to index for mapping
rownames(df_1) <- df_1$ID
df_1$ID <- NULL
## View it to ensure the first coloumn is now indexed. This is to ensure correct label mapping to tree tips. 
View(df_1)

## repeat this for df_2. This highlights which strains were newly sequenced or publically available

read.csv('df_2_for_circular_phylogeny.csv') -> df_2
rownames(df_2) <- df_2$ID
df_2$ID <- NULL
View(df_2)

## load in the tree. This Tree file was creating using iqtree. 

tree <- read.newick('S-uberis-isoalte-phylogeny.treefile', node.label = "support")

## make it circular 

circ <- ggtree(tree, layout = "circular")

## plot the tree. Change settings as required. 

p1 <- gheatmap(circ, df_1, offset=.0001, width=.15, colnames_offset_y = 0) + scale_fill_viridis_d(option="D", name="Country of isolate origin")

## Add a new scale so that we can add a second concentric ring.

p2 <- p1 + new_scale_fill()

## Plot second concentric ring.

gheatmap(p2, df_2, offset=0.01, width=.15, colnames_offset_y = 0) + scale_fill_viridis_d(option="A", name="This study/publicly available")
