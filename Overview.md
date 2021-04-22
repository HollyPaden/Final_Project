**Overview of script needs**

- Rename (Python = 1 script)

- Run cutadapt (Bash = 1 script)

- Snakemake file and SLURM profile (YAML)

    - Note: not technically scripts

*General*

- Unzip files? --> no

- Primer search and output with Cutadapt --> Bash script

*Name Cleanup --> Python script*

- ~~Rename deviated D35 files~~

- ~~Rename T-1 files?~~

- Rename D6 to D006

- ~~Rename null?~~

- Code for diet treatment "A", "B", "C", or "D"

- Separate sample # from rest of name (will begin on 4th character)

- Fully rename into format "Day##_Sample#_DietA/B/C/D_TreatmentC/V/NA"

**To-do list**

- ~~Determine best way to rename files and what is too much (if anything)~~

    - ~~Figure out if diet coding is feasible --> how~~

    *Update: general renaming complete. Now determine best way to assign and store in appropriate output subdirectory*

- ~~Decide if files should stay zipped or be unzipped~~

    *Done: will stay zipped*

- ~~Write scripts --> test on one --> test on multiple~~

    *Update: renaming script functional, finalized, and commented*

    *Update: cutadapt script funcitonal, finalized, and commented*

        **Note: must adapt to take input/output arguments from Snakefile**

- Import fastq.gz files to OSC

- ~~Create YAML for SLURM profile~~

    *Done: modify if different resources needed*

- Create Snakemake for running scripts --> direct log outputs too!

    *Update: begun, but still needs clarification of how to direct cutadapt output and if this is the correct way to call a python script*

    *Consider if threads need to be used here too*

- Write and thoroughly comment cutadapt script --> direct outputs appropriately

    *Update: begun and script is functional.  Need to clarify how to call input and output from outside the script.  Need to confirm ability to load conda env from within the script*