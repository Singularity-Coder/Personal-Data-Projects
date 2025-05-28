import pandas as pd

# calculates the relationship between each column in your data set.
# ignores "not numeric" columns.
# represents how well the relationship is between two columns from -1 to 1
# What is a good correlation? safe to say you have to have at least 0.6 (or -0.6) to call it a good correlation.
"""
1 is perfect correlation. if one goes up other will also go up
0.9 is good. likely other will also go up
-0.9 is also good. but reverse. if one goes up then other will go down
0.2 is not good. very little chance other value might move
"""
df = pd.read_csv("../assets/data.csv")
print(df.corr())

# perfect correlation: Each col when compared to itself obviously gives perfect corr
# good correlation: w.r.t duration colories has good corr. which means u burn more calories the more duration u workout. This is prediction or deduction or inference
# bad correlation: all < 0.6. we cant predict confidently anything with these nums