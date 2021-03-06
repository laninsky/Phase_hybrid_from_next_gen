# Phase_hybrid_from_next-gen_data v1.0.3
Have you got a hybrid in your next-gen dataset (currently developed for UCE and RadSEQ loci), and you want to confirm its parent species? Then boy, do I have the pipeline for you! You can either manually copy the R and bash scripts to your local computer, or use git clone.

There are two sets of scripts to help with this (their relative contribution is outlined in the image below):

The first step is the phasing_step which can be followed at: https://github.com/laninsky/reference_aligning_to_established_loci/tree/master/phase_everyone . This will phase all of your samples so that we can determine the phylogenetic relationships by allele. Follow the instructions through Step 6 (MAFFT alignment).

The second step is in the folder post-processing in this current repository. There is a readme in there to help you.

![hybrid_identification_pipeline](https://cloud.githubusercontent.com/assets/8808649/8860428/4e512bf6-3149-11e5-9ee4-7ea321904d3b.png)

# Suggested citation
This code was first published in:

Alexander, A.M., Su, Y.C., Oliveros, C.H., Olson, K.V., Travers, S.L. and Brown, R.M., 2016. Genomic data reveals potential for hybridization, introgression, and incomplete lineage sorting to confound phylogenetic relationships in an adaptive radiation of narrow‐mouth frogs. Evolution.

If you could cite the pub, and the progam as below, that would be lovely:

Alexander, A. 2015. Phase_hybrid_from_next_gen v1.x.x. Available from https://github.com/laninsky/Phase_hybrid_from_next_gen

This pipeline also wouldn't be possible without the programs/packages listed below. Please cite them as well:

R: R Core Team. 2015. R: A language and environment for statistical computing. URL http://www.R-project.org/. R Foundation for Statistical Computing, Vienna, Austria. https://www.r-project.org/

Stringr:  Hadley Wickham (2012). stringr: Make it easier to work with strings.. R package version 0.6.2. http://CRAN.R-project.org/package=stringr (for up-to-date citation information run citation("stringr" in R)
  
data.table: M Dowle, A Srinivasan, T Short, S Lianoglou with contributions from R Saporta and E Antonyan (2015). data.table: Extension of Data.frame. R package version 1.9.6. http://CRAN.R-project.org/package=data.table  (for up-to-date citation information run citation("data.table" in R)
  
plyr: Hadley Wickham (2011). The Split-Apply-Combine Strategy for Data Analysis. Journal of Statistical Software, 40(1), 1-29. URL  http://www.jstatsoft.org/v40/i01/.

bwa: See citation info at: http://bio-bwa.sourceforge.net/bwa.shtml#13 and Li, H. "Toward better understanding of artifacts in variant calling from high-coverage samples." Bioinformatics (Oxford, England) 30, no. 20 (2014): 2843.

samtools: See citation info at: http://www.htslib.org/doc/#manual-pages

picard: http://broadinstitute.github.io/picard/

GATK: See citation info at https://www.broadinstitute.org/gatk/about/citing

RAxML: See citation info at http://sco.h-its.org/exelixis/web/software/raxml/

# Version history
v1.0.3: modified code to use phase all samples. Fixed a problem where sample names that were subsets of other names were being incorrectly grepped.

v1.0.2: hybrid_relationships.R now gives list of combinations of parental species for each individual locus ("allele_combinations_by_locus.txt"), as well as the original\ summary across loci ("allele_combinations.txt")

v1.0.1: minor updates to the readmes

v1.0.0: ready to rock 'n' roll
