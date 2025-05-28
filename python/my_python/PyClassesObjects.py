import datetime

# OOPs
# Almost everything is an object
# Class is like an obj constructor or a blueprint for creating obj

print("\nCREATE -------------------------------------------------------------------------------------\n")
class MyClass:
    name = "Hithesh"

obj1 = MyClass()
print(obj1.name)

print("\n__init__() -------------------------------------------------------------------------------------\n")

# __init__() function is always exec when class is created. It is present in every class
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

personObj1 = Person("Hithesh", 300)
print(personObj1.name)
print(personObj1.age)

print("\n__str__() -------------------------------------------------------------------------------------\n")

# __str__() func controls what should be returned when the obj is represented as a string. if not delcared it will return string rep of obj
print(personObj1) # <__main__.Person object at 0x104239130>

class Person2:
    name = "Hittu"
    age = 40

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"Person2 logged at {datetime.datetime.now()}"

    # self is a reference to the current instance of the class. u can access this class stuff only through self
    # self can be any name. First param of func in the class is taken as self
    def summary(self):
        return f"{self.name} is of age {self.age}"


personObj2 = Person2("Hithesh", 39)
print(personObj2) # Person2
print(personObj2.summary())

print("\nEMPTY OBJ -------------------------------------------------------------------------------------\n")
# if u need a class with no content put pass statement
class Dummy:
    pass

print("\nMODIFY -------------------------------------------------------------------------------------\n")
personObj2.name = "Jajajaja"
print(personObj2.name)

print("\nDELETE -------------------------------------------------------------------------------------\n")
del personObj2.name
print(personObj2.name) # not working

del personObj2
print(personObj2) # NameError: name 'personObj2' is not defined. Did you mean: 'personObj1'?


