import pandas as pd
# A simple way to store big data sets is to use CSV files (comma separated files).

# large DataFrame with many rows, Pandas will only return the first 5 rows, and the last 5 rows:
df = pd.read_csv("./assets/data.csv")
print(df)

print("\nPRINT ALL ROWS -------------------------------------------------------------------------------------\n")

print(df.to_string())

print("\n GET MAX ROWS -------------------------------------------------------------------------------------\n")

# check system's maximum rows. number of rows returned is defined in Pandas option settings.
print(pd.options.display.max_rows) # 60

print("\n SET MAX ROWS -------------------------------------------------------------------------------------\n")

# this way without to_string() method u can print all rows
pd.options.display.max_rows = 999

print(df)
