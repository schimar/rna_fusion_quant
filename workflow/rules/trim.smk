rule get_sra:
    output:
        "sra/{accession}_1.fastq",
        "sra/{accession}_2.fastq",
    log:
        "logs/get-sra/{accession}.log",
    wrapper:
        "v1.23.1/bio/sra-tools/fasterq-dump"


rule cutadapt_pipe:
    input:
        get_cutadapt_pipe_input,
    output:
        pipe("pipe/cutadapt/{sample}_{unit}.{fq}.{ext}"),
    log:
        "logs/pipe-fastqs/cutadapt/{sample}_{unit}.{fq}.{ext}.log",
    wildcard_constraints:
        ext=r"fastq|fastq\.gz",
    threads: 0
    shell:
        "cat {input} > {output} 2> {log}"


rule cutadapt_pe:
    input:
        #fq1 = lambda wildcards: getFqHome(wildcards.sample)[0],
        #fq2 = lambda wildcards: getFqHome(wildcards.sample)[1],
       #fq1="../fq/{sample}_L001_R1.fastq.gz",
       #fq2="../fq/{sample}_L001_R2.fastq.gz",
        #fq1="../fq/{sample}_{unit}_R1_001.fastq.gz",
        #fq2="../fq/{sample}_{unit}_R2_001.fastq.gz",
        get_cutadapt_input,
    output:
        #fastq1="results/trimmed/{sample}_L001_R1.fastq.gz",
        #fastq2="results/trimmed/{sample}_L001_R2.fastq.gz",
        #qc="results/trimmed/{sample}_L001.paired.qc.txt",
        #fastq1="results/trimmed/{sample}_{unit}_R1.fastq.gz",
        #fastq2="results/trimmed/{sample}_{unit}_R2.fastq.gz",
        qc="results/trimmed/{sample}_{unit}.paired.qc.txt",
    log:
        #"logs/cutadapt/{sample}_L001.log",
        "logs/cutadapt/{sample}_{unit}.log",
    params:
        others=config["params"]["cutadapt-pe"],
        adapters=lambda wildcards: "-a " + str(units.loc[wildcards.sample].loc[wildcards.unit, "adapters"]).replace(" ", " -A "),
        extra="--minimum-length 1 -q 20",
    threads: 4
    wrapper:
        "v1.23.4/bio/cutadapt/pe"


rule cutadapt_se:
    input:
        get_cutadapt_input,
    output:
        fastq="results/trimmed/{sample}_{unit}_single.fastq.gz",
        qc="results/trimmed/{sample}_{unit}_single.qc.txt",
    log:
        "logs/cutadapt/{sample}_{unit}.log",
    params:
        others=config["params"]["cutadapt-se"],
        adapters_r1=lambda w: str(units.loc[w.sample].loc[w.unit, "adapters"]),
    threads: 8
    wrapper:
        "1.23.1/bio/cutadapt/se"
