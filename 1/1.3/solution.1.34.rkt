#lang sicp

(define (f g)
  (g 2))

(define (square x)
  (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))

(f f)

;;   (f f)
;; = (f 2)
;; = (2 2)
;; 由于第一个 2 不是过程，所以会提示错误。
