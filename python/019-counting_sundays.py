def month_days(index, leap_year):
    if index == 2:
        if leap_year:
            return 29
        return 28
    if index in [4, 6, 9, 11]:
        return 30
    return 31


def is_leap_year(year):
    if str(year)[2:] == '00' and year % 400 != 0:
        return False
    if year % 4 == 0:
        return True
    return False

def next_day(current):
    if current == 7:
        return 1
    return current + 1

months = [x for x in range(1, 13)]
day = 1
sundays_counter = 0

for year in range(1900, 2001):
    for month in months:
        for d in range(month_days(month, is_leap_year(year))):
            if day == 7 and d == 0 and year >= 1901:
                sundays_counter += 1
            day = next_day(day)

print(sundays_counter)
