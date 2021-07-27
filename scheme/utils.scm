(define fold
  (lambda (f acc xs)
    (if (null? xs)
      acc
      (fold f (f acc (car xs)) (cdr xs)))))

(define sum
  (lambda (xs) (fold + 0 xs)))

(define range
  (lambda (start stop step)
    (if (>= start stop)
      '()
      (cons start (range (+ start step) stop step)))))

(define filter
  (lambda (predicate xs)
    (if (null? xs)
      '()
      (let* ((x (car xs))
             (filtered (filter predicate (cdr xs))))
        (if (predicate x) (cons x filtered) filtered)))))
