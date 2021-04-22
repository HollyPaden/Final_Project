#%%
import numpy as np

# %%
diet_array = np.arange(1, 121).reshape((15, 8))
diet_array

#%%
diet_array = diet_array.astype(str)
np.char.zfill(diet_array, 3)

#%%
#def listToString(s):
 #   str1 = ""
   # for element in s:
    #    str1 += element
    
  #  return (str1.join(s))

#%%
#s = [diet_array]
#listToStr = "".join(elem) for elem in s.astype(str).dtypes
#print(listToStr)

#%%%
#np.char.zfill(listToStr, 3)
#listToStr
#%%
#test_diet_array = []

#for i in range(0, len(diet_array)):
 #   test_diet_array.append([])
  #  for j in range(0, len(diet_array)):
   #     nr = diet_array[i][j]
    #    test_diet_array[i].append(str(nr).zfill(len(str(nr)) + 2))

#print(test_diet_array)

# %%
A = diet_array[ :, 0:2]
A
# %%
B = diet_array[ :, 2:4]
B

# %%
C = diet_array[ :, 4:6]
C

# %%
D = diet_array[ :, 6:8]
D

# %%
