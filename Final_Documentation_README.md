- The purpose of this project is to clean files that I will be using for data analysis in the third chapter of my dissertation

    - Initially, the files were not clearly named in a descriptive way and did not include the dietary treatment --> solve by writing a renaming formula that is clear

    - Running Cutadapt will trim the sequences using specific primers so that further data analysis can take place in the future

- There are a total of three scripts that will be called within one snakemake workflow file

    1) A simple rename_all.sh script acts as a wrapper to rename all files from the input_dir at once, calling on the file_renaming.py to do so

    2) file_renaming.py creates a formula by which input files can be stripped to a basename, broken into a list by "_" delimiter, and revised for clear renaming in the formula 'Day##_Sample###_DietA/B/C/D_TreatmentC/V/NA_R1/2.fastq.gz', then saved to output_dir/renamed_fastq

    3) The script cutadapt.sh takes one file (the forward read) as an input, along with the primer sequences, and intuits the reverse read, prior to running the conda cutadapt program and saving the trimmed sequences and cutadpt output log in appropriate directories

    4) The snakemake defines a function so that wildcards can be used before and after renaming as a checkpoint (rather than a rule).  Rule all is set to run the entire script, followed by the renaming checkpoint, and concluding with the cutadapt rule

- All input fastq.gz files can be found in fs/ess/PAS1855/users/hollypaden/final_project/input_dir

- All scripts, workflows, and profiles can be found in their respective directories in the general final_project directory


-This project can be rerun by calling `snakemake -j1 -p -r --use-conda` from the general final_project directory

    *Note* be sure to activate both the python environment and ipy_env prior to initiating snakemake

        `module load python/3.6-conda5.2`

        `source activate ipy-env`

    *Note* additonal threads can be requested for a higher volume of files for processing.  Can also modify the SLURM profile by finding the file in the final_project/slurm_profile directory

- Please ignore the directory final_project/References, as those scripts were used as templates/springboards for building the final scripts, and are not necessarily linked to the final product

    