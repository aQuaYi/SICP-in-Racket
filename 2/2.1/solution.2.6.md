# 习题解答 2.6
由题意和代换，可得
```racket
#lang racket
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

(define (inc x)
  (+ x 1))
```

## 嵌套
```
f(g(x))
```
像上式这样，x是g的参数，g(x)又是f的参数。我就把这叫做`把g嵌套入f`。
由上面`inc`的定义，可知
```
  (inc (inc (inc (inc 0))))
= (inc (inc (inc 1)))
= (inc (inc 2))
= (inc 3)
= 4
```
像上式这样，我叫做`把inc嵌套了4次`

## 用嵌套的次数表示数
```racket
(define three
  (lambda (f) (lambda (x) (f (f (f x))))))
```
从上可以看到`three`把自己的参数`f`嵌套了3次。所以，是在用嵌套的次数表示数。

## 加法，乘法和指数运算的推导过程

下面以`two`，`three`，`inc`和`0`来举例说明：

0
> 0 是一个常数，是一个可以和1进行`+`运算的参数。

inc
> inc 是一个过程，
>
> 输入：**一个**参数x，
> 
> 输出：另**一个**参数x+1。
>
> 0 可以作为 inc 的参数。

two
> two 是一个过程，
> 
>
> 
> 输出：另**一个**过程(lambda (f) (lambda (x) (f (f x))))，即把f嵌套2次的过程。

three
> three 是一个过程，
> 
> 输入：**一个**接受**一个**参数x的过程f，
> 
> 输出：另**一个**过程(lambda (f) (lambda (x) (f (f (f x)))))，即把f嵌套3次的过程。

(two inc)
> (two inc) 是一个过程，把 inc 嵌套2次的过程，
>


((two inc) 0)
> ((two inc) 0) 是一个常数，2，是0被inc了2次的结果，
>
> 即 (inc (inc 0)) = 2

(three inc)
> (three inc) 是一个过程，把 inc 嵌套3次的过程，
> 
> 输入：inc 过程，
>
> 输出：inc过程嵌套3次，即(lambda (x) (inc (inc (inc x))))

((three inc) 2)
> ((three inc) 2) 是一个常数，5，是2被inc了3次的结果，
>
> 即 (inc (inc (inc 2))) = 5

((three inc) 2) 等于 ((three inc) ((two inc) 0)) 吗？
> 等于，
>
> 因为 ((two inc) 0) = 2 呀

((three inc) ((two inc) 0))
> 5 
>
> 先嵌套2次inc，作用于0，得2；再嵌套3次inc，作用于2，得5
> 
> 这么巧， 2 + 3 = 5

那如何使用 five 表示 5 呢？
> ``
>(define five
>  (lambda (f)
>    (lambda (x) ((three f) ((two f) x)))))
> ```
> five 是一个过程
>
> 输入：**一个**接受**一个**参数x的过程f，
> 
> 输出：另**一个**过程(lambda (f) (lambda (x) ((three f) ((two f) x))))，即把f先嵌套2次，再嵌套3次的过程。

((five inc) 0)
> 5

可以展示加法运算了吗？
> 可以
> ```
> ;;; m+n
> (define (plus m n)
>   (lambda (f)
>     (lambda (x)
>       ((m f) ((n f) x)))))
> ```
> m+n，就是先前嵌套n次，再嵌套m次。

(three (two inc))
> (three (two inc)) 是一个过程，
> 
> 输入：一个过程，嵌套2次inc
>
> 输出：另一个过程，嵌套3次“嵌套2次inc”，也就是说，“嵌套2次inc”被执行了3次

((three (two inc)) 0)
> 6

会定义乘法了吗？
> ```
> ;;; m*n
> (define (mult m n)
>   (lambda (f)
>     (lambda (x)
>      ((m (n f)) x))))
> ```

(three two)
> (three two)是一个过程
> 
> 输入：**一个**接受**一个**参数x的过程f，
> 
> 输出：**一个**把f嵌套“嵌套3次“嵌套2次””次的过程，即
> ```
> (lambda (f)
>   (lambda (x)
>     ((two (two (two f))) x)))
> ```


((three two) inc)
> ((three two) inc)是一个过程
> 
> 输入：**一个**参数x
> 
> 输出：**一个**把inc嵌套“嵌套3次“嵌套2次””次的过程，即
> ```
>   (lambda (x)
>     ((two (two (two inc))) x))
> ```

(((three two) inc) 0)
> 8

会定义指数运算了吗？
> ```
> ;;; m^n
> (define (power m n)
>   (n m))
> ```

(((power two three) inc) 0)
> 8

(((five (three two)) inc) 0)
> (2^3)^5 = 32768

((((zero (five (three two))) inc) 0)
> ((2^3)^5)^0 = 1

## 总结
总结不出来