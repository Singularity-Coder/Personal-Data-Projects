import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# https://www.w3schools.com/python/matplotlib_markers.asp
print("\nFORMAT STRINGS -------------------------------------------------------------------------------------\n")

# fmt - marker|line|color
# If you leave out the line value in the fmt parameter, no line will be plotted.
# more colors - rgbcmykw
ypoints = pd.array([3, 5, 2, 8])
plt.plot(ypoints, 'o:r', ms=20)
plt.show()

# plt.plot(ypoints, 'o-r')
# plt.show()
#
# plt.plot(ypoints, 'o--r')
# plt.show()
#
# plt.plot(ypoints, 'o-.r')
# plt.show()

# mfc = markerfacecolor
# ms is marker size
plt.plot(ypoints, marker='o', ms=20, mec='b', mfc='#4CAF50')
plt.show()
