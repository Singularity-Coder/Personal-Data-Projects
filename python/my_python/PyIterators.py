# Iterator is an obj that has countable num of vlaues
# implements iterator protocol - __iter__() and __next__()
# Iterables like list, tuple, string, dict are wrappers to Iterator - they have iter() method which returns iterator

print("\nGET ITERATOR FROM ITERABLES -------------------------------------------------------------------------------------\n")

my_tuple = (1, 2, 3)
my_iter = iter(my_tuple)
print(next(my_iter))
print(next(my_iter))
print(next(my_iter))

print("\nLOOP THROUGH ITERATOR -------------------------------------------------------------------------------------\n")

for x in my_tuple:
    print(x)

print("\nCREATE ITERATOR -------------------------------------------------------------------------------------\n")

# Create an itertor staring with 1 and each sequence will increase the value by 1

class MyIterator:

    def __iter__(self):
        self.a = 1
        return self

    def __next__(self):
        if self.a < 15:
            x = self.a # storing reference
            self.a += 1
            return x # this will reflect chnages done to self.a as python references the value and does not copy it. to copy u need copy method
        else:
            raise StopIteration # without this the loop will be inf

my_iterator_obj = MyIterator()
my_iter = iter(my_iterator_obj)
print(next(my_iter))
print(next(my_iter))
print(next(my_iter))
print()

for x in my_iter:
    print(x)
