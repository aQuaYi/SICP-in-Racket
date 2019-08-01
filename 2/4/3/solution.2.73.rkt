#lang sicp

(#%require (only racket make-hash
                 hash-set!
                 hash-ref))

(define *the-table* (make-hash));make THE table 
(define (put key1 key2 value) (hash-set! *the-table* (list key1 key2) value));put 
(define (get key1 key2) (hash-ref *the-table* (list key1 key2) #f));get

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (=number? exp num) 
  (and (number? exp) (= exp num))) 

;;;

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) 
         (if (same-variable? exp var) 
             1 
             0))
        (else ((get 'deriv (operator exp)) 
               (operands exp) 
               var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))


;;; a
;;; 因为 number? 和 variable? 操作的对象**不**是 pair
;;; 以下操作会报错
;;; (operator 1)
;;; mcar: contract violation
;;;   expected: mpair?
;;;   given: 1

;;; b and c

(define (install-symbolic-differentiation-package)
  ;;; sum
  (define (addend exp) (car exp))
  (define (augend exp) 
    (let ((rest (cdr exp))) 
      (if (null? (cdr rest)) 
          (car rest) 
          (cons '+ rest)))) 
  (define (make-sum a b) 
    (cond ((=number? a 0) b) 
          ((=number? b 0) a) 
          ((and (number? a) (number? b))  
           (+ a b)) 
          (else (list '+ a b)))) 
  (put 'deriv '+ (lambda (exp var) 
                   (make-sum (deriv (addend exp) var) 
                             (deriv (augend exp) var)))) 
  ;;; multiply
  (define (multiplier exp) (car exp))  
  (define (multiplicand exp) 
    (let ((rest (cdr exp))) 
      (if (null? (cdr rest)) 
          (car rest) 
          (cons '* rest)))) 
  (define (make-product a b) 
    (cond ((or (=number? a 0)  
               (=number? b 0))  
           0)
          ((=number? a 1) b) 
          ((=number? b 1) a) 
          ((and (number? a) (number? b))  
           (* a b))
          (else (list '* a b))))  
  (put 'deriv '* (lambda (exp var) 
                   (make-sum 
                    (make-product (multiplier exp) 
                                  (deriv (multiplicand exp) var)) 
                    (make-product (deriv (multiplier exp) var) 
                                  (multiplicand exp))))) 
  ;;; exponentiation
  (define base car) 
  (define exponent cadr) 
  (define (make-exponentiation base exponent) 
    (cond ((=number? base 0) 0) 
          ((=number? exponent 1) base) 
          ((=number? exponent 0) 1) 
          ((and (number? base) (number? exponent))  
           (expt base exponent)) 
          (else (list '** base exponent)))) 
  (put 'deriv '** (lambda (operands var) 
                    (make-product (exponent operands) 
                                  (make-product (make-exponentiation (base operands) 
                                                                     (- (exponent operands) 1)) 
                                                (deriv (base operands) var))))) 
  (display "has installed symbolic differentiation package")
  (newline))

;;; test

(install-symbolic-differentiation-package)
(deriv '(+ x 3) 'x)
(deriv '(+ x x x) 'x) 
(deriv '(* x x x) 'x)
(deriv '(* x y z) 'x) 
(deriv '(+ x (* x  (+ x (+ y 2)))) 'x) 
(deriv '(** x 3) 'x) 