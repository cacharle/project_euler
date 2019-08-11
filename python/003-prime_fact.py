# It work but la flemme de couper la boucle quand on a atteint le dernier facteur.
number = 600851475143
prime_factors = []

end = False
while not end:

    for divisor in range(2, number + 1):

        if number % divisor == 0:
            prime_factors.append(divisor)
            number = int(number / divisor)
            print(prime_factors)
            if divisor == number:
                end = True
            break


print(prime_factors)
