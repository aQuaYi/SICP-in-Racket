#lang sicp

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch pw m)
    (cond ((not (eq? pw password))
           (lambda (x) "Incorrect password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          ((eq? m 'check) balance)
          (else (error "Unknow request --- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define peter-acc (make-account 200 'open-sesame))

(peter-acc 'open-sesame 'check)

;;;

(define (make-joint acc old-pw new-pw)
  (define (dispatch pw m)
    (if  (eq? pw new-pw)
         (acc old-pw m)
         (lambda (x) "Incorrect password")))
  dispatch)

(define alice-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

((alice-acc 'rosebud 'withdraw) 42)

(peter-acc 'open-sesame 'check)

((alice-acc 'rosebud 'deposit) 142)

(peter-acc 'open-sesame 'check)