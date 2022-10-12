/*
* Passcode derivation
* Problem 79
*
* A common security method used for online banking is to ask the user for three random
* characters from a passcode. For example, if the passcode was 531278, they may ask for the
* 2nd, 3rd, and 5th characters; the expected reply would be: 317.
* The text file, keylog.txt, contains fifty successful login attempts.
* Given that the three characters are always asked for in order, analyse the file so as to
* determine the shortest possible secret passcode of unknown length.
 */

package main

import "fmt"

var PASSCODE_PARTS = [...][3]int{
	{3, 1, 9},
	{6, 8, 0},
	{1, 8, 0},
	{6, 9, 0},
	{1, 2, 9},
	{6, 2, 0},
	{7, 6, 2},
	{6, 8, 9},
	{7, 6, 2},
	{3, 1, 8},
	{3, 6, 8},
	{7, 1, 0},
	{7, 2, 0},
	{7, 1, 0},
	{6, 2, 9},
	{1, 6, 8},
	{1, 6, 0},
	{6, 8, 9},
	{7, 1, 6},
	{7, 3, 1},
	{7, 3, 6},
	{7, 2, 9},
	{3, 1, 6},
	{7, 2, 9},
	{7, 2, 9},
	{7, 1, 0},
	{7, 6, 9},
	{2, 9, 0},
	{7, 1, 9},
	{6, 8, 0},
	{3, 1, 8},
	{3, 8, 9},
	{1, 6, 2},
	{2, 8, 9},
	{1, 6, 2},
	{7, 1, 8},
	{7, 2, 9},
	{3, 1, 9},
	{7, 9, 0},
	{6, 8, 0},
	{8, 9, 0},
	{3, 6, 2},
	{3, 1, 9},
	{7, 6, 0},
	{3, 1, 6},
	{7, 2, 9},
	{3, 8, 0},
	{3, 1, 9},
	{7, 2, 8},
	{7, 1, 6},
}


// dumb brute force approch (takes about 1min to solve)
func main() {
	mainLoop:
	for passcode := 100; ; passcode++ {
		s := fmt.Sprintf("%d", passcode)
		digits := make([]int, 0, len(s))
		for _, c := range s {
			digits = append(digits, int(c - '0'))
		}
		for _, part := range PASSCODE_PARTS {
			validCount := 0
			for _, d := range digits {
				if d == part[validCount] {
					validCount++
				}
				if validCount == 3 {
					break
				}
			}
			if validCount != 3 {
				continue mainLoop
			}
		}
		fmt.Println(passcode)
		break
	}

}
