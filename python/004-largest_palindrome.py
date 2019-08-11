threeDigitsReversedList = list(reversed(range(100, 1000)))

palindrome_num = 0
for a in threeDigitsReversedList:
    for b in threeDigitsReversedList:
        num = a * b
        if str(num) == str(num)[::-1]:
            if num > palindrome_num:
                palindrome_num = num
                break

print(palindrome_num)
