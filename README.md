# Fo apii Alignment

NB. You will need to have [lra](https://anaconda.org/bioconda/lra) and [samtools](https://anaconda.org/bioconda/samtools) installed before proceeding.

Copy reads and assemblies into directory.
```
cp ~/projects/niab/hbates/Fus_uha_genomes/AJ720_FOA_R2.fasta .
cp ~/projects/niab/hbates/Fus_uha_genomes/AJ615_Foci.fasta .

cp /mnt/shared/scratch/hbates/Fus_uha/Fo_apii/filtlong_output/AJ720_1kb.fastq.gz .
cp /mnt/shared/scratch/hbates/Fus_uha/Fo_apii/filtlong_output/AJ615_1kb.fastq.gz .

```

Align reads using LRA, sort and index bam.
```
lra index -ONT AJ720_FOA_R2.fasta
lra index -ONT AJ615_Foci.fasta

sbatch long_read_aligner.sh AJ720_1kb.fastq.gz AJ720_FOA_R2.fasta
sbatch long_read_aligner.sh AJ615_1kb.fastq.gz AJ615_Foci.fasta
```
