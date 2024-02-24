import os

"""
There are 4 diff methods or modes of opening a file in py

r --- read - Default value. Read file content. Throws error if file not exist.
a --- append - adding new content to existing file content. Creates new file if not exist.
w --- write - write or override file content. Creates new file if not exist.
x --- create - create new file. Throws error if file already exists.

t --- text mode or format - Default value.
b --- binary mode or format - for images etc
"""

"""
dummydir.txt file content:
Data Structures and Algorithms (DSA) is a fundamental part of Computer Science that teaches you how to think and solve complex problems systematically.
Using the right data structure and algorithm makes your program run faster, especially when working with lots of data.
Knowing DSA can help you perform better in job interviews and land great jobs in tech companies.
"""

print("\nREAD FULL FILE THAT IS IN CURRENT DIRECTORY -------------------------------------------------------------------------------------\n")

file = open("dummy.txt", "rt")
print(file.read())
file.close()

print("\nREAD FIRST LINE OF FILE IN DIFF LOCATION -------------------------------------------------------------------------------------\n")

file = open("assets/dummy2.txt")
print(file.readline())
file.close()

print("\nREAD FIRST 5 CHARS -------------------------------------------------------------------------------------\n")

file = open("dummy.txt")
print(file.read(5))
file.close()

print("\nREAD FIRST LINE -------------------------------------------------------------------------------------\n")

file = open("dummy.txt")
print(file.readline())
file.close()

print("\nREAD FIRST 2 LINES -------------------------------------------------------------------------------------\n")

file = open("dummy.txt")
print(file.readline())
print(file.readline())
file.close()

print("\nREAD ALL LINES WITH LOOPS -------------------------------------------------------------------------------------\n")

file = open("dummy.txt")
for x in file:
    print(x.strip("\n"))
file.close()

# Always close file as sometimes due to buffering, changes made to file wont reflect until closed.

print("\nAPPEND TO END OF FILE CONTENT -------------------------------------------------------------------------------------\n")

file = open("dummy.txt", "at")
file.write("\nHello world. I am Metesh. Hithesh in meta world.")
file.close()

file = open("dummy.txt")
print(file.read())
file.close()

print("\nWRITE OR OVERWRITE FILE CONTENT -------------------------------------------------------------------------------------\n")

file = open("dummy.txt", "wt")
file.write("Hello World")
file.close()

file = open("dummy.txt")
print(file.read())
file.close()

print("\nCREATE NEW FILE IF NOT EXISTS -------------------------------------------------------------------------------------\n")

# import os
# without this check if you run it again it throws error else it creates
if not os.path.exists("assets/dummy3.txt"):
    file = open("assets/dummy3.txt", "xt")
    print("dummy3.txt created")
else:
    print("file already exists")

file = open("assets/write_file.txt", "wt")
file.write("Creating file in write mode. If exists then overwrite content.")
file.close()

file = open("assets/append_file.txt", "at")
file.write("Creating file in append mode. If exists then append to existing content.")
file.close()

print("\nDELETE FILE -------------------------------------------------------------------------------------\n")

# without check throws error
if os.path.exists("assets/dummy4.txt"):
    os.remove("assets/dummy4.txt")
else:
    print("file does not exist")

print("\nCREATE EMPTY FOLDER -------------------------------------------------------------------------------------\n")

if "jajaja" not in os.listdir("assets/"):
    os.mkdir("assets/jajaja")
else:
    print("file already exists")

print("\nDELETE EMPTY FOLDER -------------------------------------------------------------------------------------\n")

# u can only delete empty folders
if os.path.isdir("assets/dummydir"):
    os.rmdir("assets/dummydir")
else:
    print("File not found")

if "dummydir2" in os.listdir("assets/"):
    os.rmdir("assets/dummydir2")
else:
    print("file not found")