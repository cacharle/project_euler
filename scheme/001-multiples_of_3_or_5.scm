;;;;
;; Multiples of 3 or 5
;; Problem 1
;;
;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6
;; and 9. The sum of these multiples is 23.
;; Find the sum of all the multiples of 3 or 5 below 1000.
;;;;

(load "utils.scm")

(define +top+ 1000)

(define result
  (sum
    (filter
      (lambda (x) (or (= 0 (modulo x 3)) (= 0 (modulo x 5))))
      (range 1 +top+ 1))))

(display result)
