import random

print("\nFOR EACH LOOP -------------------------------------------------------------------------------------\n")
my_list = [1, 2, 3]

for x in my_list:
    print(x)

print("\nLOOP STRINGS -------------------------------------------------------------------------------------\n")

for x in "Hello":
    print(x)

print("\nLOOP INDEXED -------------------------------------------------------------------------------------\n")

# Note that range(6) is not the values of 0 to 6, but the values 0 to 5.
str = "Hello"
for i in range(len(str)):
    print(str[i] + f" at index {i}/{len(str)}")

print("\nBREAK -------------------------------------------------------------------------------------\n")

for x in range(10):
    if x == 7: break
    print(x)

print("\nCONTINUE -------------------------------------------------------------------------------------\n")

for x in range(10):
    if x == 7: continue
    print(x)

print("\nRANGE -------------------------------------------------------------------------------------\n")

# The range() function returns a sequence of numbers, starting from 0 by default, and increments by 1 (by default)

start = 3
end = 9
for x in range(start, end):
    print(x)

print()

step_size = 3
for x in range(start, end, step_size):
    print(x)

print("\nFOR LOOP ELSE -------------------------------------------------------------------------------------\n")

# The else block will NOT be executed if the loop is stopped by a break statement.
for x in (1, 2, 3):
    print(x)
else:
    print("Nothing")

print("\nNESTED LOOPS -------------------------------------------------------------------------------------\n")
for x in (1, 2, 3):
    for y in (5, 6, 7):
        print(y)
    print(x)

print("\nPRINT N TO 1 -------------------------------------------------------------------------------------\n")

n = int(input())
for i in range(n, 0, -1):
    print(i)