#lang sicp

(#%require "huffman-tree.rkt")

(define rock-tree
  (generate-huffman-tree
   '((a 2) 
     (na 16)
     (boom  1)
     (Sha 3)
     (Get 2)
     (yip 9)
     (job 2)
     (Wah 1))))

(define rock-song '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom)) 
  
(define encoded-rock-song (encode rock-song rock-tree)) 
  
(length encoded-rock-song)

;;; 采用定长的数组的话，需要 108 个二进制数。