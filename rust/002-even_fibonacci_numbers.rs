/*
* Even Fibonacci numbers
* Problem 2
*
* Each new term in the Fibonacci sequence is generated by adding the previous two terms.
* By starting with 1 and 2, the first 10 terms will be:
* 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
* By considering the terms in the Fibonacci sequence whose values do not exceed four million,
* find the sum of the even-valued terms.
*/

struct Fib {
    a: u32,
    b: u32
}

impl Iterator for Fib {
    type Item = u32;

    fn next(&mut self) -> Option<u32> {
        let c = self.a + self.b;
        self.a = self.b;
        self.b = c;
        return Some(c)
    }
}

fn main() {
    let fib = Fib { a: 0, b: 1 };
    let mut sum = 0;

    for f in fib {
        if f > 4_000_000 {
            break;
        }
        if f % 2 == 0 {
            sum += f;
        }
    }
    println!("{}", sum);
}
