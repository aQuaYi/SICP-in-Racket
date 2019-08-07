#lang sicp

(define (make-monitored f)
  (let ((count 0))
    (define (how-many-calls?) count)
    (define (reset-count)
      (set! count 0)
      (display "count has reseted."))
    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) (how-many-calls?))
            ((eq? m 'reset-count) (reset-count))
            (else
             (set! count (+ count 1))
             (f m))))
    dispatch))

(define s (make-monitored sqrt))

(s 100)

(s 'how-many-calls?)

(s 81)

(s 'how-many-calls?)

(s 64)

(s 'how-many-calls?)

(s 'reset-count)
