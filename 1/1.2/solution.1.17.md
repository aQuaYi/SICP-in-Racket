# 习题解答 1.17

我做出来以后，卡在了
```racket
(define (double a)
  (* a 2))
```
因为，我没有审题清楚，题目中说了，没有定义`*`。像上面这样定义`double`会导致无穷的递归。

实际的答案是
```racket
(define (double a)
  (+ a a))
```