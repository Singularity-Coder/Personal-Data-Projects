# no built-in support for Arrays - use lists
# to work with arrays in Python import NumPy lib

print("\nCREATE -------------------------------------------------------------------------------------\n")

nums = [1, 2, 3]
print(len(nums))  # length of an array is always one more than the highest array index.

print()
new_nums = nums.copy()  # allocate new memory. so new_nums is a proper dup of nums.
nums.append(4)
for x in new_nums: print(x)

print()
new_nums = nums  # this is only a ref to memory loc of nums. So any changes to nums will reflect in new_nums as well
nums.append(5)
for x in new_nums: print(x)

print("\nACCESS -------------------------------------------------------------------------------------\n")

print(nums[1])

print("\nLOOP -------------------------------------------------------------------------------------\n")

for x in nums: print(x)

print("\nADD / INSERT -------------------------------------------------------------------------------------\n")

nums.append(6)
print(nums[len(nums) - 1])

print()
newList = [32, 44, 20]
nums.extend(newList)
for x in nums: print(x)

print()
nums.insert(0, 10001) # when u add at partic index it moves all other elemens to right
for x in nums: print(x)

print("\nDELETE -------------------------------------------------------------------------------------\n")

print(nums.pop(0))
print(len(nums))
print()
for x in nums: print(x)

print()
nums.pop()  # if index not specified removed last item
for x in nums: print(x)

print()
nums.remove(2)  # The list's remove() method only removes the first occurrence of the specified value.
for x in nums: print(x)

print()
for x in range(5): nums.append(x)
print(len(nums))

nums.clear()
print(len(nums))

print("\nHELPER METHODS -------------------------------------------------------------------------------------\n")

rand_nums = [1, 3, 2, 3, 2, 5, 5, 3, 9]
rand_names = ["Iithesh", "Jithesh", "Kithesh", "Iithesh", "Iithesh", "Jithesh", "Kithesh"]
print(rand_nums.count(2)) # num of times 3 elem appears in rand_nums list
print(rand_nums.count(432)) # num of times 3 elem appears in rand_nums list
print(rand_names.count("Iithesh"))

print()
myNums = [1, 2, 3]
myNums.reverse()
for x in myNums: print(x)
print()
myNums.sort()
for x in myNums: print(x)
print()
myNums.sort(reverse=True)
for x in myNums: print(x)

print("\nFIND -------------------------------------------------------------------------------------\n")

print(rand_names.index("Kithesh")) # gives first occurrance of elem

