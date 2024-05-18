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
