from itertools import count


def collatz_sequence_size(nb):
    for i in count(1):
        if nb == 1:
            return i
        nb = (nb / 2) if nb % 2 == 0 else (nb * 3 + 1)

max_nb = (1, 0)
for nb in range(1, 1_000_000):
    col_seq_size = collatz_sequence_size(nb)
    if col_seq_size > max_nb[1]:
        max_nb = nb, col_seq_size

print(max_nb)
