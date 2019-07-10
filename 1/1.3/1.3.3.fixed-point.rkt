#lang sicp

(define (average a b)
  (/ (+ a b)
     2.0))

(define (search-with-tolerance f neg-point pos-point max-tolerance)
  (define (close-enough? a b)
    (< (abs (- a b)) max-tolerance))
  (define (search f n p)
    (let ((m (average n p)))
      (if (close-enough? n p)
          m
          (let ((m-value (f m)))
            (cond ((positive? m-value) (search f n m))
                  ((negative? m-value) (search f m p))
                  (else m))))))
  (search f neg-point pos-point))


(define (half-interval-method f a b)
  (let ((max-tolerance 0.001)
        (a-value (f a))
        (b-value (f b)))
    (cond ((= a-value 0) a)
          ((= b-value 0) b)
          ((and (negative? a-value) (positive? b-value))
           (search-with-tolerance f a b max-tolerance))
          ((and (negative? b-value) (positive? a-value))
           (search-with-tolerance f b a max-tolerance))
          (else
           (error "Values are not of opposite sign," a b)))))

(half-interval-method sin 2. 4.)

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.
                      2.)

(half-interval-method sin 5. 4.)