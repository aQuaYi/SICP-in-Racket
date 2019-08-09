#lang sicp

;;; problem said, just cdr to look for end.

(define loop '(foo bar baz)) 
(set-cdr! (cddr loop) loop) 
;          ,-------------------, 
;          |                   | 
;          v                   | 
; str4 -> ( . ) -> ( . ) -> ( . ) 
;          |        |        | 
;          v        v        v 
;         'foo     'bar     'baz

(define (has-loop? x)
  (let ([seen '()])
    (define (check x)
      (cond ((null? x) #f)
            ((memq x seen) #t)
            (else
             (set! seen (cons x seen))
             (check (cdr x)))))
    (check x)))

(has-loop? loop)

(has-loop? (list 'a 'b 'c))
