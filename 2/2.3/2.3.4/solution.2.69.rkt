#lang sicp

(#%require "huffman-tree.rkt")

(define test-tree
  (generate-huffman-tree
   '((A 4)
     (C 1)
     (B 2)
     (D 1))))

(encode '(A B C D) test-tree) 