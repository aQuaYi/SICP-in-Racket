#lang sicp

(define (front queue) (car queue))

(define (rear queue) (cdr queue))

(define (set-front queue item) (set-car! queue item))

(define (set-rear queue item) (set-cdr! queue item))


(define (empty-queue? queue) (null? (front queue)))

(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front queue))))

(define (insert-queue queue item)
  (let ([new-pair (cons item '())])
    (cond ((empty-queue? queue)
           (set-front queue new-pair)
           (set-rear queue new-pair)
           queue)
          (else
           (set-cdr! (rear queue) new-pair)
           (set-rear queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front queue (cdr (front queue)))
         queue)))

(define (print-queue queue)
  (display (front queue))
  (newline))

(define q (make-queue))

(print-queue (insert-queue q 'a))

(print-queue (insert-queue q 'b))

(print-queue (delete-queue! q))

(print-queue (delete-queue! q))
