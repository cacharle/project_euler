/*
* Largest prime factor
* Problem 3
*
* The prime factors of 13195 are 5, 7, 13 and 29.
* What is the largest prime factor of the number 600851475143 ?
*/

// fn is_prime(n: u64) -> bool {
//     if n == 2 || n == 3 || n == 5 || n == 7 {
//         return true;
//     }
//     if n % 2 == 0 || n % 3 == 0 {
//         return false;
//     }
//
//     for i in (6..n).step_by(6) {
//         if n % (i - 1) == 0 || n % (i + 1) == 0 {
//             return true;
//         }
//     }
//     return false;
// }

fn main() {
    let mut target: u64 = 600851475143;
    let mut n: u64 = 2;
    let mut last = 0;

    while target > 1 {
        if target % n == 0  {
            last = n;
            target /= n;
            n = 2;
        }
        n += 1;
    }
    println!("{}", last);
}
