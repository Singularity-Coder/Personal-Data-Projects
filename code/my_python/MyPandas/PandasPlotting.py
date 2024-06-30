import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("../assets/data.csv")

df.plot()
plt.show()

print("\nSCATTER PLOT -------------------------------------------------------------------------------------\n")

# scatter plot needs an x- and a y-axis.
# use "Duration" for the x-axis and "Calories" for the y-axis. These 2 have high correlation

df.plot(kind="scatter", x="Duration", y="Calories")
plt.show()

# "Maxpulse" on y and "Duration" on x axis. Bad corr.
df.plot(kind="scatter", x="Duration", y="Maxpulse")
plt.show()

print("\nHISTOGRAM -------------------------------------------------------------------------------------\n")

# needs only one column.
# shows us the frequency of each interval, e.g. how many workouts lasted between 50 and 60 minutes?
# From this we can understand that people prefer ~ 60 min workout sessions more than other durations
# The histogram tells us that there were over 100 workouts that lasted between 50 and 60 minutes.
df["Duration"].plot(kind="hist")
plt.show()
