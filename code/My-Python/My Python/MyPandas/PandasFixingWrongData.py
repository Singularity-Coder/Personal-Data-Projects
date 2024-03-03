import pandas as pd
import math
print("\nREPLACING WRONG VALUES MANUALLY -------------------------------------------------------------------------------------\n")

df = pd.read_csv("../assets/data_small.csv")
print(df)
print()

# df.loc[row_num, col_name] = value
df.loc[2, "Duration"] = df["Duration"].mean() # 51.25
print(df)

print("\nREPLACING WRONG VALUES LOOP -------------------------------------------------------------------------------------\n")

df = pd.read_csv("../assets/data_small.csv")
for x in df.index:
    if df.loc[x, "Duration"] > 50:
        df.loc[x, "Duration"] = 50

print(df)

print("\nREMOVE ROWS -------------------------------------------------------------------------------------\n")
# https://www.turing.com/kb/nan-values-in-python

df = pd.read_csv("../assets/data_small.csv")

print(type(df.loc[2, "Duration"])) # NaN type <class 'numpy.float64'>
print(math.isnan(df.loc[2, "Duration"])) # True
print(float('NaN')) # nan
print(df.loc[2, "Duration"] == float('NaN')) # False

for x in df.index:
    if math.isnan(df.loc[x, "Duration"]):
        df.drop(x, inplace=True)

print(df)