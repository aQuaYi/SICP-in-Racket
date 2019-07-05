#lang sicp

;; 我对题目给出的程序进行了改造
;; 只需要指定起始数和所需素数的个数
;; 就可以完成查找工作

(define (search-for-primes n count)
  (if (= 0 (remainder n 2))
      (search-iter (+ n 1) count)
      (search-iter n count)))

(define (search-iter n count)
  (cond ((= count 0) (search-iter-done))
        ((timed-prime-test? n) (search-iter (+ n 2) (- count 1)))
        (else (search-iter (+ n 2) count))))

(define (search-iter-done)
  (newline)
  (display "DONE."))

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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2)) 

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor))))) ;; 修改了这里

(define (next divisor)
  (if (= divisor 2)
      3
      (+ divisor 2)))

(define (square a)
  (* a a))

(define (divides? d n)
  (= (remainder n d)
     0))

(search-for-primes 100000 3)

(search-for-primes 1000000 3)

(search-for-primes 10000000 3)