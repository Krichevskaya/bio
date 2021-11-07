#!/usr/bin/env nextflow

params.fastqBaseName = "$baseDir/sra_data.fastq"
params.refPath = "$baseDir/sequence.fna"
params.outDir = "$baseDir/out"

file_fastq = file(params.fastqBaseName)
file_ref = file(params.refPath)
out_dir = file(params.outDir)

out_dir.mkdir()

process fastqc {

    input:
    file fastq from file_fastq

    script:
    """
    fastqc --outdir ${params.outDir} \
        $fastq
    mv ${out_dir.resolve(fastq.simpleName + "_fastqc.html")} ${out_dir.resolve(fastq.simpleName + ".html")}
    rm ${out_dir.resolve(fastq.simpleName + "_fastqc.zip")}
    """
}

process minimap {

    input: 
    file ref from file_ref

    output:
    file "*" into index

    script:
    """
    minimap2 -d sequence.mmi $ref
    """ 
}

process minimap2 {

    input: 
    file "*" from index
    file fastq from file_fastq

    output:
    file "*" into mem

    script:
    """
    minimap2 -a sequence.mmi $fastq > mem_res_data.sam
    """
}

process samtools {

    input:
    file mem_res from mem

    output:
    path "*" into samtools_flagstat

    script:
    """
    samtools flagstat $mem_res > flagstat_result.txt
    """
}

process evaluation {
    input:
    path flagstat_result from samtools_flagstat

    output:
    stdout into result

    script:
    """
    echo \$( grep -oP '\\d+\\.\\d+' $flagstat_result ) ">90" | bc 
    """
}

result.subscribe { 
    if ( it.toInteger() == 1 )
        println("OK")
    else
        println("Not OK")
}