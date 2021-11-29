#!/bin/bash

fastqc $1.fastq
mv $1_fastqc.html $1.html
rm $1_fastqc.zip

minimap2 -d $2.mmi $2.fna
minimap2 -a $2.mmi $1.fastq > $1.sam

samtools flagstat $1.sam > $1_result.txt

if (( $( echo $( grep -oP '\d+\.\d+' $1_result.txt )">90" | bc ) )); then
    echo "Ok"
else
    echo "Not Ok"
fi