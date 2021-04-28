# General

This project will work with data from chapter 3 of my disseration, concerning changes in the mouse microbiome.

In this experiment, 116 c57Bl/6 female mice were subject to ovariectomy and seven days later were put on a formulated diet of either high fat-high carbohydrates, high fat-low carbohydrates, low fat-high carbohydrates, or low fat-low carbohydrates.  7 days later, mice were inoculated with E0771 cells, and 12 days after were subject to mastectomy.  11 days post-surgery, mice were treated with either a saline or chemotherapeutic agent, and 6 days later were sacrificed.  Fecal samples were obtained at 7 timepoints throughout the study.  Samples were randomly selected from each dietary and treatment group for DNA extraction and subsequent sequencing.  The purpose of this project is to clean the resulting sequence files and prepare them for further data analysis.

There are 90 files, including a null sample.  It would be ideal to be able to ` grep ` these for matching primers and, if possible, figure out an automated renaming system to make them more clear.

## Naming

- Current names include:

    - Day 

        - Format  is D#, where numbers are either 6, 16, 29, or 35

    - Chemotherapeutic treatment

        - Either "C" or "V" for "chemotherapy" or "vehicle"

        - Note: this only applies for day 35 samples, as no treatment was given prior to that point

        - All days without treatment are coded as "NA"

    - Sample #

    - Diet treatment
    
        - Diets are A, B, C, or D, but stride is difficult because initial array was made to consider cancer treatment

            - E.g. Sample 1 = diet A vehicle; Sample 2 = diet A chemo; Sample 3 = diet B vehicle

- Ideal rename would be written as: Day#_Sample#_DietA/B/C/D_TreatmentT/C/NA

    - Note: It would be ideal to code each for dietary treatment (A, B, C, or D) too, but as diets were assigned in an array, this may be difficult

- Example of ideal: Day35_Sample006_DietC_TreatmentC_R1.fastq.gz

- Current name of file: D35_006_C_S74_L001_R1_001.fastq.gz

## Primers

- Forward: AYT GGG YDT AAA GNG

- Reverse: TAC NVG GGT ATC TAA TCC

### IUPAC substitutions

- Forward: A[CT]TGGG[CT][AGT]TAAAG[ACTG]G

- Reverse: TAC[AGCT][ACG]GGGTATCTAATCC

# Languages
 
Write cutadapt script in Bash
- Use script from week06 as springboard

Optional challenge to write a simple program in Python

    *Update*: Python used for renaming

Code from scratch

## Script needs

Write individual scripts for each step

- Renaming

- File list generation for looping

- Primer search and output

## Outputs

- Renamed sequences

- Trimmed/searched sequences *renamed*

- Cutadapt report output *if using Cutadapt*

## Notes

- Attempt this with one forward/reverse set of files first -> expand and check reproducibility

- All current fastq files are compressed. 
~~*Will have to unzip or use 'z' analogs of commands*~~

# Uncertainties

- Graded aspects seem to be met by scope of proposal **confirm**

- Determine purpose of Snakemake and how this will be addressed in this project

- **Clarify if Cutadapt program is right for this project**

    - Confirm exactly what Cutadapt does before adding to project (avoid superfluous steps)
    
    *Update*: confirmed, Cutadapt is exactly the right tool for this project

- Determine how to include diets in renaming process

# Explanation

This data is a portion of my dissertation and being able to quickly parse through it will help me to better manage it as I begin a more thorough data processing.  Using this will make an ideal start point.