import re

# Regular expression is a sequence of chars that forms a search pattern.
# Used to check if a string contains that partic search pattern.

"""
RegEx funcs

1. findall - returns a list containing all matches
2. search - returns a match obj if there is a match anywhere in the str
3. split - returns a list where the str has been split at each match
4. sub - replaces 1 or many matches with a str
"""

print("\nMETA CHARACTERS -------------------------------------------------------------------------------------\n")
# chars with special meaning

text = "The universe is ~ 13.7 billion years old."

print(re.findall("[a-m]", text))
print(re.findall("\\d", text))
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
print(re.findall("d.+", text))
print(re.findall("d\..+", text))
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
# A special seq is a \ followed by a char. In pycharm you must escape that \ with a \

# check if string starts with "The"
print(re.findall("\\AThe", text))
print(re.findall("\\Ais", text))
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
# Check if "niv" is present, but NOT at the end of a word
print(re.findall(r"niv\B", text))














