import math

# https://www.w3schools.com/python/module_math.asp

print("\nBASIC MATH -------------------------------------------------------------------------------------\n")

# these take an iterable
print(min((3, 45, 2)))
print(min({3, 45, 0.5}))
print(min([3, 45, 1]))
print()
# these take an iterable
print(max((3, 45, 2)))
print(max({3, 45, 0.5}))
print(max([3, 45, 1]))
print()
print(abs(-63.7))
print(pow(4, 3)) # 4 * 4 * 4 = 4^3
print(math.sqrt(64))
print(math.ceil(1.2))
print(math.floor(1.6))

print("\nMATH CONSTANTS -------------------------------------------------------------------------------------\n")

print(math.e) # Euler's number
print(math.inf) # floating-point positive infinity
print(math.nan) # floating-point NaN (Not a Number) value
print(math.pi)
print(math.tau)