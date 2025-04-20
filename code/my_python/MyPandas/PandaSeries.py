import pandas as pd

# Pandas Series is like a column in a table.
# 1D array of any type

print("\nLIST OBJ AS SERIES -------------------------------------------------------------------------------------\n")

my_list = [1, 2, 3]
my_col = pd.Series(my_list)
print(my_col)
# default state indexed with nums starting with 0
print(my_col[0])

print("\nCREATE LABELS -------------------------------------------------------------------------------------\n")

# custom indexes
my_col = pd.Series(my_list, index=["one", "two", "three"])
print(my_col)
print(my_col["three"])

print("\nKEY/VALUE OBJ AS SERIES -------------------------------------------------------------------------------------\n")

# The keys of the dictionary become the labels or indexes

my_dict = {"day1": 10, "day2": 20, "day3": 30}
my_col_2 = pd.Series(my_dict)
print(my_col_2)
print(my_col_2["day2"])

print("\nLIMIT ITEMS IN TABLE -------------------------------------------------------------------------------------\n")

# specify the indexes u want n omit others
my_col_2 = pd.Series(my_dict, index=["day1", "day2"])
print(my_col_2)

print("\nDATA FRAMES -------------------------------------------------------------------------------------\n")

# Data sets in Pandas are usually multi-dimensional tables, called DataFrames.
# Series is like a column, a DataFrame is the whole table.

# Create a DataFrame from two Series:

data = {
    "col1": ["u1", "u2", "u3"],
    "col2": [1, 2, 3]
}
table = pd.DataFrame(data)
print(table)
