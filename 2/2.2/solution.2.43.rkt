#lang sicp

(#%require "../../book-code.rkt")

(define empty-board `())

(define (safe? k positions)
  (let ((r (car (car positions)))
        (c k)
        (rest (cdr positions)))
    (accumulate (lambda (p result)
                  (let ((i (car p))
                        (j (cadr p)))
                    (and (not
                          (or (= r i)
                              (= c j)
                              (= (+ r c) (+ i j))
                              (= (- r i) (- c j))))
                         result)))
                true
                rest)))

(define (adjoin-position r c rest)
  (cons (list r c)
        rest))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         ;; bad code ↓↓↓
         (flatmap
             (lambda (new-row)
               (map (lambda (rest-of-queens)
                      (adjoin-position new-row k rest-of-queens))
                    (queen-cols (- k 1))))
             (enumerate-interval 1 board-size))
         ;; bad code ↑↑↑
         )))
  (queen-cols board-size))

(define start-time (runtime))

(length (queens 8))

(report-time start-time)

;; 8^8 / 8! ≈ 416