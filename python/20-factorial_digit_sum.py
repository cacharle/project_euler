import math

one_hundred_factorial = math.factorial(100)

to_list_of_int = [int(dgt) for dgt in list(str(one_hundred_factorial))]

sum_of_all_digits = sum(to_list_of_int)

print(sum_of_all_digits)
