import matplotlib.pyplot as plt
import numpy as np

# plot func draws points (markers) in a diagram
# By default, the plot() function draws a line from point to point.

print("\nPLOTTING WITHOUT LINE -------------------------------------------------------------------------------------\n")

# means set only markers
xpoints = np.array([1, 8])
ypoints = np.array([8, 10])
plt.plot(xpoints, ypoints, 'o')
plt.show()

print("\nMULTIPLE POINTS -------------------------------------------------------------------------------------\n")

# can have infin markers but must have same on both x and y axis

xpoints = np.array([1, 2, 6, 8])
ypoints = np.array([3, 8, 1, 10])
plt.plot(xpoints, ypoints)
plt.show()

print("\nDEFAULT X POINTS -------------------------------------------------------------------------------------\n")

# if x points not given then default 0,1,2,.. will be given based on y length
ypoints = np.array([2, 42, 4, 4, 2, 5])
plt.plot(ypoints)
plt.show()
