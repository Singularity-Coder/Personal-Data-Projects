import matplotlib.pyplot as plt
import numpy as np

print("\nSHOW MULTIPLE HORIZ PLOTS -------------------------------------------------------------------------------------\n")

x = np.array([3, 5, 2, 9])
y = np.array([1, 2, 3, 4])

plt.subplot(
    1,  # 1 row
    2,  # 2 columns
    1  # 1st position: pos depends on cols n rows
)
plt.plot(x, y)
plt.title("Graph 1")

# ----------------------------------------------

x1 = np.array([4, 2, 22, 9])
y1 = np.array([41, 2, 2, 9])

plt.subplot(
    1,  # 1 row
    2,  # 2 cols
    2  # 2nd position
)
plt.plot(x1, y1)
plt.title("Graph 2")

plt.suptitle("My Graphs")
plt.show()

print("\nSHOW MULTIPLE VERTIC PLOTS -------------------------------------------------------------------------------------\n")

x2 = np.array([3, 5, 2, 9])
y2 = np.array([1, 2, 3, 4])

plt.subplot(
    2,  # 2 row
    1,  # 1 columns
    1  # 1st position
)
plt.plot(x2, y2)

# ----------------------------------------------

x3 = np.array([4, 2, 22, 9])
y3 = np.array([41, 2, 2, 9])

plt.subplot(
    2,  # 2 row
    1,  # 1 columns
    2  # 1st position
)
plt.plot(x3, y3)

plt.show()

print("\nSHOW MULTIPLE PLOTS > 2 -------------------------------------------------------------------------------------\n")
