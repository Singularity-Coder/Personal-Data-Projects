import pandas as pd

print("\nDISCOVER DUPS -------------------------------------------------------------------------------------\n")

df = pd.read_csv("../assets/data_small.csv")
print(df.duplicated())

print("\nREMOVE DUPS -------------------------------------------------------------------------------------\n")

# The (inplace = True) will make sure that the method does NOT return a new DataFrame, but it will remove all duplicates from the original DataFrame.
df.drop_duplicates(inplace=True)
print(df)