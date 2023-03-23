# RNA fusion quant 

======================================================

Snakemake workflow for RNA analysis of gene fusions and quantification of transcript expression. 

======================================================

run on your local machine:  
1) set up and configure units.tsv in config/ folder  
2) identify the run folder (where the sequencer saved your run data)  
3) do a dry-run  

```
snakemake -npr --config runID="20230125_RNASeq"

```

4) run the job locally (choose the correct runID - this can be found in the SampleSheet.csv)
```
time snakemake -j48 --config runID="20230125_RNASeq"
```

======================================================

## conda/mamba and other [dependencies](https://github.com/schimar/rna_fusion_quant/blob/main/workflow/envs/s7.yaml)   

create environment from yaml file (in envs/):
```
# create the environment (note that conda & mamba have to be installed for this to work):

mamba env create -f envs/s6.yaml

# with this, you can activate the environment with all [dependencies](https://github.com/schimar/rna_fusion_quant/blob/main/workflow/envs/s7.yaml):
conda activate smk6


# if you've added new software to install to the conda environment, then you can update:
mamba env update -f envs/s7.yaml
```

## with SLURM, submit the job:
```
sbatch code/clusterSnakemake.sh
```


### Deprecated (or rather: not used here): submit on PBS
```
qsub code/clusterSnakemake.pbs
```




