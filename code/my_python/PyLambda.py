# lambda func is a small anonymous func
# can take any num of args but can have only one expression
# lambda args: expression
# use them as an anonymous function inside another function

x = lambda a, b, c: (a + b + c) ** 2
print(x(3, 4, 5))


def my_func(c: int):
    return lambda a, b: a + b > c


def my_func2(n: int):
    return lambda a: a * n


isTriangle = my_func(4)
myDoubler = my_func2(2)
myTripler = my_func2(3)

print(isTriangle(1, 2))
print(myDoubler(43))
print(myTripler(43))
