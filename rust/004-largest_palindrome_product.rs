/*
* Largest palindrome product
* Problem 4
*
* A palindromic number reads the same both ways.
* The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
* Find the largest palindrome made from the product of two 3-digit numbers.
*/

fn is_palindrome(n: u32) -> bool {
    let s: String = n.to_string();
    let r: String = s.chars().rev().collect();
    s == r
}

fn main() {
    let mut largest = 0;

    for x in 100..1000 {
        for y in 100..1000 {
            if is_palindrome(x * y) && x * y > largest{
                largest = x * y
            }
        }
    }
    println!("{}", largest);
}
