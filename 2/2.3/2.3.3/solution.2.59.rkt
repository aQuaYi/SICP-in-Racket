#lang sicp

(#%require "unsort-list.rkt")

(union-set (list 1 3 5)
           (list 2 4 6))

(union-set '()
           '())

(union-set '()
           (list 2 4 6))

(union-set (list 1 3 5)
           '())
