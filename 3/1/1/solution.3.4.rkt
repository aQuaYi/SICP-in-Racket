#lang sicp

(define (call-the-cops)
  "calling 110....")

(define (make-account balance password)
  (let ((times 7)
        (remaining-try 7))
    (define (correct-password? pw)
      (if (eq? pw password)
          (begin (set! remaining-try times)
                 #t)
          (begin (set! remaining-try (- remaining-try 1))
                 #f)))
    (define (meeting-wrong-password m)
      (if (<= remaining-try 0)
          (call-the-cops)
          "Incorrect password"))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))
    (define (deposit amount)
      (begin (set! balance (+ balance amount))
             balance))
    (define (dispatch pw m)
      (if (correct-password? pw)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Unknow request --- MAKE-ACCOUNT"
                             m)))
          meeting-wrong-password))
    dispatch))

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)

((acc 'secret-password 'deposit) 120)

((acc 'wrong-password 'withdraw) 40) ;;; 1
((acc 'wrong-password 'withdraw) 40) ;;; 2
((acc 'wrong-password 'withdraw) 40) ;;; 3
((acc 'wrong-password 'withdraw) 40) ;;; 4
((acc 'wrong-password 'withdraw) 40) ;;; 5
((acc 'wrong-password 'withdraw) 40) ;;; 6

;;; 注意题目里面说的是
;;; 连续访问
;;; 所以，如果每次输入正确的密码后，都会重置尝试次数
;;; ((acc 'secret-password 'deposit) 120)

((acc 'wrong-password 'withdraw) 40) ;;; 7
((acc 'wrong-password 'withdraw) 40) ;;; 8