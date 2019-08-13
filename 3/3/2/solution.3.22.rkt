#lang sicp

(define (make-queue)
  (let ([front '()]
        [rear '()])
    (define (dispatch m)
      (cond ((eq? m 'front) front)
            ((eq? m 'rear) rear)
            ((eq? m 'set-front) (lambda (val) (set! front val)))
            ((eq? m 'set-rear) (lambda (val) (set! rear val)))
            (else
             (error "DISPATCH wrong operation" m))))
    dispatch))

(define (front queue) (queue 'front))

(define (rear queue) (queue 'rear))

(define (set-front queue item) ((queue 'set-front) item))

(define (set-rear queue item) ((queue 'set-rear) item))

;;; 以下内容和 3.21 中完全相同

(define (empty-queue? queue) (null? (front queue)))

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
