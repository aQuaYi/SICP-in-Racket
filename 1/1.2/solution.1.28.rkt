#lang sicp

;; `遇到了"1取模n的非平凡平方根"` 的含义是
;; 找到了一个 x!=1 && x!=n-1, 但是 x^2%n=1
;; 在 expmod 过程中，肯定会遇到 x^2%n=? 的计算。
;; 如果 x 是非平凡平方根，则可以断定 n 不是素数。

 (define (miller-rabin-expmod base exp n)
   (define (square-mod-check x)
     (define (check-nontrivial-sqrt x square-mod)
       (if (and (= square-mod 1)
                (not (= x 1))
                (not (= x (- n 1))))
           0 ;; finde nontrivial square root
           square-mod))
     (check-nontrivial-sqrt x (remainder (square x) n)))
   (cond ((= exp 0) 1)
         ((even? exp) (square-mod-check
                       (miller-rabin-expmod base (/ exp 2) n)))
         (else
          (remainder (* base (miller-rabin-expmod base (- exp 1) n))
                     n))))

 (define (miller-rabin-test n)
   (define (try a)
     (define (check x)
       (and (not (= x 0)) ;; not find nontrivial square root
            (= x 1)))
     (check (miller-rabin-expmod a (- n 1) n)))
   (try (+ 1 (random (- n 1)))))

 (define (fast-prime? n times)
   (cond ((= times 0) true)
         ((miller-rabin-test n) (fast-prime? n (- times 1)))
         (else false)))

 (define (miller-rabin-prime? n)
    (fast-prime? n 100))

; ------

(define (real-prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? d n)
  (= (remainder n d)
     0))

(define (square a)
  (* a a))

; -----

(define (check-carmichael n)
  (define (carmichael? n)
    (and (miller-rabin-prime? n)
         (not (real-prime? n))))
  (display n)
  (display " Carmichael?: ")
  (display (carmichael? n))
  (newline))

(check-carmichael 561)

(check-carmichael 1105)

(check-carmichael 1729)

(check-carmichael 2465)

(check-carmichael 2821)

(check-carmichael 6601)
