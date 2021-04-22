Git repository created

made README file for project proposal

    - refer to Proposal_README.md for full proposal

Created directories for reference scripts from previous project with similar but simpler process

    - see directory "References"

Began work on scripts: 

    Created directories for input, results, and scripts

    Adapted fastq_file_list.sh from References shell script

    Adapted gzip_file_list.sh from References shell script

    Adapted unzip.sh from References shell script
    
        **Note: discard.  Leave all files zipped, since cutadapt works on zipped files**

    Adapted renaming.sh from References shell script

        **Note: discard if this is easier in Python**

Created document for complete projects needs and checklist of to-do items

    - refer to Overview.md

Uploaded one file to input_dir for testing

Created directory within scripts for sandbox scripts

    Began working on possible method for renaming in Python

        Code from scratch: involves the following

            - import re for regex use and os.path for basename generation

            - Use `path` to create a basename

                **Note: this will need to be generated in a loop through an array in the future**

            - convert basename to a string

            - split string by "_" and convert to list

            - list[0] = day

                - current format "D##"

                - update as "Day##"

            - list[1] = sample

                - current format "###"

                - update as "Sample###"

            - list[2] = treatment

                - current format "\w"

                - update as "Treatment\w"

            - list[3] = *

                - current format is junk

                - update by replace with "Diet[ABCD]"

                    **Note: will need to determine how to assign Diet in different script.  Placeholder for now**

            - list[4] = *

                - current format is junk -> remove

            - list[5] = R[12]

                - keep as is

            - list[6] = dada.fastq.gz

                - would need to split again and remove dada.  Possible, but easier to remove and reassign ".fastq.gz" as string -> remove

            - "new_name = day + '_' + sample + '_' + diet  + '_' + treatment + '_' + list[5] + '.fastq.gz'"

Converted array to string elements -> add leading 0s so that all strings are 3 characters long

    - wrote `if` loop for dietary assignment into python_test -> updated new_name final product

Created directories to divide Python from Bash scripts and separated "sandbox" from "finalized" scripts (4.19.21)

Created finalized python renaming script and completely commented and cleaned from what was in the sandbox (4.19.21)

Created directories for slurm profile and snakemake workflow (4.19.21)

Created subdirectories in output for renaming, trimming, snakemake logs, and cutadapt output (4.19.21)

Updated Overview.md with recommendations for improvement from "Final Project: Progress Report" (4.19.21)

    - note: dates for Process_README will be added from this point forward, as recommended in Progress Report (4.19.21)

        Style will be Month.Date.Year

            - **clarify if this should be shifted for best practices**

Created YAML file for SLURM profile and updated it with basic options and resources as seen in Week 13 exercises (4.19.21)

Created snakemake file and added an "all" rule, as well as two main rules: "rename" and "cutadapt" (4.19.21)

Minor changes made to SLURM profile, Snakefile, and reference script for readability in screen captures for PPT (4.21.21)

Removed SLURM directives and changed primers from reference to sandbox version of Cutadapt script (4.22.21)

Cut down superfluous parts of Cutadapt script to only include basic functions and explanatory echoes (4.22.21)

Tested Cutadapt script until successful --> duplicate final product to scripts/finalized (4.22.21)

Update Process_README and Overview appropriately (4.22.21)

Added .gitignore to project directory so that input and output directories would be ignored completely (4.22.21)

Updated renaming script to copy file and assign newname in appropriate direcotry (4.22.21)

Modified snakefile to take all arguments and run rules appropriately...

    *Note: work in progress.  Some issues with globbing twice within a rule* (4.22.21)