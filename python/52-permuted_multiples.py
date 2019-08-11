from itertools import count


found = False
for i in count(1):
    foo = [sorted(str(i * x)) for x in range(1, 7)]
    
    for w in foo[1:]:
        found = True
        if w != foo[0]:
            found = False
            break

    if found:
        print(i)
        break
