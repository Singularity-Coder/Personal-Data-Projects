import matplotlib.pyplot as plt
import numpy as np

print("\nVERTIC BARS -------------------------------------------------------------------------------------\n")

x = np.array(["Apples", "Bananas", "Cucumbers", "Dragon Fruits"]) # categories
y = np.array([3, 2, 33, 1]) # values or qtys

plt.bar(x, y, color="#333333", width=0.2) # default width is 0.8
plt.show()

print("\nHORIZ BARS -------------------------------------------------------------------------------------\n")

x = np.array(["Apples", "Bananas", "Cucumbers", "Dragon Fruits"]) # categories
y = np.array([3, 2, 33, 1]) # values or qtys

plt.barh(x, y, height=0.2) # height instead of width for barh
plt.show()
