
# local scope - var inside func
# global scope - var outside func, outside class or inside class - available everywhere

print("\nLOCAL SCOPE -------------------------------------------------------------------------------------\n")

def myFunc():
    x = 45
    print(x)
    def innerFunc():
        print(x * 2)
    innerFunc()

myFunc()

try:
    print(x)
except NameError:
    print("Undefined x")


print("\nGLOBAL SCOPE -------------------------------------------------------------------------------------\n")

y = 108

print(y)

def myFunc2():
    # y = 109
    # print(y) # this will throw error
    global y
    y = 110
    print(y)

def myFunc3():
    y = 111
    print(y)

myFunc2()
myFunc3()

print(y)

y = 112

print(y)