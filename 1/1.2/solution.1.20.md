# 练习 1.20

从下方的计算过程可知，

- 在`正则序`中，`reminder`共计算了 `18` 次。
- 在`应用序`中，`reminder`只计算了 `4` 次。

## 正则序

按照先展开再计算的方式

```text
  (gcd 206 40)
= (if (= 40 0)
      206
      (gcd 40 (remainder 206 40)))
= (if #f
      206
      (gcd 40 (remainder 206 40)))
= (gcd 40 (remainder 206 40))
= (if (= (remainder 206 40) 0)
      40
     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
= (if (= `6` 0)   ;; 1
      40
      (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
= (if #f
      40
      (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
= (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
= (if (= (remainder 40 (remainder 206 40)) 0)
      (remainder 206 40)
      (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
= (if (= (remainder 40 `6`) 0)   ;; 2
      (remainder 206 40)
      (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
= (if (= `4` 0)   ;; 3
      (remainder 206 40)
      (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
= (if #f
      (remainder 206 40)
      (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
= (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
= (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
      (remainder 40 (remainder 206 40))
      (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
= (if (= (remainder `6` (remainder 40 (remainder 206 40))) 0)   ;; 4
      (remainder 40 (remainder 206 40))
      (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
= (if (= (remainder 6 (remainder 40 `6`)) 0)   ;; 5
      (remainder 40 (remainder 206 40))
      (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
= (if (= (remainder 6 `4`) 0)   ;; 6
      (remainder 40 (remainder 206 40))
      (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
= (if (= `2` 0)   ;; 7
      (remainder 40 (remainder 206 40))
      (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
= (if #f
      (remainder 40 (remainder 206 40))
      (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
= (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
= (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if (= (remainder (remainder 40 `6`) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)   ;; 8
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if (= (remainder `4` (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)   ;; 9
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if (= (remainder 4 (remainder `6` (remainder 40 (remainder 206 40)))) 0)   ;; 10
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if (= (remainder 4 (remainder 6 (remainder 40 `6`))) 0)   ;; 11
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if (= (remainder 4 (remainder 6 `4`)) 0)   ;; 12
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if (= (remainder 4 `2`) 0)   ;; 13
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if (= `0` 0)   ;; 14
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (if #t
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
= (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
= (remainder `6` (remainder 40 (remainder 206 40)))   ;; 15
= (remainder 6 (remainder 40 `6`))   ;; 16
= (remainder 6 `4`)   ;; 17
= `2`   ;; 18
```

## 应用序

先计算再展开

```text
  (gcd 206 40)
= (if (= 40 0)
      206
      (gcd 40 (remainder 206 40)))
= (if #f
      206
      (gcd 40 (remainder 206 40)))
= (gcd 40 (remainder 206 40)))
= (gcd 40 `6`))   ;; 1
= (if (= 6 0)
      40
      (gcd 6 (remainder 40 6)))
= (if #f
      40
      (gcd 6 (remainder 40 6)))
= (gcd 6 (remainder 40 6)))
= (gcd 6 `4`))   ;; 2
= (if (= 4 0)
      6
      (gcd 4 (remainder 6 4)))
= (if #f
      6
      (gcd 4 (remainder 6 4)))
= (gcd 4 (remainder 6 4)))
= (gcd 4 `2`))   ;; 3
= (if (= 2 0)
      4
      (gcd 2 (remainder 4 2)))
= (if #f
      4
      (gcd 2 (remainder 4 2)))
= (gcd 2 (remainder 4 2)))
= (gcd 2 `0`))   ;; 4
= (if (= 0 0)
      2
      gcd 2 (remainder 2 0))
= (if #t
      2
      gcd 2 (remainder 2 0))
= 2
```
