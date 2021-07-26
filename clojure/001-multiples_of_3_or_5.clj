;;;;
;; Multiples of 3 or 5
;; Problem 1
;;
;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6
;; and 9. The sum of these multiples is 23.
;; Find the sum of all the multiples of 3 or 5 below 1000.
;;;;

(def +top+ 1000)

(def result
  (reduce +
    (for [x (range 1 +top+)
          :when (or (= (mod x 3) 0) (= (mod x 5) 0))]
      x)))

(println result)
