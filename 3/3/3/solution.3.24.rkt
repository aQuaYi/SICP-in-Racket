#lang sicp

;;; dlink

(define (make-dlink item)
  (cons item (cons '() '())))

(define (item-dlink dlink)
  (car dlink))

(define (prev-dlink dlink)
  (cadr dlink))

(define (next-dlink dlink)
  (cddr dlink))

(define (set-prev-dlink! dlink prev)
  (set-car! (cdr dlink) prev))

(define (set-next-dlink! dlink next)
  (set-cdr! (cdr dlink) next))

(define (double-link prev next)
  (set-next-dlink! prev next)
  (set-prev-dlink! next prev))

;;; deque

(define (make-deque)
  (cons '() '()))

(define (front deque) (car deque))
(define (rear deque) (cdr deque))
(define (set-front! deque ptr) (set-car! deque ptr))
(define (set-rear! deque ptr) (set-cdr! deque ptr))

(define (empty-deque? deque) (null? (front deque)))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque" deque)
      (item-dlink (front deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque" deque)
      (item-dlink (rear deque))))

(define (front-insert-deque! deque item)
  (let ([new-dlink (make-dlink item)])
    (cond ((empty-deque? deque)
           (set-front! deque new-dlink)
           (set-rear! deque new-dlink)
           deque)
          (else
           (double-link new-dlink (front deque))
           (set-front! deque new-dlink)
           deque))))

(define (rear-insert-deque! deque item)
  (let ([new-dlink (make-dlink item)])
    (cond ((empty-deque? deque)
           (set-front! deque new-dlink)
           (set-rear! deque new-dlink)
           deque)
          (else
           (double-link (rear deque) new-dlink)
           (set-rear! deque new-dlink)
           deque))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        ((eq? (front deque) (rear deque))
         (set-front! deque '())
         (set-rear! deque '())
         deque)
        (else
         (set-front! deque (next-dlink (front deque)))
         (set-prev-dlink! (front deque) '()) ;;; NOTICE
         deque)))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        ((eq? (front deque) (rear deque))
         (set-front! deque '())
         (set-rear! deque '())
         deque)
        (else
         (set-rear! deque (prev-dlink (rear deque)))
         (set-next-dlink! (rear deque) '()) ;;; NOTICE
         deque)))

(define (print-deque deque)
  (define (iter d l)
    (if (null? d)
        l
        (iter (next-dlink d) (append l (list (item-dlink d))))))
  (display (iter (front deque) nil))
  (newline))

;;; test

(define d (make-deque))

(front-insert-deque! d '1)
(front-insert-deque! d '2)
(front-insert-deque! d '3)

(print-deque d)

(rear-insert-deque! d 'a)
(rear-insert-deque! d 'b)
(rear-insert-deque! d 'c)
(print-deque d)

(front-delete-deque! d)
(print-deque d)

(front-delete-deque! d)
(print-deque d)

(front-delete-deque! d)
(print-deque d)

(front-delete-deque! d)
(print-deque d)

(front-delete-deque! d)
(print-deque d)

(front-delete-deque! d)
(print-deque d)

(front-insert-deque! d '1)
(front-insert-deque! d '2)
(front-insert-deque! d '3)
(front-insert-deque! d '4)
(front-insert-deque! d '5)
(front-insert-deque! d '6)
(print-deque d)

(rear-delete-deque! d)
(print-deque d)

(rear-delete-deque! d)
(print-deque d)

(rear-delete-deque! d)
(print-deque d)

(rear-delete-deque! d)
(print-deque d)

(rear-delete-deque! d)
(print-deque d)

(rear-delete-deque! d)
(print-deque d)
