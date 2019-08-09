#lang sicp

(define (count-pairs x) 
  (if (not (pair? x)) 
      0 
      (+ (count-pairs (car x)) 
         (count-pairs (cdr x)) 
         1))) 
  
(define str1 '(foo bar baz)) 
(count-pairs str1) ; 3 
; str1 -> ( . ) -> ( . ) -> ( . ) ->null 
;          |        |        | 
;          v        v        v 
;         'foo     'bar     'baz 
  
(define x '(foo)) 
(define y (cons x x)) 
(define str2 (list y)) 
(count-pairs str2) ; 4 
; str2 -> ( . ) -> null 
;          | 
;          v 
;         ( . ) 
;          | | 
;          v v 
;         ( . ) -> 'null 
;          | 
;          v 
;         'foo 
  
; (define x '(foo)) 
; (define y (cons x x)) 
(define str3 (cons y y)) 
(count-pairs str3) ; 7 
; str3 -> ( . ) 
;          | | 
;          v v 
;         ( . ) 
;          | | 
;          v v 
;         ( . ) -> null 
;          | 
;          v 
;         'foo 
  
(define str4 '(foo bar baz)) 
(set-cdr! (cddr str4) str4) 
(count-pairs str4) ; maximum recursion depth exceeded 
;          ,-------------------, 
;          |                   | 
;          v                   | 
; str4 -> ( . ) -> ( . ) -> ( . ) 
;          |        |        | 
;          v        v        v 
;         'foo     'bar     'baz 