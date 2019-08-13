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
    (define (check slow fast)
      (cond ((eq? slow fast)
             #t)
            ((or (null? (cdr fast)) (null? (cddr fast)))
             #f)
            (else
             (check (cdr slow) (cddr fast)))))
    (check x (cdr x)))

(has-loop? loop)

(has-loop? (list 'a 'b 'c))
