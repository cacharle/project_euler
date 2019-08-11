from helper.numbers import is_triangular


def letter_alph_ord(l):
    return ord(l) - 64

def sum_letter_ord(word):
    return sum([letter_alph_ord(l) for l in word])

counter = 0
with open('helper/data/words.txt', 'r') as file:
    words = [w[1:-1] for w in file.read().split(',')]
    for w in words:
        if is_triangular(sum_letter_ord(w)):
            counter += 1

print(counter)
