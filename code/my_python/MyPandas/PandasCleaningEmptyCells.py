import pandas as pd

"""
Data cleaning means fixing bad data in your data set.

bad data means
1. missing data
2. wrong data
3. duplicate data
4. wrong format
"""

# Empty cells can potentially give you a wrong result when you analyze data.

df = pd.read_csv("../assets/data_small.csv")
print(df.to_string())

print("\nREMOVE ROWS -------------------------------------------------------------------------------------\n")

# remove rows with empty cells. wont impact large data
# removes all rows where any cell contains NaN, Null, etc
# By default, the dropna() method returns a new DataFrame, and will not change the original.
# to change the original DataFrame, use the inplace = True argument
# the dropna(inplace = True) will NOT return a new DataFrame, but it will remove all rows containing NULL values from the original DataFrame.
new_df = df.dropna(inplace=False)  # if inplace = True then it does not retrun a data frame obviously since its changing the original
print(new_df.to_string())

print("\nREPLACE EMPTY VALUES -------------------------------------------------------------------------------------\n")

df = pd.read_csv("../assets/data_small.csv")
new_df = df.fillna(0, inplace=False)  # same logic as above for inplace flag
print(new_df.to_string())

print("\nREPLACE EMPTY VALUES SPECIFIC COL -------------------------------------------------------------------------------------\n")

df = pd.read_csv("../assets/data_small.csv")
new_calories_col = df["Calories"].fillna(111, inplace=False)  # if not inplace then this returns calories col
print(new_calories_col.to_string())

print("\nREPLACE USING MEAN OF COL -------------------------------------------------------------------------------------\n")
# Mean = the average value (the sum of all values divided by number of values).
# A common way to replace empty cells, is to calculate the mean, median or mode value of the column.
df = pd.read_csv("../assets/data_small.csv")
mean = f"{df["Calories"].mean():.1f}" # 322.7
new_calories_col = df["Calories"].fillna(mean, inplace=False)
print(new_calories_col)

print("\nREPLACE USING MEDIAN OF COL -------------------------------------------------------------------------------------\n")
# Median = the value in the middle, after you have sorted all values ascending.

df = pd.read_csv("../assets/data_small.csv")
median = df["Calories"].median() # 300.0
new_calories_col = df["Calories"].fillna(median, inplace=False)
print(new_calories_col)

print("\nREPLACE USING MODE OF COL -------------------------------------------------------------------------------------\n")
# Mode = the value that appears most frequently.

df = pd.read_csv("../assets/data_small.csv")
mode = df["Calories"].mode()[0] # 195.1
new_calories_col = df["Calories"].fillna(mode, inplace=False)
print(new_calories_col)

print("\nINPLACE TRUE -------------------------------------------------------------------------------------\n")

df = pd.read_csv("../assets/data_small.csv")
mode = df["Calories"].mode()[0] # 195.1
df.fillna({"Calories":mode}, inplace=True)
print(df.to_string())
