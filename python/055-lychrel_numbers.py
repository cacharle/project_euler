from helper.palindrome import is_palindrome


def reverse_and_add(num):
    return num + int(str(num)[::-1])

def is_lychrel_number(num):
    for _ in range(50):
        num = reverse_and_add(num)
        if is_palindrome(num):
            return False
    return True

counter = 0
for i in range(10_000):
    if is_lychrel_number(i):
        counter += 1

print(counter)
