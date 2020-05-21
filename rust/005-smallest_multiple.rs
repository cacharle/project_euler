/*
* Smallest multiple
* Problem 5
*
* 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
* What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

fn main() {
    let mut end = false;
    let mut n = 2;

    // note to self: iterator are really slow 11s vs 1s without them.
    loop {

        let mut d = 3;
        while d <= 20 {
            if n % d != 0 {
                end = false;
                break;
            } else {
                end = true;
            }
            d += 1;
        }

        if end {
            println!("{}", n);
            break;
        }

        n += 2;
    }
}
