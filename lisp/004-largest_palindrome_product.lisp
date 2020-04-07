;;;; ;;;;;;;;
;;;; Largest palindrome product
;;;; Problem 4
;;;;
;;;; A palindromic number reads the same both ways.
;;;; The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
;;;; Find the largest palindrome made from the product of two 3-digit numbers.
;;;; ;;;;;;;;

(defun palindrome-p (n)
  (equal (write-to-string n) (reverse (write-to-string n))))

(print (palindrome-p 32))

(defvar *largest* 0)

(loop :for x :from 999 :downto 1 :do
      (loop :for y :from 999 :downto 1 :do
            (when (and (palindrome-p (* x y)) (> (* x y) *largest*))
              (print (* x y))
              (setf *largest* (* x y)))))

(print *largest*)
