#lang sicp

(#%require "binary-tree.rkt")


(define fig2-16-1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define fig2-16-2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define fig2-16-3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))
(define fig2-17 '(1 () (2 () (3 () (4 () (5 () (6 () (7 () ()))))))))

(tree->list fig2-16-1)

(tree->list fig2-16-2)

(tree->list fig2-16-3)

(tree->list fig2-17)

;;; tree->list-1 中的 append 会在每个操作中带来额外的 logN 复制操作。
