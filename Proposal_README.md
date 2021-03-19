This project will work with data from chapter 3 of my disseration, concerning changes in the mouse microbiome.

There are 90 files, including a null sample.  It would be ideal to be be able to ` grep ` these for matching primers and, if possible, figure out an automated renaming system to make them more clear.

*note that this may only be possible to the day, sample, and treatment level, as researchers were blinded to diet treatment until after naming had been assigned*

Use scripts from week05 as basis for writing loop (see if you can write a series of loops in Bash as well as write a simpple program in Python)

# Script needs

- Renaming

- File list generation for looping

- Primer search and output

# Outputs

- 

Don't forget that your current fastq files are compressed

*will have to unzip or use 'z' analogs of commands*

**Clarify what cutadapt program actually does and see if it's right for your project**

# Primers are as follows

- Forward: AYT GGG YDT AAA GNG

- Reverse: TAC NVG GGT ATC TAA TCC

## IUPAC substitutions

- Forward: A[CT]TGGG[CT][AGT]TAAAG[ACTG]G

- Reverse: TAC[AGCT][ACG]GGGTATCTAATCC