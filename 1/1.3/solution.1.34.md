# 习题解答 1.34

Dr.Racket 给出的答案是
> application: not a procedure;
> expected a procedure that can be applied to arguments
> given: 2
> arguments...:

由于f的定义是
```racket
(define (f g)
    (g 2))
```
那么，`(f f)`的运算过程是

```racket
(f f) 
↓
(f 2) ;;这里的f，是(f f)中的第二个f
↓
(2 2) ;;第一个2，是(f 2)中的2
```
由于，(2 2)中，第一个2不是一个过程，无法使用第二个2，所以，Dr.Racket 说，`not a procedure`