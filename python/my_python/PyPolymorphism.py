# methods, functions or operators with the same name that can be executed on many objects or classes
# polymorphism means many forms
# len() func can be used on string, list, tuple, set, dict, etc

my_list = [1, 2, 3]
my_tuple = (1, 2, 3)
my_set = {1, 2, 3}
my_dict = {"name": "Hit", "age": 39}
print(len(my_list))
print(len(my_tuple))
print(len(my_set))
print(len(my_dict))

print("\nCLASS POLYMORPHISM -------------------------------------------------------------------------------------\n")


# multiple classes with same method name

class Car:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def move(self):
        print("Car moves")


class Boat:

    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def move(self):
        print("Boat floats")


class Plane:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def move(self):
        print("Plane flies")


carObj = Car("Ford", "T")
boatObj = Boat("RandoBoat", "Shark")
planeObj = Plane("Boeing", "747")

for x in (carObj, boatObj, planeObj):
    x.move()

print("\nINHERITANCE CLASS POLYMORPHISM -------------------------------------------------------------------------------------\n")
# child classes inherit porps and methods of parent class
# beacuse of polymorphism we can excute the same methods for all classes

class Vehicle:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def move(self):
        print("I am moving")

class Ferrari(Vehicle):
    pass

class Titanic(Vehicle):
    def move(self):
        print("Titanic is floating")

class Bomber(Vehicle):
    def move(self):
        print("Bombing")

ferrariObj = Ferrari("Ferr", "f20")
titaniceObj = Titanic("Rand", "0")
bomberObj = Bomber("Northrop", "B2")

for x in (ferrariObj, titaniceObj, bomberObj):
    print(x.brand)
    print(x.model)
    x.move()

