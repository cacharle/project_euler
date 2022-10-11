/*
* Concatenation Coincidence
* Problem 751
*
* A non-decreasing sequence of integers $a_n$ can be generated from any positive real value
* $\theta$ by the following procedure:
* \begin{align}
* \begin{split}
* b_1 &= \theta \\
* b_n &= \left\lfloor b_{n-1} \right\rfloor \left(b_{n-1} - \left\lfloor b_{n-1}
* \right\rfloor + 1\right)~~~\forall ~ n \geq 2 \\
* a_n &= \left\lfloor b_{n} \right\rfloor
* \end{split}
* \end{align}
* Where $\left\lfloor . \right\rfloor$ is the floor function.
* For example, $\theta=2.956938891377988...$ generates the Fibonacci sequence: $2, 3, 5, 8,
* 13, 21, 34, 55, 89, ...$
* The concatenation of a sequence of positive integers $a_n$ is a real value denoted $\tau$
* constructed by concatenating the elements of the sequence after the decimal point,
* starting at $a_1$: $a_1.a_2a_3a_4...$
* For example, the Fibonacci sequence constructed from $\theta=2.956938891377988...$ yields
* the concatenation $\tau=2.3581321345589...$ Clearly, $\tau \neq \theta$ for this value of
* $\theta$.
* Find the only value of $\theta$ for which the generated sequence starts at $a_1=2$ and
* the concatenation of the generated sequence equals the original value: $\tau = \theta$.
* Give your answer rounded to 24 places after the decimal point.
 */

package main

import (
	"fmt"
	"math"
	"math/big"
)

const MAX = 25
const PRECISION = 1e4

func sequence(theta float64) *big.Float {
	as := ""
	b := theta
	for len(as) <= MAX {
		bf := math.Floor(b)
		as += fmt.Sprintf("%d", int(bf))
		b = bf * (b - bf + 1)
	}
	as = as[:MAX]
	as = fmt.Sprintf("%c.%s", as[0], as[1:])
	ret, _, err := big.ParseFloat(as, 10, PRECISION, big.ToNearestEven)
	if err != nil {
		panic(err)
	}
	return ret
}

func main() {
	lo := 2.0
	hi := 3.0
	theta := (hi + lo) / 2.0
	loop:
	for math.Abs(hi - lo) > 1e-15 {  // ugly diff trick
		tau := sequence(theta)
		fmt.Println(tau)
		switch big.NewFloat(theta).Cmp(tau) {
		case 0:
			fmt.Println(tau)
			break loop
		case -1:
			lo = theta
			theta = (hi + lo) / 2.0
		case +1:
			hi = theta
			theta = (hi + lo) / 2.0
		}
	}
}
