"""
try - test for error
except - catch error
else - do if no errors
finally - do this anyway
"""

"""
You will have these combos: 

try except
or 
try else
or
try except finally
or 
try else finally
"""

print("\nMULTIPLE EXCEPT BLOCKS -------------------------------------------------------------------------------------\n")

try:
    print(x)
except NameError:
    print("x is undefined")
except:
    print("something else went wrong")

print("\nELSE BLOCK -------------------------------------------------------------------------------------\n")

try:
    print("hello")
except:
    print("something went wrong")
else:
    print("All good")

print("\nFINALLY BLOCK -------------------------------------------------------------------------------------\n")

try:
    print("hello")
except:
    print("something went wrong")
finally:
    print("All completed. Close objs and clean up resources.")

print("\nRAISE AN EXCEPTION -------------------------------------------------------------------------------------\n")

x = -1
if x < 0:
    raise Exception("u r negligible")

# Custom error
x = "heello"
if not type(x) is int:
    raise TypeError("Not same")
