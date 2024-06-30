# Javascript obj notation used for storing n exchanging data

import json

file = open("assets/random.json", "rt")
my_json = file.read()
file.close()

print("\nJSON TO PYTHON -------------------------------------------------------------------------------------\n")

my_dict = json.loads(my_json)
print(my_dict["random float"])

print("\nPYTHON OBJ TO JSON STRING -------------------------------------------------------------------------------------\n")

new_json = json.dumps(my_dict)
print(new_json)

print("\nVALID PYTHON TO JSON CONV DATA TYPES -------------------------------------------------------------------------------------\n")

"""
dict - Object
list - Array
tuple - Array

str - String

int - Number
float - Number

True - true
False - false

None - null
"""

my_new_dict = {
  "name": "John",
  "age": 30,
  "married": True,
  "divorced": False,
  "children": ("Ann","Billy"),
  "pets": None,
  "cars": [
    {"model": "BMW 230", "mpg": 27.5},
    {"model": "Ford Edge", "mpg": 24.1}
  ]
}

print(json.dumps(my_new_dict))

print("\nFORMAT PYTHON TO JSON RESULT -------------------------------------------------------------------------------------\n")

print(json.dumps(my_new_dict, indent=4))
print(json.dumps(my_new_dict, indent=4, sort_keys=True))
print(json.dumps(my_new_dict, indent=4, separators=("..... ", "     =     ")))

