# Further ref: https://docs.python.org/3/library/string.html#format-specification-mini-language

fruit, price = "Mango", 49
print("{} cost {:.2f} rupees".format(fruit, price))

print("\nINDEX NUMBERS -------------------------------------------------------------------------------------\n")

print("{0} cost {1} rupees".format(fruit, price))
print("{1} cost {0} rupees".format(price, fruit))
print("{1} is {1} and it costs {0} rupees".format(price, fruit))
print("{} cost {:.2f} rupees".format(fruit, price)) # :.2f formats num wih 2 decimal places

print("\nNAMED INDEXES -------------------------------------------------------------------------------------\n")

text = "{fruitName} cost {fruitPrice} rupees"
print(text.format(fruitName=fruit, fruitPrice=price))

print("\nUNPACKING ARG SEQUENCE -------------------------------------------------------------------------------------\n")

print('{2}, {1}, {0}'.format(*'abc'))
print('{2}, {1}, {0}'.format(*[1, 2, 3]))
print('{2}, {1}, {0}'.format(*(1, 2, 3)))

print("\nFORMATTING TYPES -------------------------------------------------------------------------------------\n")

# https://www.w3schools.com/python/ref_string_format.asp
print("{0} price was {1:<8} yesterday".format("Stock", 25))
print("{0} price was {1:>8} yesterday".format("Stock", 25))
print("{0} price was {1:^8} yesterday".format("Stock", 25))
print("{0} price was {1:=8} yesterday".format("Stock", -25))
print()
print("{0} price was {1:+} yesterday".format("Stock", 25))
print("{0} price was {1} yesterday".format("Stock", -25))
print("{0} price was {1:-} yesterday".format("Stock", -25))
print("{0} price was  {1} yesterday".format("Stock", 25))
print("{0} price was {1: } yesterday".format("Stock", 25))
print()
print("{0} price was {1:,} yesterday".format("Stock", 2500000000000))
print("{0} price was {1:_} yesterday".format("Stock", 2500000000000))
print()
print("{0} price was {1:b} yesterday".format("Stock", 25)) # get binary value of 25
print("{0} price was {1:c} yesterday".format("Stock", 25000)) # get 25000 unicode char
print("{0} price was {1:d} yesterday".format("Stock", 0b11001)) # binary to decimal conv
print()
print("{0} price was {1:e} yesterday".format("Stock", 25))
print("{0} price was {1:E} yesterday".format("Stock", 25))
print()
print("{0} price was {1:f} yesterday".format("Stock", 25))
print("{0} price was {1:.2f} yesterday".format("Stock", 25))
print("{0} price was {1:.3F} yesterday".format("Stock", 25))
print("{0} price was {1:F} yesterday".format("Stock", 25))
print("{0} price was {1:F} yesterday".format("Stock", float("nan"))) # NAN is not a number
print("{0} price was {1:F} yesterday".format("Stock", float("inf"))) # INF is infinity
print()
print("{0} price was {1:g} yesterday".format("Stock", 2500000000000000000000))
print("{0} price was {1:G} yesterday".format("Stock", 2500000000000000000000))
print()
print("{0} price was {1:o} yesterday".format("Stock", 25)) # get octal value of 25 - decimal to octal conv
print("{0} price was {1:x} yesterday".format("Stock", 255)) # num to hex lowcase
print("{0} price was {1:X} yesterday".format("Stock", 255)) # num to hex upcase
print()
print("{0} price was {1:n} yesterday".format("Stock", 25))
print("{0} price was {1:%} yesterday".format("Stock", 0.25))
print("{0} price was {1:.0%} yesterday".format("Stock", 0.25))





