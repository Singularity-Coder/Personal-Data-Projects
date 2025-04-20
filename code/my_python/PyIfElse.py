a = 30
b = 5

if a > b and (type(a) is int):
    print("a is big")
elif b >= a:
    print("b is big")
elif a in [1, 2, 3]:
    print("a is in list")
elif (a << b) > 0:
    print("5 bits shifted")
elif not a == b or (type(b) is str):
    print("a and b are diff")
else:
    print("Dont know")

print("\nNESTED IF STATEMENTS-------------------------------------------------------------------------------------\n")

if a > b:
    if type(a) is int:
        print("I am truth")

print("\nSHORT HAND IF -------------------------------------------------------------------------------------\n")

if a > b: print("a is big")

print("\nSHORT HAND IF ELSE -------------------------------------------------------------------------------------\n")
# ternary operators or conditional expressions

print("B is small") if b < a else print("A is small")

b = 30
print("A") if a > b else print("=") if a == b else print("B")

print("\nPASS STATEMENT -------------------------------------------------------------------------------------\n")
# if u want empty
if a > b:
    pass
