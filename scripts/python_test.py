#%%
import os.path

# %%
import re

# %%
path = '../input_dir/D35_006_C_S74_L001_R1_001.fastq.gz'

# %%
basename = os.path.basename(path)

# %%
print(basename)

# %%
seq1_str = str(basename)

# %%
seq_list = seq1_str.split("_")

# %%
#seq_list[0].replace("D", "Day")

# %%
day_list = list(seq_list[0])

# %%
day_list[0] = 'Day'

# %%
seq_list[0]

#%%
day = seq_list[0]

# %%
day = day[:1] + "ay" + day[1:]
day
# %%
sample = seq_list[1]

# %%
sample = "Sample" + sample[:]
sample
# %%
treatment = seq_list[2]

# %%
treatment = "Treatment_" + treatment[:]
treatment
# %%
diet = seq_list[3]
diet = "Diet[ABCD]"
diet

# %%
new_name = day + '_' + sample + '_' + treatment  + '_' + diet + '_' + seq_list[5] + '.fastq.gz'
new_name
# %%
