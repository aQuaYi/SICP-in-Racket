#lang sicp

;; 我对题目给出的程序进行了改造
;; 只需要指定起始数和所需素数的个数
;; 就可以完成查找工作

(define (search-for-primes n count)
  (if (= 0 (remainder n 2))
      (search-iter (+ n 1) count)
      (search-iter n count)))

(define (search-iter n count)
  (define (search-iter-done)
    (newline)
    (display "DONE."))
  (cond ((= count 0) (search-iter-done))
        ((timed-prime-test? n) (search-iter (+ n 2) (- count 1)))
        (else (search-iter (+ n 2) count))))

(define (timed-prime-test? n)
  (newline)
  (display n)
  (define start-time (runtime))
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (square a)
  (* a a))

(define (prime? n)
  (fast-prime? n 100))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


(search-for-primes 10000 3)
(search-for-primes 100000000 3)

;; 可以观察到
;; times == 100
;; n 增加了 10000 倍
;; 时间增加了约 2 倍
