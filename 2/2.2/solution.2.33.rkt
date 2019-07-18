#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(display "-- map --\n")

(define (map p sequence)
  (accumulate (lambda (first rest)
                (cons (p first)
                       rest))
              nil
              sequence))

(map (lambda (x) (* x x x))
     (list 1 2 3 4))

(display "-- append --\n")

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3)
        (list 4 5 6))

(display "-- length --\n")

(define (length sequence)
  (accumulate (lambda (first already-acc)
                (+ 1 already-acc))
              0
              sequence))

(length (list 1 2 3 4 5 6 (list 7 8 9)))