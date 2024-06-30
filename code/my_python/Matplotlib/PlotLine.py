import matplotlib.pyplot as plt
import numpy as np

print("\nCUSTOMISE LINE -------------------------------------------------------------------------------------\n")

# Change style of plotted line
y1points = np.array([3, 8, 10, 1])
y2points = np.array([32, 2, 1, 19])

plt.plot(
    y1points,
    linestyle="solid",
    color="#4CAF50",
    linewidth="5.5"
)
plt.plot(y2points)
plt.show()

print("\nMULTI LINE -------------------------------------------------------------------------------------\n")

x1 = np.array([3, 33, 11, 55])
x2 = np.array([3, 55, 1, 5])
plt.plot(x1, x2)
plt.show()
