import re

# Regular expression is a sequence of chars that forms a search pattern.
# Used to check if a string contains that partic search pattern.

"""
RegEx funcs

1. findall - returns a list containing all matches else empty list
2. search - returns a match obj if there is a match anywhere in the str
3. split - returns a list where the str has been split at each match
4. sub - replaces 1 or many matches with a str
"""

text = "The universe is ~ 13.7 billion years old."

print(re.search("rse is", text)) # returns Match obj
print(re.search("rse is", text).span()) # tuple of start n end pos
print(re.search("rse is", text).string)
print(re.search("rse is", text).group()) # pos of match start
print(re.search("rse is", text).start()) # gets start position of the search str
print(re.search("kakarot", text)) # if no match found gives None
print()
print(re.split(r"\s", text))
print(re.split(r"\s", text, 1))
print(re.split(r"\s", text, 3)) # splits into 3 parts
print()
print(re.sub(r"\s", "   ", text))
print(re.sub(r"\s", "   ", text, 4)) # set max replacements


print("\nMETA CHARACTERS -------------------------------------------------------------------------------------\n")
# chars with special meaning

print(re.findall("[a-m]", text))
print(re.findall(r"\d", text))
print()
print(re.findall("^The", text)[0] == "The")
print(re.findall("old.$", text)[0] == "old.")
print(re.findall("old.$", text)[0] == "old.")
print()
print(re.findall("un.....e", text))
print()
# followed by 0 or more chars, and a char
print(re.findall("un.*se", text))
print(re.findall("un.*e", text))
print(re.findall("old.*", text))
print(re.findall("dance.*", text))
print()
# followed by 1 or more chars, and a char
print(re.findall("un.+se", text))
print(re.findall("un.+e", text))
print(re.findall("d.+", text)) # how to include period? escape not working
print(re.findall("dance.+", text))
print()
# followed by 0 or 1 (any) character, and a char
print(re.findall("ol.?d", text))
print(re.findall("old.?", text))
print(re.findall("o.?d", text))
print(re.findall("uni.?e", text))
print()
# followed exactly 2 (any) chars, and a char
print(re.findall("ye.{2}s", text))
print(re.findall(" .{2}d", text))
print(re.findall("T.{2} ", text))
print(re.findall("bi.{4}n", text))
print()
# check if string has any of these words
print(re.findall("The|Then", text))
print(re.findall("The|old|universe", text))
# capture a group
print(re.findall("(d.+)(The|old)", text)) # not correct

print("\nSPECIAL SEQUENCES -------------------------------------------------------------------------------------\n")
# A special seq is a \ followed by a char. In pycharm you must escape that \ with a \ or use a raw string r""

# check if string starts with "The"
print(re.findall(r"\AThe", text))
print(re.findall(r"\Ais", text))
print()
# check if "uni" is present at the beginning of a WORD:
print(re.findall(r"\buni", text)) # r"" at the start is to enforce raw string
print(re.findall(r"\bkas", text))
# check if "uni" is present at the end of a WORD:
print(re.findall(r"se\b", text))
print(re.findall(r"ol\b", text))
# check if "niv" is present, but NOT at the beginning of a word. In middle.
print(re.findall(r"\Bniv", text))
print(re.findall(r"\Ber", text))
print(re.findall(r"\Bks", text))
# check if "niv" is present, but NOT at the end of a word. Anything in between start n end chars
print(re.findall(r"rs\B", text))
print(re.findall(r"rse\B", text))
print()
print(re.findall(r"\d", text)) # check if the string contains any digits (numbers from 0-9):
print(re.findall(r"\D", text)) # no-digit char
print()
print(re.findall(r"\s", text)) # white-space char
print(re.findall(r"\S", text)) # NON white-space char
print()
print(re.findall(r"\w", text)) # chars from a to Z, digits from 0-9, and the underscore _ char
print(re.findall(r"\W", text)) # chars NOT between a and Z. Like "!", "?" white-space etc.
print()
print(re.findall(r"old\.\Z", text)) # has "old." at the end of str

print("\nSETS -------------------------------------------------------------------------------------\n")

# set of chars in []
print(re.findall("[aei]", text)) # has any of a e i chars
print(re.findall("[a-f]", text))
print(re.findall("[^efghijklmnopqrstuv]", text))
print(re.findall("[0123]", text))
print(re.findall("[0-9]", text))
print(re.findall("[0-5][0-9]", text)) # two-digit numbers, from 00 to 59
print(re.findall("[a-mN-T]", text))
print(re.findall("[~]", text)) # In sets, +, *, ., |, (), $,{} has no special meaning















