/*
* Number Splitting
* Problem 719
*
* We define an $S$-number to be a natural number, $n$, that is a perfect square and its
* square root can be obtained by splitting the decimal representation of $n$ into 2 or more
* numbers then adding the numbers.
* For example, 81 is an $S$-number because $\sqrt{81} = 8+1$.
* 6724 is an $S$-number: $\sqrt{6724} = 6+72+4$.
* 8281 is an $S$-number: $\sqrt{8281} = 8+2+81 = 82+8+1$.
* 9801 is an $S$-number: $\sqrt{9801}=98+0+1$.
* Further we define $T(N)$ to be the sum of all $S$ numbers $n\le N$. You are given
* $T(10^4) = 41333$.
* Find $T(10^{12})$
 */

package main

import (
	"fmt"
	"math"
)

type digitSum struct {
	sum int
	current int
	currentPow10 int
}

func digitsSums(digits []int) []digitSum {
	if len(digits) == 0 {
		panic("len(digits) == 0")
	} else if len(digits) == 1 {
		return []digitSum{
			{sum: digits[0], current: 0, currentPow10: 0},
		}
	}
	subSums := digitsSums(digits[:len(digits) - 1])
	currentDigit := digits[len(digits) - 1]

	addSums := make([]digitSum, 0, len(subSums) * 2)
	for _, s := range subSums {
		digitAdd := s
		digitAdd.sum += digitAdd.current
		digitAdd.current = currentDigit
		digitAdd.currentPow10 = 0
		addSums = append(addSums, digitAdd)

		concatAdd := s
		concatAdd.currentPow10++
		concatAdd.current += int(math.Pow10(concatAdd.currentPow10)) * currentDigit
		addSums = append(addSums, concatAdd)
	}
	return addSums
}

func numberDigitsSummations(n int) []int {
	digits := make([]int, 0)
	for n > 0 {
		digits = append(digits, n % 10)
		n /= 10
	}
	sums := digitsSums(digits)
	intSums := make([]int, len(sums))
	for i, ds := range sums {
		intSums[i] = ds.sum + ds.current
	}
	return intSums
}

const MAX_NUM int = 1e12

func main() {
	maxNumSqrt := int(math.Ceil(math.Sqrt(float64(MAX_NUM))))
	fmt.Println("max sqrt:", maxNumSqrt)
	total := 0
	for nRoot := 2; nRoot <= maxNumSqrt; nRoot++ {
		if nRoot % 1_000 == 0 {
			fmt.Printf("> %d%%\r", int(100 * float64(nRoot) / float64(maxNumSqrt)))
		}
		n := nRoot * nRoot
		sums := numberDigitsSummations(n)
		for _, s := range sums {
			if s * s == n {
				total += n
				fmt.Println(n, "                           ")
				break
			}
		}
	}
	fmt.Println(total)
}
