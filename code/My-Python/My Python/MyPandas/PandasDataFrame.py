import pandas as pd

# 2D DS like 2D array or table

data = {
    "col1": ["day1", "day2", "day3", "day4", "day5", "day6"],
    "col2": [111, 222, 333, 444, 555, 666],
}

table = pd.DataFrame(data)
print(table)

print("\nLOCATE ROW -------------------------------------------------------------------------------------\n")

# refer to row index
print(table.loc[0])  # returns Series

print("\nLOCATE SUB TABLE -------------------------------------------------------------------------------------\n")

# use list of indexes
print(table.loc[[0, 3, 5]])  # returns Dataframe

print("\nNAMED INDEXES -------------------------------------------------------------------------------------\n")

table = pd.DataFrame(data, index=["a", "b", "c", "d", "e", "f"])
print(table)

print("\nLOCATE NAMED INDEX -------------------------------------------------------------------------------------\n")

print(table.loc["c"])

print("\nLOAD FILES INTO DATAFRAME -------------------------------------------------------------------------------------\n")

# https://pandas.pydata.org/docs/reference/api/pandas.read_sql.html
# https://wsform.com/knowledgebase/sample-csv-files/
# https://file-examples.com/index.php/sample-documents-download/sample-xls-download/
# https://www.textfixer.com/html/html-table-generator.php
# https://learn.microsoft.com/en-us/previous-versions/windows/desktop/ms762271(v=vs.85)
# https://sample-videos.com/download-sample-sql.php
# pip install xlrd - for excel support
# pip install lxml - for html support
# pip install sqlalchemy - for sql support

df = pd.read_csv("../assets/color_srgb.csv")
print(df)
print()
df = pd.read_json("../assets/random2.json")
print(df)
print()
df = pd.read_excel("../assets/dummy_excel.xls")
print(df)
print()
df = pd.read_html("../assets/dummy_html_table.html")
print(df)
print()
df = pd.read_xml("../assets/dummy_xml_table.xml")
print(df)
print()










