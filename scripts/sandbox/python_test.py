#%%
import os.path

# %%
import re

#%%
import numpy as np

# %%
diet_array = np.arange(1, 121).reshape((15, 8))
diet_array

#%%
diet_array = diet_array.astype(str)
np.char.zfill(diet_array, 3)

# %%
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

# %%
path = '../input_dir/D35_006_C_S74_L001_R1_001.fastq.gz'
#make take in name from generated file list
# %%
basename = os.path.basename(path)

# %%
print(basename)

# %%
seq1_str = str(basename)
seq1_str
# %%
seq_list = seq1_str.split("_")
seq_list
# %%
#seq_list[0].replace("D", "Day")

# %%
#day_list = list(seq_list[0])

# %%
#day_list[0] = 'Day'

# %%
#seq_list[0]

#%%
day = seq_list[0]

# %%
day = day[:1] + "ay" + day[1:]
day
# %%
sample = seq_list[1]
sample

#%%
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

# %%
sample = "Sample" + sample[:]
sample
# %%
treatment = seq_list[2]

# %%
treatment = "Treatment" + treatment[:]
treatment
# %%
#diet = seq_list[3]
#diet = "Diet[ABCD]"
#diet

# %%
new_name = day + '_' + sample + '_' + diet  + '_' + treatment + '_' + seq_list[5] + '.fastq.gz'
new_name
# %%
