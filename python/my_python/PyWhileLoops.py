i = 0
while i < 30:
    i += 1
    if i == 16: continue
    if i == 25: break
    print(i)

print("\nWHILE LOOP ELSE -------------------------------------------------------------------------------------\n")

# The else block will NOT be executed if the loop is stopped by a break statement.
j = 0
while j < 3:
    j += 1
    print(j)
else:
    print("loop complete")

print("\nWHILE LOOP REVERSE -------------------------------------------------------------------------------------\n")

k = 10
while k >= 0:
    print(k)
    k -= 1

print("\nPRINT ODD NUMS 1 to 10 -------------------------------------------------------------------------------------\n")

x = 1
while x <= 10:
    if x % 2 != 0:
        print(x)
    x += 1

print("\nPRINT EVEN NUMS 2 to 10 -------------------------------------------------------------------------------------\n")

x = 2
while x <= 10:
    print(x)
    x += 2

print("\nPRINT NUMS 1 to 10 ONE LINE -------------------------------------------------------------------------------------\n")

x = 1
while x <= 10:
    print(x, end=" ")
    x += 1

print("\nPRINT TABLE OF N -------------------------------------------------------------------------------------\n")

n = int(input())
x = 1
while x <= 10:
    print(n * x)
    x += 1

print("\nTAKE T NUMBER OF INPUTS -------------------------------------------------------------------------------------\n")

T = int(input())
print(f"Num of inputs: {T}")
x = 1
while x <= T:
    input()
    x += 1

print("\nPRINT N * 10 TABLES FOR INPUT N -------------------------------------------------------------------------------------\n")

print(f"Enter input: ")
t = int(input())
print(f"Num of inputs: {t}")
start = 0

while start < t:
    n = input()
    start += 1

    # print table on n
    st = n
    while st <= n * 10:
        print(st)
        st += n


print("\nPRINT N * 10 TABLES FOR INPUT N -------------------------------------------------------------------------------------\n")

print("Enter num of chances: ")
t = int(input())
start = 0
while start < t:
    print(f"Enter chance {start}: ")
    n = int(input())
    start += 1

    # print table on n
    st = n
    while st <= n * 10:
        print(st)
        st += n

print("\nfind the first n natural even numbers -------------------------------------------------------------------------------------\n")

print("Enter input: ")
N = int(input())
x = 2
while x <= N:
    if x % 2 == 0:
        print(x)
    x += 1

print("\nPRINT N * 10 TABLES FOR INPUT N -------------------------------------------------------------------------------------\n")

# print 10 times tables for given number of times
print("Enter num of chances:")
chances = int(input())
i = 1
while i <= chances:
    print("Enter chance ", i, ":")
    c = int(input())

    # print table on c
    i2 = 1
    while i2 <= 10:
        print(c * i2)
        i2 += 1

    i += 1








