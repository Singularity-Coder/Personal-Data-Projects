import pandas as pd
# remove the rows
# convert all cells in the columns into the same format.

print("\nCORRECT WRONG FORMAT -------------------------------------------------------------------------------------\n")

# convert all cells in the 'Date' column into dates.
df = pd.read_csv("../assets/data_small.csv")
print(df.to_string())
print()
df["Date"] = pd.to_datetime(df["Date"]) # from Nan (Not a Number) to NaT (Not a Time)
print(df.to_string())

print("\nREMOVE NULL ROWS -------------------------------------------------------------------------------------\n")

# NaT, Nan are null values
df.dropna(subset=["Date"], inplace=True) # removes all date rows with NaT value
print(df)