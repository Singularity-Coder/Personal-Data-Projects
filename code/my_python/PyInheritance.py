
# define a class that inherits all methods n props of another class
# Parent or Base class - that which gives
# Child or derived class - that which inherits

class Person:

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def summary(self):
        return f"My name is {self.name} and age is {self.age}"


# To inherit from another class pass the parent as an argument to the class constructor
class Hithesh(Person):
    pass


personObj = Hithesh("Hithesh", 39)
print(personObj.name)
print(personObj.age)

class James(Person):
    # By adding init func in child class u override the parent class init func
    def __init__(self, name, age):
        pass
        # To retain parent class functionality call parent class init func inside the child class init func
        Person.__init__(self, name, age)
        # OR
        super().__init__(name, age) # this func will make the child classs inherit all the mthods and vars of parent

personObj = James("James", 30)
print(personObj.name)
print(personObj.age)

# if a new method is added to child class which matches a method name in the parent class the child method overrides the parent

