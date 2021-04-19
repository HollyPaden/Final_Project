#%%
# import regular expressions, numpy, and os needed for renaming
import os.path
import os.rename
import re
import numpy as np
#%%
# generate the diet array in a 15 row by 8 column pattern with 120 numbers beginning at 1
diet_array = np.arange(1, 121).reshape((15, 8))
diet_array
#%% convert array to string so that floating zeros can be used to make all numbers 3 digits long
diet_array = diet_array.astype(str)
np.char.zfill(diet_array, 3)
#%%
# Assign Diets A-D with 2 columns per diet
A = np.char.zfill(diet_array[ :, 0:2], 3)
A
# %%
B = np.char.zfill(diet_array[ :, 2:4], 3)
B
# %%
C = np.char.zfill(diet_array[ :, 4:6], 3)
C
# %%
D = np.char.zfill(diet_array[ :, 6:8], 3)
D
#%%
# determine relative path and strip to basename
path = '../input_dir/D35_006_C_S74_L001_R1_001.fastq.gz'
#%%
basename = os.path.basename(path)
print(basename)
#%%
# convert basename to a string and then split into a list by the delimiter "_"
seq1_str = str(basename)
seq1_str
# %%
seq_list = seq1_str.split("_")
seq_list
#%%
# assign "day" as the first item in the list, then insert "ay" between "D" and "##"
day = seq_list[0]
#%%
day = day[:1] + "ay" + day[1:]
day
#%%
# assign "sample" first and then use it to determine "diet" before further editing "sample"
sample = seq_list[1]
sample
#%%
# use the "diet" array and an `if` loop to determine diet based on sample ###
diet = seq_list[3]

if sample in A:
    diet = "DietA"
elif sample in B:
    diet = "DietB"
elif sample in C:
    diet = "DietC"
elif sample in D:
    diet = "DietD"

diet
#%%
# now add the word "saample" in front of our sample ##
sample = "Sample" + sample[:]
sample
#%%
# assign "treatment" to the third item in the list and add the word "Treatment" in front of it
treatment = seq_list[2]
#%%
treatment = "Treatment" + treatment[:]
treatment
#%%
# create the new name by assembling "day", "sample", "diet", and "treatment" in order, separated by "_" delimiter
# follow "treatment" with the 6th list item, which shows if the fastq is forward or reverse
# end by adding "fastq.gz" to the end of the file name
new_name = day + '_' + sample + '_' + diet  + '_' + treatment + '_' + seq_list[5] + '.fastq.gz'
new_name
#%%
# assign the rename to the file and save it to the "renamed" output directory