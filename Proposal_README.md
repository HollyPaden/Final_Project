# General

This project will work with data from chapter 3 of my disseration, concerning changes in the mouse microbiome.

There are 90 files, including a null sample.  It would be ideal to be able to ` grep ` these for matching primers and, if possible, figure out an automated renaming system to make them more clear.

## Naming

- Current names include:

    - Day 

        - Format  is D#, where numbers are either 6, 16, 29, or 35

        - Note: exception for T-1 samples, which are written as T_1#, where the number is the sample #
    - Chemotherapeutic treatment

        - Either "C" or "V" for "chemotherapy" or "vehicle"

            - Recode "C" as "T" for "treatment", in case diet naming can be done

        - Note: this only applies for day 35 samples, as no treatment was given prior to that point

    - Sample #

    - Diet treatment
    
        - Diets are A, B, C, or D, but stride is difficult because initial array was made to consider cancer treatment

            - E.g. Sample 1 = diet A vehicle; Sample 2 = diet A chemo; Sample 3 = diet B vehicle

- Ideal rename would be written as: Day#_Sample#_DietA/B/C/D_TreatmentT/V/NA

    - Note: T-1 days would be in format D-1

    - Note: It would be ideal to code each for dietary treatment (A, B, C, or D) too, but as diets were assigned in an array, this may be difficult

    - Note: Determine how null should be coded, if at all

    - Note: There may be an issue in that some samples were taken twice to compensate for moderate/poor DNA extraction.  Determine how to circumvent

        - Occurs in samples Day29_Sample109 and Day16_Sample81

            - Written as D29109_a_L001-ds.0d5fc9b98378424dbbdf1f3787dec1c1 and D29109_b_L001-ds.5cd05ac838964a2abde7ac8e10fb28e7

    - Note: Six samples on day35 break convention and do not begin with a "D" (begin with "35" instead)

        - Example: 35C108_L001-ds.d5a01f12daca465c9729bc98bdd04471

- Example of ideal: Day6_Sample94_DietC_TreatmentNA

- Current name of file: D697_L001-ds.8754189721b2427f95fd64e8116442c3

## Primers

- Forward: AYT GGG YDT AAA GNG

- Reverse: TAC NVG GGT ATC TAA TCC

### IUPAC substitutions

- Forward: A[CT]TGGG[CT][AGT]TAAAG[ACTG]G

- Reverse: TAC[AGCT][ACG]GGGTATCTAATCC

# Languages
 
Write a series of loops in Bash
- Use scripts from week05 as springboard for writing loops

Optional challenge to write a simple program in Python

Code from scratch

## Script needs

Write individual scripts for each step

- Renaming

- File list generation for looping

- Primer search and output

## Outputs

- .txt file with file list

- Trimmed/searched sequences *renamed*

- Cutadapt report output *if using Cutadapt*

## Notes

- Attempt this with one forward/reverse set of files first -> expand and check reproducibility

- All current fastq files are compressed. 
*Will have to unzip or use 'z' analogs of commands*

# Uncertainties

- Graded aspects seem to be met by scope of proposal **confirm**

- Determine purpose of Snakemake and how this will be addressed in this project

- **Clarify if Cutadapt program is right for this project**

    - Confirm exactly what Cutadapt does before adding to project (avoid superfluous steps)

- Determine how to include diets in renaming process

- Decide whether to inlcude Null and, if so, how to rename

# Explanation

This data is a portion of my dissertation and being able to quickly parse through it will help me to better manage it as I begin a more thorough data processing.  Using this will make an ideal start point.