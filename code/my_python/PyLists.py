print("\nLIST -------------------------------------------------------------------------------------\n")
# can store any type in same list
# one of 4 built-in data types - list, tuple, set, dictionary

"""
List items are
1. ordered - means positions wont change unless specified. new items added to end of list
2. changeable - add, remove, modify with methods AFTER it has been created
3. allow duplicate values - since indexed 
4. indexed - starts with 0
"""

my_list = [1, "2", False, 1]
print(my_list)
print(f"length of list is {len(my_list)}")
print(type(my_list))

print("\nLIST CONSTRUCTOR-------------------------------------------------------------------------------------\n")

my_list = list((1, "2", False))
print(my_list)

print("\nACCESS ITEM-------------------------------------------------------------------------------------\n")

print(my_list[0])
print(my_list[1])
print(my_list[-1]) # negative indexing

print("\nRANGE OF INDEXES-------------------------------------------------------------------------------------\n")
# specify start n end index -> retruns list
thislist = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
print(thislist[2:5]) # last index excluded
print(thislist[:4]) # if first index not specidied then index 0
print(thislist[2:]) # if last index not specidied then last index
print(thislist[-4:-1]) # 4rth pos counting from end to 1st pos from end

print("\nCHECK IF ITEM EXISTS-------------------------------------------------------------------------------------\n")

if "apple" in thislist:
    print("yes apple exists")