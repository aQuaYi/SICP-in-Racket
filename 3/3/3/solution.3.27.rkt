#lang sicp

;;; table

(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
        (cdr record)
        false)))

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) 
         (car records))
        (else (assoc key (cdr records)))))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) 
                        (cdr table)))))
  'ok)

(define (make-table)
  (list '*table*))

;;; fib

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else
         (+ (fib (- n 1))
            (fib (- n 2))))))

;;; memo-fib

(define (memoize f)
  (let ([table (make-table)])
    (lambda (x)
            (let ([previously-computed-result (lookup x table)])
              (or previously-computed-result
                  (let ([result (f x)])
                    (insert! x result table)
                    result))))))

(define memo-fib
  (memoize (lambda (x)
             (cond ((= x 0) 0)
                   ((= x 1) 1)
                   (else
                    (+ (memo-fib (- x 1))
                       (memo-fib (- x 2))))))))

;;; test

(define n 40)

(define now (runtime))

(fib n)

(display (- (runtime) now))

(newline)

(set! now (runtime))

(memo-fib n)

(display (- (runtime) now))
