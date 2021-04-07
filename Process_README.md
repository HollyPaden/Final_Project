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

                - update as "Treatment_\w"

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

            - "new_name = day + '_' + sample + '_' + treatment  + '_' + diet + '_' + list[5] + '.fastq.gz'"