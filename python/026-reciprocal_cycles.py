# ###
# Reciprocal cycles
# Problem 26
# 
# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
# 
# 1/2= 0.5
# 1/3= 0.(3)
# 1/4= 0.25
# 1/5= 0.2
# 1/6= 0.1(6)
# 1/7= 0.(142857)
# 1/8= 0.125
# 1/9= 0.(1)
# 1/10= 0.1
# 
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
# ###


import decimal


MIN_CYCLE = 3

def get_start_cycle(s):
    cycle = s[0]
    detected_counter = 0
    i = 1
    while i < len(s):
        if detected_counter >= MIN_CYCLE:
            return cycle
        if s[i:].find(cycle) == 0:
            detected_counter += 1
            i += len(cycle) - 1
        else:
            detected_counter = 0
            cycle += s[i]
        i += 1
    return ""

def get_cycle(s):
    for j in range(len(s)):
        cycle = get_start_cycle(s[j:])
        if cycle != "":
            return cycle
    return ""

   
if __name__ == "__main__":
    decimal.getcontext().prec = 4000
    dec_one = decimal.Decimal(1)
    unit_fracs = [str(dec_one / decimal.Decimal(x))[2:] for x in range(2, 1000)]
    cycles = [(n, get_cycle(x)) for n, x in zip(range(2, 1000), unit_fracs)]
    print(sorted(cycles, key=lambda t: len(t[1]), reverse=True)[0][0])
