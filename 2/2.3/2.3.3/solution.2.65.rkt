#lang sicp

(#%require "binary-tree.rkt")

(union-set (list->tree '(1 3 5 7 9 11))
           (list->tree '(2 4 6 8 10)))

(intersection-set (list->tree '(1 3 5 6 7 8 9 10 11))
                  (list->tree '(1 2 3 4 5 6 8 10)))
