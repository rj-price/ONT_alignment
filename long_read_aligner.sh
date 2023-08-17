#!/usr/bin/env bash
#SBATCH -J lra
#SBATCH --partition=medium
#SBATCH --mem=8G
#SBATCH --cpus-per-task=8

# reads = $1
# ref assembly = $2

fileshort=$(basename $1 | sed s/".fastq.gz"//g)

zcat $1 | lra align -ONT -t 8 $2 /dev/stdin -p s > $fileshort.sam

samtools view -@ 8 -bS $fileshort.sam -o $fileshort.bam
samtools sort -@ 8 $fileshort.bam -o $fileshort.sorted.bam
samtools index -@ 8 $fileshort.sorted.bam

rm $fileshort.sam
rm $fileshort.bam