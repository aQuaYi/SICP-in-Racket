#lang sicp

(define f
  (let ((count 1))
    (lambda (x)
      (set! count (* count x))
      count)))

(+ (f 0) (f 1))
