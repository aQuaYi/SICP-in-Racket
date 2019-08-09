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
    (define (check s f)
      (cond ((eq? s f)
             #t)
            ((or (null? (cdr f)) (null? (cddr f)))
             #f)
            (else
             (check (cdr s) (cddr f)))))
    (check x (cdr x)))

(has-loop? loop)

(has-loop? (list 'a 'b 'c))
