"""
A basic workflow with FASTQ files as input and trimmed files and cutadapt log as output
"""

SAMPLES = glob_wildcards("../input_dir/{smp}.fastq.gz").smp

localrules: all

rule all:
    """
    First rule, used to prompt full workflow execution
    """
    input:
        expand("output_dir/trimmed_fastq/{smp}.fastq.gz", smp=SAMPLES)

rule rename:
    """
    Renames fastq files in the format 'Day##_Sample###_DietA/B/C/D_TreatmentC/V/NA_R1/2.fastq.gz'
    """
    input:
        "input_dir/{smp}.fastq.gz",
    output:
        "output_dir/renamed_fastq/{smp}.fastq.gz",
    log:
        "output_dir/log/rename/{smp}.log",
    shell:
        "scripts/finalized/file_renaming.py {input} > {output} 2>{log}"

rule cutadapt:
    """
    Runs cutadapt on fastq.gz to trim and output cutadapt dialog
    """
    input:
        "output_dir/renamed_fastq/{smp}.fastq.gz",
    output:
        "output_dir/trimmed_fastq/{smp}.fastq.gz",
    log:
        "output_dir/log/cutadapt/{smp}.log".
    shell:
        "scripts/finalized/cutadapt.sh {input} > {output} 2>{log}"