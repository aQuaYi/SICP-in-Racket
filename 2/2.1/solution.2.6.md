# 习题解答 2.6

```racket
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define zero
  (lambda (f) (lambda (x) x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define three
  (lambda (f) (lambda (x) (f (f (f x))))))

(define (plus a b) 
  (lambda (x) (a (b x))))
```

`zero`, `one`, `two`和`three`都是高阶过程，他们的参数`f`是某个需要一个参数的一般过程。他们的区别在于嵌套作用于`x`的次数。

那么，`(plus a b)`中的plus，就是把`a`和`b`这两个高阶过程，嵌套在一起。