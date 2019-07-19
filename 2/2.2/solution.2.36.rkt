#lang sicp

(define seqs
  (list
   (list 1 2 3)
   (list 4 5 6)
   (list 7 8 9)
   (list 10 11 12)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (cars seqs)
  (if (null? seqs)
      nil
      (cons (car (car seqs))
            (cars (cdr seqs)))))

(define (cdrs seqs)
  (if (null? seqs)
      nil
      (cons (cdr (car seqs))
            (cdrs (cdr seqs)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (cars seqs))
            (accumulate-n op init (cdrs seqs)))))

(accumulate-n + 0 seqs)
