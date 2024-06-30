# From a function's perspective:
# That which is defined in method signature. A parameter is the variable listed inside the parentheses in the function definition.
# An argument is the value that is sent to the function when it is called.

def my_dummy_func(name, age):
    return f"My name is {name} and I am {age} years old."


print(my_dummy_func("Hithesh", 100))


# You can send any data types of argument to a function (string, number, list, dictionary etc.)
def myList(list):
    for x in list: print(x)


myList([1, 2, 3])


# function definitions cannot be empty
def my_empty_func():
    pass


print("\nARBITRARY ARGUMENTS, *args -------------------------------------------------------------------------------------\n")


# this is java varars - when u dont know amt of args being sent to a func
# add a * before param name - this way func receives tuple of args

def arbArgs(*params):
    todos = "My to dos: "
    for x in params:
        todos += f"{x}, "
    return todos


print(arbArgs("Buy meds", "Workout", "Clean", "Brush Teeth"))

print("\nKEYWORD ARGUMENTS, kwargs -------------------------------------------------------------------------------------\n")


# order of args is irrelevant

def top_3_anime(anime1, anime2, anime3):
    return f"top 3 anime are {anime1}, {anime2}, {anime3}"


print(top_3_anime(anime2="Death Note", anime1="Code Geass", anime3="Attack On Titan"))

print("\nARBITRARY KEYWORD ARGUMENTS, **kwargs -------------------------------------------------------------------------------------\n")


# dont know how many keyword arguments that will be passed into your function, add two asterisk: ** before the parameter
# function will receive a dictionary of arguments

def arbKwargs(**params):
    return f"My cars: {params["Ferrari"]}, {params["Lambo"]}, {params["Tesla"]}"


print(arbKwargs(Ferrari="Enzo", Lambo="Aventador", Tesla="Model 3"))

print("\nDEFAULT PARAMS -------------------------------------------------------------------------------------\n")


def default_params(country="India"):
    return f"I am from {country}"


print(default_params("Paris"))
print(default_params())

print("\nPOSITIONAL-ONLY ARGUMENTS -------------------------------------------------------------------------------------\n")


# force to pass position based args in a func with , / at end rather than keyword based

def pos_only_func(a, b, c, /):
    print(a, b, c)


pos_only_func(3, 4, 5)

try:
    pos_only_func(a=3, b=4, c=5)
except Exception:
    print("cant use kwargs in position only arg func")

print("\nKEYWORD-ONLY ARGUMENTS -------------------------------------------------------------------------------------\n")


# force to pass keyword only args in a func with *, at the start

def kwarg_only_func(*, a, b, c):
    print(a, b, c)


kwarg_only_func(a=3, b=4, c=5)

try:
    kwarg_only_func(3, 4, 5)
except Exception:
    print("cant use position args in kwargs only func")

print("\nPOSITIONAL-ONLY + KEYWORD-ONLY ARGUMENTS -------------------------------------------------------------------------------------\n")


# Any argument before the / , are positional-only, and any argument after the *, are keyword-only.

def kwargs_plus_positional(a, b, /, *, c, d):
    print(a, b, c, d)


kwargs_plus_positional(3, 4, c=5, d=6)

try:
    kwargs_plus_positional(3, 4, 5, 6)
except Exception:
    print("kwargs missing")

try:
    kwargs_plus_positional(a=3, b=4, c=5, d=6)
except Exception:
    print("positional-only args allowed for a and b params")

print("\nRECURSION -------------------------------------------------------------------------------------\n")


# sum the prev 2 nums to get 3rd. 0 & 1 r default
# 0 1 1 2 3 5 8 13 21...n + (n - 1)

# def find_fib(n):
#     if n <= 1: return 1
#     return find_fib(n - 1) + find_fib(n - 2)

# def find_fib_iter(n):
