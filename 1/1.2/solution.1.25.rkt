#lang sicp

(define (new-remainder a b)
  (display "\nremainder: ")
  (display a)
  (remainder a b))

(define (square a)
  (* a a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a ))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(define (time-it func a n)
  (define start-time (runtime))
  (define t (func a n))
  (newline)
  (display t)
  (display " --> cost time: ")
  (display (- (runtime) start-time))
  (newline))

(define (old a n)
  (expmod a n n))

(define (new a n)
  (remainder (fast-expt a n) n))

(define a 102007)
(define n 200009)

(time-it old a n)

(time-it new a n)

;; 当 a 和 n 的值较大是，新方案耗时要多得多
;; 这是因为对大数进行运算非常耗时，
;; 新方法只对最终结果求余，导致被除数巨大。

