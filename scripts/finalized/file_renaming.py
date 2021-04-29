#%%
# import modules needed for renaming
import os.path
import os, sys
import re
import numpy as np
from shutil import copyfile
import sys
#%%
# generate the diet array in a 15 row by 8 column pattern with 120 numbers beginning at 1
print("Generating diet array and assigning diets")
diet_array = np.arange(1, 121).reshape((15, 8))
print(diet_array)
#%%
# convert array to string so that floating zeros can be used to make all numbers 3 digits long
diet_array = diet_array.astype(str)
np.char.zfill(diet_array, 3)
#%%
# Assign Diets A-D with 2 columns per diet
A = np.char.zfill(diet_array[ :, 0:2], 3)
print(A)
# %%
B = np.char.zfill(diet_array[ :, 2:4], 3)
print(B)
# %%
C = np.char.zfill(diet_array[ :, 4:6], 3)
print(C)
# %%
D = np.char.zfill(diet_array[ :, 6:8], 3)
print(D)
#%%
# determine relative path and strip to basename
input=sys.argv[1]
#%%
print("Original name...")
basename = os.path.basename(input)
print(basename)
#%%
# convert basename to a string and then split into a list by the delimiter "_"
print("Begin renaming process, please wait...")
seq1_str = str(basename)
print(seq1_str)
# %%
seq_list = seq1_str.split("_")
print(seq_list)
#%%
# assign "day" as the first item in the list, then insert "ay" between "D" and "##"
day = seq_list[0]
#%%
day = day[:1] + "ay" + day[1:]
print(day)
#%%
# assign "sample" first and then use it to determine "diet" before further editing "sample"
sample = seq_list[1]
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

print(diet)
#%%
# now add the word "saample" in front of our sample ##
sample = "Sample" + sample[:]
print(sample)
#%%
# assign "treatment" to the third item in the list and add the word "Treatment" in front of it
treatment = seq_list[2]
#%%
treatment = "Treatment" + treatment[:]
print(treatment)
#%%
# create the new name by assembling "day", "sample", "diet", and "treatment" in order, separated by "_" delimiter
# follow "treatment" with the 6th list item, which shows if the fastq is forward or reverse
# end by adding "fastq.gz" to the end of the file name
new_name = day + '_' + sample + '_' + diet  + '_' + treatment + '_' + seq_list[5] + '.fastq.gz'
print("Renaming complete...")
print(new_name)
# create a complete new name with path
full_new_name = "output_dir"+'/'+"renamed_fastq"+'/'+new_name
#%%
# make an old name with input path for simple replacement
oldname = input
#%%
# assign the rename to the file and save it to the "renamed" output directory
print("Saving renamed file")
copyfile(oldname, full_new_name)
print("Complete")