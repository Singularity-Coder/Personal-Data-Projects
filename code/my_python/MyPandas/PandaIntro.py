# has functions for analyzing, cleaning, exploring, and manipulating data.
# name "Pandas" has a reference to both "Panel Data", and "Python Data Analysis"
# analyze big data and make conclusions based on statistical theories.
# can clean messy data sets, and make them readable and relevant
# DS: store, use and analyze data for deriving information from it.

"""
Pandas gives you answers about the data. Like:

Is there a correlation between two or more columns?
What is average value?
Max value?
Min value?
Pandas are also able to delete rows that are not relevant, or contains wrong values, like empty or NULL values. This is called cleaning the data.
"""

# pip install pandas

import pandas as pd

mydataset = {
  'cars': ["BMW", "Volvo", "Ford"],
  'passings': [3, 7, 2]
}

myvar = pd.DataFrame(mydataset)

print(myvar)
print(pd.__version__)