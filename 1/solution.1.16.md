# 练习1.16

此题的关键是找到状态变化时的不变量。
在解答中
```racket
(define (fast-expt-iter b n a)
```
其中，a*b^n，就是这个不变量。最后,n==0时，返回a