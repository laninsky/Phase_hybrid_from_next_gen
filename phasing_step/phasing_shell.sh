for i in `ls *.fasta`;
do rm temp*;
rm hybrid*;
mv $i temp;
Rscript extract_hybrid.R;
sed -i 's/\?/N/g' hybrid_ref.fa;
sed -i 's/-//g' hybrid_ref.fa;
/home/a499a400/bin/bwa-0.7.12/bwa index -a is hybrid_ref.fa;
/home/a499a400/bin/samtools-1.2/samtools faidx hybrid_ref.fa;
java -jar /home/a499a400/bin/picard/dist/picard.jar CreateSequenceDictionary R=hybrid_ref.fa O=hybrid_ref.dict;
/home/a499a400/bin/bwa-0.7.12/bwa mem hybrid_ref.fa /home/a499a400/Kaloula/cleaned-reads/kaloula_pictameridionalishybrid_rmb586/split-adapter-quality-trimmed/kaloula_pictameridionalishybrid_rmb586-READ1.fastq.gz /home/a499a400/Kaloula/cleaned-reads/kaloula_pictameridionalishybrid_rmb586/split-adapter-quality-trimmed/kaloula_pictameridionalishybrid_rmb586-READ2.fastq.gz > temp.sam;
java -jar /home/a499a400/bin/picard/dist/picard.jar AddOrReplaceReadGroups I=temp.sam O=tempsort.sam SORT_ORDER=coordinate LB=rglib PL=illumina PU=pixme SM=hybrid;
java -jar /home/a499a400/bin/picard/dist/picard.jar MarkDuplicates MAX_FILE_HANDLES=1000 I=tempsort.sam O=tempsortmarked.sam M=temp.metrics AS=TRUE;
java -jar /home/a499a400/bin/picard/dist/picard.jar SamFormatConverter I=tempsortmarked.sam O=tempsortmarked.bam;
/home/a499a400/bin/samtools-1.2/samtools index tempsortmarked.bam;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -R hybrid_ref.fa -I tempsortmarked.bam -o tempintervals.list;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T IndelRealigner -R hybrid_ref.fa -I  tempsortmarked.bam -targetIntervals tempintervals.list -o temp_realigned_reads.bam;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T HaplotypeCaller -R hybrid_ref.fa -I temp_realigned_reads.bam --genotyping_mode DISCOVERY -stand_emit_conf 30 -stand_call_conf 30 -o temp_raw_variants.vcf;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T ReadBackedPhasing -R hybrid_ref.fa -I temp_realigned_reads.bam  --variant temp_raw_variants.vcf -o temp_phased_SNPs.vcf;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T FastaAlternateReferenceMaker -V temp_phased_SNPs.vcf -R hybrid_ref.fa -o temp_alt.fa;
touch "ONE"_$i;
Rscript onelining.R;
sed -i 's/>1/>k_pix_e/g' hybrid_ref2.fa;
cat temp.fa hybrid_ref2.fa >> "ONE"_$i;
rm -rf hybrid_ref.*;
mv hybrid_ref2.fa hybrid_ref.fa;
mv temp.fa safetemp;
rm -rf temp*;
mv safetemp temp.fa;
/home/a499a400/bin/bwa-0.7.12/bwa index -a is hybrid_ref.fa;
/home/a499a400/bin/samtools-1.2/samtools faidx hybrid_ref.fa;
java -jar /home/a499a400/bin/picard/dist/picard.jar CreateSequenceDictionary R=hybrid_ref.fa O=hybrid_ref.dict;
/home/a499a400/bin/bwa-0.7.12/bwa mem hybrid_ref.fa /home/a499a400/Kaloula/cleaned-reads/kaloula_pictameridionalishybrid_rmb586/split-adapter-quality-trimmed/kaloula_pictameridionalishybrid_rmb586-READ1.fastq.gz /home/a499a400/Kaloula/cleaned-reads/kaloula_pictameridionalishybrid_rmb586/split-adapter-quality-trimmed/kaloula_pictameridionalishybrid_rmb586-READ2.fastq.gz > temp.sam;
java -jar /home/a499a400/bin/picard/dist/picard.jar AddOrReplaceReadGroups I=temp.sam O=tempsort.sam SORT_ORDER=coordinate LB=rglib PL=illumina PU=pixme SM=hybrid;
java -jar /home/a499a400/bin/picard/dist/picard.jar MarkDuplicates MAX_FILE_HANDLES=1000 I=tempsort.sam O=tempsortmarked.sam M=temp.metrics AS=TRUE;
java -jar /home/a499a400/bin/picard/dist/picard.jar SamFormatConverter I=tempsortmarked.sam O=tempsortmarked.bam;
/home/a499a400/bin/samtools-1.2/samtools index tempsortmarked.bam;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -R hybrid_ref.fa -I tempsortmarked.bam -o tempintervals.list;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T IndelRealigner -R hybrid_ref.fa -I  tempsortmarked.bam -targetIntervals tempintervals.list -o temp_realigned_reads.bam;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T HaplotypeCaller -R hybrid_ref.fa -I temp_realigned_reads.bam --genotyping_mode DISCOVERY -stand_emit_conf 30 -stand_call_conf 30 -o temp_raw_variants.vcf;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T ReadBackedPhasing -R hybrid_ref.fa -I temp_realigned_reads.bam  --variant temp_raw_variants.vcf -o temp_phased_SNPs.vcf;
java -jar /home/a499a400/bin/GenomeAnalysisTK.jar -T FastaAlternateReferenceMaker -V temp_phased_SNPs.vcf -R hybrid_ref.fa -o temp_alt.fa;
touch "TWO"_$i;
Rscript onelining.R;
sed -i 's/>1/>k_pix_e/g' hybrid_ref2.fa;
cat temp.fa hybrid_ref2.fa >> "TWO"_$i;
done;
