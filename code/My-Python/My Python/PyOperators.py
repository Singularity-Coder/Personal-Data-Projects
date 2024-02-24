"""
7 types of operators

1. Arithmetic: + - * / % // **
2. Assignment: = += -= *= /= %= //= **= &= |= ^= <<= >>=
3. Comparison: == != < > <= >=
4. Logical: and, or, not
5. Identity: is, is not
6. Membership: in, not in
7. Bitwise: & | ^ ~ << >>
"""

"""
Operator precedence / Order of operations / Operations by Priority

1. ()
2. **
3. +4, -4, ~4
4. * / // %
5. + -
6. << >>
7. &
8. ^
9. |
10. Comparison, Identity, Membership
11. Logical not
12. Logical and
13. Logical or

If 2 operators have the same precedence then the expression is evaluated from left to right
"""

a, b = 4, 3

print("\nARITHMETIC -------------------------------------------------------------------------------------\n")

print(a + b)
print(a - b)
print(a / b)
print(a * b)
print(a // b)  # floor division - takes the lesser int value
print(a ** b)  # exponentation
print(a % b)

print("\nASSIGNMENT -------------------------------------------------------------------------------------\n")

a = 9
print(a)

# Arithmetic assignments
a += 8
print(a)
a -= 3
print(a)
a *= 2
print(a)
a /= 2
print(a)
a //= 2
print(a)
a **= 3
print(a)
a %= 5
print(a)

# Bitwise assignments - works only on int
a, b = 4, 2
print(a & b)
print(a | b)
print(a ^ b)
print(a << 1)
print(a >> 1)

print("\nCOMPARISON -------------------------------------------------------------------------------------\n")

a, b = 9, 12
print(a == b)
print(a != b)
print(a > b)
print(a < b)
print(a >= b)
print(a <= b)

print("\nLOGICAL -------------------------------------------------------------------------------------\n")

a, b = 3, 4
print(a > b and a == 3)
print(a > b or a == 3)
print(not (a > b and a == 3))
print(not a > b)

print("\nIDENTITY -------------------------------------------------------------------------------------\n")
# Used for comparing if objects at memory locations are equal and not values. Check if obj are same with same memory location.

a, b, c = 4, "Hello", 39
print(a is int)
print(a is not str)
print(b is int)
print(b is str)
print(a is b)
print(a is c)
print(a is not c)
print(a is a)

print("\nIDENTITY -------------------------------------------------------------------------------------\n")

# Search in sequence types like string, list, etc.
print("x" in "max")
print("x" not in "max")
print(2 in (1, 2, 3))

print("\nBITWISE -------------------------------------------------------------------------------------\n")

a, b, bits = 5, 6, 2
print(f"AND: {a & b}")
print(f"OR: {a | b}")
print(f"XOR: {a ^ b}")
print(f"NOT or complement: {~a}")
print(f"0 fill left shift: {a << bits}") # left most bits are discarded
print(f"Signed right shift: {b >> bits}") # right most bits are discarded
