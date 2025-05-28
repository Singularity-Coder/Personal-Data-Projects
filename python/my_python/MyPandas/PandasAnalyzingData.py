import pandas as pd

print("\nTOP X OR 5 VALUES -------------------------------------------------------------------------------------\n")

df = pd.read_csv("../assets/data.csv")
print(df.head()) # default 5 rows
print()
print(df.head(10))

print("\nBOTTOM X OR 5 VALUES -------------------------------------------------------------------------------------\n")

print(df.tail())
print()
print(df.tail(10))

print("\nINFO ABT DATA -------------------------------------------------------------------------------------\n")

# gives total values, col count, non null count for each col, data type of each col
print(df.info())

# clean data - rows with nulls must be removed