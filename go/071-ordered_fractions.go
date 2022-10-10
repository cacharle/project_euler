/*
* Ordered fractions
* Problem 71
*
* Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1,
* it is called a reduced proper fraction.
* If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we
* get:
* 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5,
* 5/6, 6/7, 7/8
* It can be seen that 2/5 is the fraction immediately to the left of 3/7.
* By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order of
* size, find the numerator of the fraction immediately to the left of 3/7.
 */

package main

import (
	"fmt"
	"sort"
)

const MAX_DENOMINATOR = 1_000_000

// from: https://www.101computing.net/hcf-and-lcm-algorithms/
func hcf(a, b int) int {
	var t int
	if a < b {
		t = a
		a = b
		b = t
	}
	for b > 0 {
		t = b
		b = a % b
		a = t
	}
	return a
}

func hasCommonFactor(a, b int) bool {
	return hcf(a, b) != 1
}

type Fraction struct {
	N int
	D int
}

func (f1 Fraction) isLower(f2 Fraction) bool {
		ni_common := f1.N * f2.D
		nj_common := f2.N * f1.D
		return ni_common < nj_common
}

var targetFraction = Fraction {N: 3, D: 7}

func main() {
	fractions := make([]Fraction, 0, MAX_DENOMINATOR)
	fractions = append(fractions, targetFraction)

	for d := 1; d <= MAX_DENOMINATOR; d++ {
		lo := 1
		hi := d
		n := (hi + lo) / 2
		var f Fraction
		for lo < hi {
			factor := hcf(n, d)
			f = Fraction{
				N: n / factor,
				D: d / factor,
			}
			if f.isLower(targetFraction) {
				lo = n + 1
			} else {
				hi = n
			}
			n = (hi + lo) / 2
		}
		fractions = append(fractions, f)
		// in case we're at the fraction just one above the target fraction
		f.N--
		fractions = append(fractions, f)
	}

	sort.Slice(fractions, func (i, j int) bool {
		return fractions[i].isLower(fractions[j])
	})

	new_fractions := make([]Fraction, 0, len(fractions))
	for i := 0; i < len(fractions); {
		new_fractions = append(new_fractions, fractions[i])
		curr := fractions[i]
		for i < len(fractions) && curr.N == fractions[i].N && curr.D == fractions[i].D {
			i++
		}
	}

	for i, f := range new_fractions {
		if f.N == targetFraction.N && f.D == targetFraction.D {
			fmt.Printf("to the left of %d/%d is %d/%d\n", f.N, f.D, new_fractions[i - 1].N, new_fractions[i - 1].D)
			fmt.Printf("answer %d\n", new_fractions[i - 1].N)
		}
	}
}
