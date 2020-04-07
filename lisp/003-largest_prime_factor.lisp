;;;; ;;;;;;;;
;;;; Largest prime factor
;;;; Problem 3
;;;;
;;;; The prime factors of 13195 are 5, 7, 13 and 29.
;;;; What is the largest prime factor of the number 600851475143 ?
;;;; ;;;;;;;;

(defconstant +big-num+ 600851475143)

(defun is-prime-rec (n d)
(cond
  ((= 0 (mod n d)) nil)
  ((= 0 (mod n (+ d 2))) nil)
  ((> (* d d) n) t)
  (t (is-prime-rec n (+ d 6)))))

(defun is-prime (n)
  (when (or (= 0 (mod n 2)) (= 0 (mod n 3))) (return-from is-prime nil))
  (is-prime-rec n 5))


; (print (is-prime 1597))

(defvar *largest* 0)

(dotimes (x +big-num+)
  (print x)
  (when (and (= 0 (mod +big-num+ is-prime x) (setf *largest* x)))

(print *largest*)
