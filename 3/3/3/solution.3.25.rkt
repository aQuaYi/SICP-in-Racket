#lang sicp

(define (assoc key records)
  (cond ((null? records) false)
        ((eq? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

;;; 1 Dimension

(define (make-1D-table)
  (let ([table (list '*table*)])
    (define (lookup key)
      (let ([record (assoc key (cdr table))])
        (if record
            (cdr record)
            false)))
    (define (iter-lookup keys result)
      (if (null? keys)
          result
          (iter-lookup (cdr keys) (append result (list (lookup (car keys)))))))
    (define (insert! key value)
      (let ([record (assoc key (cdr table))])
        (if record
            (set-cdr! record value)
            (set-cdr! table
                      (cons (cons key value)
                            (cdr table))))))
    (define (iter-insert! keys value)
      (cond ((null? keys) 'ok)
            (else
             (insert! (car keys) value)
             (iter-insert! (cdr keys) value))))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc)
             (lambda (keys) (iter-lookup keys '())))
            ((eq? m 'insert-proc!) iter-insert!)
            (else (error "UNKNOW operation -- TABLE" m))))
    dispatch))

;;; 1-D test

(define d1 (make-1D-table))

((d1 'insert-proc!) (list 1 3 5) 'good)

((d1 'lookup-proc) (list 1 2 3 4 5 6))

((d1 'insert-proc!) (list 4 5 6) 'bad)

((d1 'lookup-proc) (list 1 2 3 4 5 6))