# Module is a python lib - has code u can use by importing it
# Any file with extension .py
# ex: myMod.py -> import myMod -> myMod.hello()
# When using a function from a module, use the syntax: module_name.function_name.
# code includes all code - vars, funcs, classes
# Re-naming module - import myMod as mm -> mm.hello()

import platform
import os
import math as m
from math import ceil

print("\nIMPORT ALIAS -------------------------------------------------------------------------------------\n")

print(m.floor(3.9))
print(platform.system()) # platform is built-in module

print("\nLIST ALL MODULE FUNCS -------------------------------------------------------------------------------------\n")

# list all the function names (or variable names) in a module
print(dir(platform))
print(dir(m))
print(dir(os))

print("\nIMPORT FUNCS THAN MODULES -------------------------------------------------------------------------------------\n")

print(ceil(3.1))

