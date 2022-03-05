(define (fold f acc xs)
  (if (null? xs)
    acc
    (fold f (f acc (car xs)) (cdr xs))))

(define (sum xs) (fold + 0 xs))

(define (range start stop step)
  (if (>= start stop)
    '()
    (cons start (range (+ start step) stop step))))

(define (filter predicate xs)
  (if (null? xs)
    '()
    (let* ((x (car xs))
           (filtered (filter predicate (cdr xs))))
      (if (predicate x) (cons x filtered) filtered))))
