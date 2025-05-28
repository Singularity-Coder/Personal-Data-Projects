import matplotlib.pyplot as plt
import numpy as np

# By default the plotting of the first wedge starts from the x-axis and moves counterclockwise:
# The size of each wedge is determined by comparing the value with all the other values, by using this formula:
# The value divided by the sum of all values: x/sum(x)
# default start angle is at the x-axis
# The startangle parameter is defined with an angle in degrees, default angle is 0

mylabels = ["Apples", "Bananas", "Cherries", "Dates", "Tomatoes"]

x = np.array([25, 45, 10, 5, 15])  # array total should be 100 ideally

plt.pie(x, labels=mylabels, startangle=0)
plt.show()

print("\nEXPLODE -------------------------------------------------------------------------------------\n")

myexplode = [0.2, 0, 0, 0]
mylabels = ["Apples", "Bananas", "Cherries", "Dates"]
mycolors = ["black", "hotpink", "b", "#4CAF50"]

y = np.array([35, 25, 25, 15])

plt.pie(y, labels=mylabels, explode=myexplode, shadow=True, colors=mycolors)
plt.legend(title="Four Fruits:")
plt.show()
