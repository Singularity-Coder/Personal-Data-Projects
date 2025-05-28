import random
# There are 8 types of data in python

"""
1. Text - str
2. Numeric - int, float, complex
3. Boolean - bool
4. Binary - bytes, bytearray, memoryview
5. Sequence - list, tuple, range
6. Mapping - dict
7. Set - set, frozenset
8. NoneType - NoneType
"""

# str
my_name = "Hithesh"
my_name2 = str("Hittu")

# int
my_int = 9
my_int2 = int(10)
# float
my_float = 9.5
my_float2 = float(10.5)
my_float3 = 20.
my_float4 = .3
# complex
my_complex = 8j
my_complex2 = complex(9j)

# bool
is_greater = 9 > 3
is_greater2 = bool(10)

# bytes
my_bytes = b"Hithesh"
my_bytes2 = bytes(len(my_bytes))
# bytearray
my_bytearray = bytearray(len(my_bytes))
# memoryview
my_memory_view = memoryview(bytes(len(my_bytes)))

# list
my_list = [1, "Hello", 9.3, True]
my_list2 = list((1, "Hello", 9.3, True))
# tuple
my_tuple = (1, "Hello", 9.3, True)
my_tuple2 = tuple((1, "Hello", 9.3, True))
# range
my_range = range(len(my_list))

# dict
my_dict = {"name": "Hithesh", "age": 300}
my_dict2 = dict({"name": "Hithesh", "age": 300})

# set
my_set = {1, "Hello", 9.3, True}
my_set2 = set((1, "Hello", 9.3, True))
# frozenset
my_frozenset = frozenset(my_set)

# NoneType
my_bank_balance = None

# In python data type is set when you assign a value to the var

# Edge cases
# int can be +ve or -ve. unlimited length. No need of BigInt like java.
my_int3 = 53462362562625626263563

# float can be +ve or -ve. unlimited length.
my_float3 = 2323.343251454325432532452342352432523423

# float scientific notation - e is simply x * 10^whatever. 34e3 = 34 * 10^3
my_float4 = 34e306 # the limit of my computer beyond which this returns inf
my_float5 = 12E4
my_float6 = -324.66e100

# complex numbers are written with j which is imaginary part

# you can convert int and flaot to all other types but not compelx type

# to generate random numbers import random
my_random = random.randrange(1, 10) # returns a value btw 1 until 9
print(my_random)

















