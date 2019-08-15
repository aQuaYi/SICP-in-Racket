#lang sicp

;;; entry

(define (make-entry key value)
  (cons key value))

(define (key entry) (car entry))

(define (value entry) (cdr entry))

(define (set-value! entry value) (set-cdr! entry value))

;; tree

(define (make-tree entry left right)
  (list entry left right))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (assoc k tree)
  (cond ((null? tree) false) 
        ((< k (key (entry tree))) (assoc k (left-branch tree)))
        ((> k (key (entry tree))) (assoc k (right-branch tree)))
        (else (entry tree))))

(define (adjoin-set x set) 
  (cond ((null? set) (make-tree x '() '())) 
        ((< (car x) (car (entry set))) 
         (make-tree (entry set) 
                    (adjoin-set x (left-branch set)) 
                    (right-branch set))) 
        ((> (car x) (car (entry set))) 
         (make-tree (entry set) 
                    (left-branch set) 
                    (adjoin-set x (right-branch set))))))

;;; table

(define (make-tree-table)
  (let ((table-tree (list '*table*)))
    (define (lookup key)
      (let ([record (assoc key (cdr table-tree))])
        (if record
            (value record)
            false)))
    (define (insert! key value)
      (let ([record (assoc key (cdr table-tree))])
        (if record
            (set-value! record value)
            (set-cdr! table-tree (adjoin-set (make-entry key value) (cdr table-tree))))))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            ((eq? m 'print)(cdr table-tree))
            (else (error "UNKNOW operation -- TABLE" m))))
    dispatch))

;;;

  
(define table (make-tree-table)) 
(define get (table 'lookup-proc)) 
(define put (table 'insert-proc!))

(put 43 'a)
(put 42 'b)
(put 41 'c)
(put 67 'z)
(put 88 'e)

(table 'print)

(get 88)

(put 43 'f)

(get 43)
