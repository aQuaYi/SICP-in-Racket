# 练习 2.72

```racket
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (encode-symbol symbol tree)
  (define (search symbol tree)
    (cond ((leaf? tree) '())
          ((element-of-set? symbol (symbols (left-branch tree)))
           (cons 0 (encode-symbol symbol (left-branch tree))))
          (else
           (cons 1 (encode-symbol symbol (right-branch tree))))))
  (if (element-of-set? symbol (symbols tree))
      (search symbol tree)
      (error "try to encode NO exist symbol -- ENCODE-SYMBOL" symbol)))
```

最频繁字符所需要的步骤是 O(n)，主要耗时在 `element-of-set?` 上。

最**不**频繁字符所需要的步骤是 O(n^2)，耗时在 `element-of-set?` 和 `n-1` 次递归上。
