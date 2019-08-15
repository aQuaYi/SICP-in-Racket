#lang sicp

(define (make-table same-key?)
  (define (assoc key records)
    (cond ((null? records) false)
          ((same-key? key (caar records)) (car records))
          (else (assoc key (cdr records)))))
  (let ((local-table (list '*table*)))
    (define (lookup key)
      (let ((record (assoc key (cdr local-table))))
        (if record
            (cdr record)
            false)))
    (define (insert! key value)
      (let ([record (assoc key (cdr local-table))])
        (if record
            (set-cdr! record value)
            (set-cdr! local-table
                      (cons (cons key value)
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "UNKNOW operation -- TABLE" m))))
    dispatch))

(define (same-key? key-1 key-2)
  (< (- key-1 key-2) 1))

(same-key? 5.2 5)

(define ts (make-table same-key?))

((ts 'insert-proc!) 1 100)

((ts 'lookup-proc) 1.3)

((ts 'insert-proc!) 1.99 199)

((ts 'lookup-proc) 1.8)
