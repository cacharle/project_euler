# -*- coding:utf-8 -*-

sum35 = 0
i = 0
while i < 1000:
    if i % 3 == 0 or i % 5 == 0:
        sum35 += i
    i += 1
print(sum35)
