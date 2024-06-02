# Printing
print("Hello World")

print("    /|")
print("   / |")
print("  /  |")
print(" /   |")
print("/____|")

# Variables
person_name = "Hithesh"
person_age = 77
你好 = "Ni Hao"
print(你好)
print("Hi. I am " + person_name + ". I will be " + person_age.__str__() + " next year!")

# Find Type
print(type(person_name))

# Data Types -------------------------------------------------------------------
# Text Type
my_string = "Hello World"

# Numeric Types
my_int = 20
my_float = 20.5
my_complex = 1j

# Sequence Types
my_list = ["apple", "banana", "cherry"]
my_tuple = ("apple", "banana", "cherry")
my_range = range(6)

# Mapping Type
my_dict = {"name": "John", "age": 36}

# Set Types
my_set = {"apple", "banana", "cherry"}
my_frozenset = frozenset({"apple", "banana", "cherry"})

# Boolean Type
my_bool = True

# Binary Types
my_bytes = b"Hello"
my_bytearray = bytearray(5)
my_memoryview = memoryview(bytes(5))
# ------------------------------------------------------------------------------

# u can only multiply a string by int. If u do with float its error
# Output of division is always float. But floor div is an int. 10//3 is 3 and not 3.33 - it divides n does a floor
# But output of floor division of floats is still float
# addition or multi or sub with float is always float
# -10//3 is -4. Since -3.33 floor is -4
# 10 ** 2.5
# 2.5 ** 3
# floor is the left value in number line, ceil is the right value in number line. So floor of -2.2 is -3
# floor of 2.0 is 2

# 10 % 4 = 2
# -10 % 3 = 2      :::: this is because division takes the least value until -10. Since -9 is > -10, the operation goes till -12 and then subs it.
# 10 % -3 = -2
# -10 % -3 = -(10 % 3) = -1
# 10 ** -1 = 1/10 = 0.1
# x % y --> remainder of x/y
# if x is +ve --> remainder of x/y
# if x is -ve --> y - (x % y)
# in mod div the result always has the sign of divisor

# "Ra" == "ra"    ::: False
# 3 > 3    ::: False
# 3 >= 3    ::: True
# Jupyter notebooks auto prints a variable value wihtout print statement
# bool(0) or bool(0.0) or bool("") is false
# bool(32.42) or bool(-22) or bool("hello") or bool(" ") is true

# Order of ops for operator eval - BODMAS - brackets, exponent, div, multi, add, sub
# True == 1 is True
# False == 0 is True

# 400 % 500 = 400
# 3 % 4 = 3
# 1 % 5 = 1
# 5 % 5 = 0
# 4 % 2 = 0
# 7 % 5 = 2
# 0 % 200 = 0
# 0/200 = 0.0
# 1/0 = ZeroDivisionError

# print?   ----works in Jupyter notebook
# print("hello", "world", sep= ' ', end= '\n')

# for iterator in iterable: -> doctor is iterator and patients are iterable

# range (start, end, jump) -> start is inclusive, end is exclusive
# range(10)  -> here 10 is end so its exclusive. Iterates only till 9. start is 0 and jump is 1. start + jump
# So range(10) is same as range(0, 10, 1)
# range(10, 2, -1)  10,9,8,7,6,5,4,3,2
# range takes only int
# in case of contradiction u get empty list:
# range(2, 10, -1)  since start is 2 and jump is -1: 2 - 1 = 1 but 1 is not in range 2 to 10
# range(5, 5) start is inclusive n end is exclusive
# len(range(10)) 11 items
# list(range(10))

# n * (n + 1)/2   sum of n numbers

# length of an array vs len of the count of the len of array: len(str(len(range(4321432))))

"""
Jump Statements:
pass
continue
break
"""

"""
GCD/HCF of 2 nums - greatest common divisor or Highest common factor
ex: 3 and 5 has value 1 that divides both clean. So they r co-primes. 1 is common divisor for 3 n 5.
Primes have 1 n itself as divisors. 
For co-primes GCD is always 1.
ex: 6, 8 -> 1, 2 are common factors. Highest is 2
ex: 5, 10 -> 1, 5 are common factors. Highest is 5

Range of GCD btw 5 n 10 would be [1, 5] or 1 to min factor of the higest value here 10 - min(5, 10)
"""

"""
LCM - Lowest common multiple
multiples of 2 - 2,4,6,8
multiples of 3 - 3,6,9,12
LCM(2,3) = 6 since 6 is min num that is multiple of both
LCM range starts with max num. [max(a,b), a*b]

LCM(a,b) = a * b / HCF(a,b)
"""

"""
list indexing for a list of size 5
forward or positive indexing: 0 to 4   so last inedex is (n-1)
backward or negative indexing: -5 to -1 so last inedex is (-n)
"""

# In Jupyter notebook press list. + tab to see autocomplete methods
# Use method? to see doc string. Ex: list.append?

"""
list1 + list2
list.append(elem or new_list)
list.insert(pos, elem or new_list)
list.extend(new_list)

x = list.pop(optional index: defaults to last index -1)
list.remove(elem) # removes first occurrance if dups exist

list.count(elem) # num of occurrances of elem

print(99 in list) # membership operator - checks if elem present in list

for iterator in iterable:
    do_something
    
dir(range(5)) # if u find __iter__ method then it is an iterable. dir method lists all methods of an object

sum(list) # adds all elems in list
min(list)
max(list)

avg = sum(list) / len(list)

value = int(input("Enter value: "))
"""

"""
Slicing
start index : end index : step size
list(0 index : length of list : step size 1) 
list(::) 0, len, 1
list(::-1) -1,-(len+1),-1 

l = [0,9,1]
print(l[:100]) # does not crash

l = [0,9,1,44,2,2,3,93,2,4,5,5]
l[-1:-4:-1] # [5, 5, 4]
l[2:-1] # [1, 44, 2, 2, 3, 93, 2, 4, 5] last index is -1 in negative indexing. So this is not contradiction
l[2:0] # contradiction
l[3::-1] # [44, 1, 9, 0]
l[2:8:3] # [1, 2]
Get reversed list - l[::-1]
Get even indexed elements
Get odd indexed elements
Sum of odd indexed elemnts - sum(l[1::2])
Sum of even indexed elemnts - sum(l[::2])
Sum of first 3 elems and last 3 elems - sum(l[0:3]) + sum(l[-3:])


-ve indexing gives reverse list

if step/jump is +1 then start index = 0, end index = len of list
if step/jump is -1 then start index = -1, end index = -len of list - 1

if contradiction result is empty
"""

"""
import copy
def transpose(A):
    # [1, 2, 3] [1, 4, 7]
    # [4, 5, 6] [2, 5, 8]
    # [7, 8, 9] [3, 6, 9]

    C = copy.deepcopy(A)
    for i in range(len(A)):
        for j in range(len(A[i])):
            C[j][i] = A[i][j]
    return C
    
transpose([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
"""