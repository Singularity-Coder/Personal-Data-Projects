import matplotlib.pyplot as plt
import numpy as np

# scatter() function plots one dot for each observation
# needs x, y axis of same len

x = np.array([3, 4, 5, 6])
y = np.array([1, 2, 3, 4])
plt.scatter(x, y, color="#000000")

x = np.array([1, 2, 3, 4])
y = np.array([3, 4, 5, 6])
colors = np.array(["#FA4433", "#4225FA", "#A9FA7D", "#FFE033"])
plt.scatter(x, y, color=colors)

plt.show()

print("\nCOLOR BAR -------------------------------------------------------------------------------------\n")

x = np.random.randint(100, size=(100))
y = np.random.randint(100, size=(100))
colors = np.random.randint(100, size=(100))  # should be same size as x, y
sizes = np.random.randint(600, size=(100))  # should be same size as x, y

plt.scatter(x, y, c=colors, cmap="Blues", s=sizes, alpha=0.5)  # Other cmap values: BuPu, Greens, Greys, OrRd, Oranges, PuBu, PuRd, Purples, Reds, Wistia, YlGn, YlOrBr, binary, bone, bwr, copper, gist_gray, gist_heat, gist_yarg, gray, magma, summer
plt.colorbar()
plt.show()
