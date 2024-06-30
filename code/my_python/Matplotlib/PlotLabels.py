import matplotlib.pyplot as plt
import numpy as np

print("\nCREATE LABELS FOR PLOT -------------------------------------------------------------------------------------\n")

font1 = {"family": "sans-serif", "color": "blue", "size": "20"}
font2 = {"family": "sans-serif", "color": "darkred", "size": "10"}

x = np.array([1, 3, 5, 6])
y = np.array([5, 3, 5, 0])

plt.plot(x, y) # plot func draws points (markers) in a diagram

# title positions: 'left', 'right', and 'center'
plt.title("Title", fontdict=font1, loc="left")
plt.xlabel("X Label", fontdict=font2)
plt.ylabel("Y Label", fontdict=font2)

# axis: 'x', 'y', and 'both'
plt.grid(axis="x", linestyle="dotted", linewidth=0.5)

plt.show()
