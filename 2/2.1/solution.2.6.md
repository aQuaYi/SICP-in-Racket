# 习题解答 2.6

```racket
(define (add-1 n)
  (lambda (f) 
    (lambda (x) (f ((n f) x)))))

(define zero
  (lambda (f) (lambda (x) x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define three
  (lambda (f) (lambda (x) (f (f (f x))))))

(define (plus m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

(define (mult m n)
  (lambda (f)
    (lambda (x)
      ((m (n f)) x))))
```

`zero`, `one`, `two`和`three`都是高阶过程，他们的参数`f`是某个需要一个参数的一般过程。他们的区别在于嵌套作用于`x`的次数。现有`(define (inc x) (+ x 1))`，看看以下表达式的含义
1. (three inc) 是一个一般过程，会把Ta的参数+3
1. ((three inc) 5) 是数值8
1. (two (three inc)) 是一个一般过程，把
1. ((two (three inc))5) 是把

那么，`(plus m n)`中的`plus`，就是把`m`和`n`这两个高阶过程，嵌套在一起。其实，题目中已经给出了`(plus one n)`，那就是`(add-1 n)`，即
```racket
(define (add-1 n)
  (lambda (f) 
    (lambda (x) (f ((n f) x)))))
```
可以看到`n`在式中为`(n f)`， `one`在式中为`f`。以此类推，`m`在上式中，应该为`(m f)`。所以，把上式中代表`one`的`f`替换为`(m f)`，就可以得到`(plus m n)`了
```racket
(define (add-1 n)
  (lambda (f) 
    (lambda (x) ((m f) ((n f) x)))))
```

