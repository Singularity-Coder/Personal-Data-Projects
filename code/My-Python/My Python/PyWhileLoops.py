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





