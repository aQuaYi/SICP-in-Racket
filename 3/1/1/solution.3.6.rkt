#lang sicp

(define (rand-update x) 
  (let ((a 27) (b 26) (m 127)) 
    (modulo (+ (* a x) b) m))) 

(define rand
  (let ([x (random 1000)])
    (define (dispatch m)
    (cond ((eq? m 'reset)
           (lambda (new-value) (set! x new-value)))
          ((eq? m 'generate)
           (set! x (rand-update x))
           x)
          (else (error "wrong message -- RAND"))))
    dispatch))

(rand 'generate)

((rand 'reset) 42)

(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)

(display "----------------")
(newline)

((rand 'reset) 42)

(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)
