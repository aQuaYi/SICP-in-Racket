# SICP in Racket

![OS][os]
[![CODE][code]][racket-plugin]
![Racket][badge]

利用 Racket 来解答 SICP 习题。

在运行代码前，请先进行相关的[准备工作](Preparatory.md)

## `#lang sicp` 说明

在 `x.rkt` 文件中

```rkt
#lang sicp

(#%require (only racket provide))

;; provide 公开 x-func
(provide x-func)
(define (x-func a b)
  (....))
```

在 `y.rkt` 文件中

```rkt
#lang sicp

(#%require "x.rkt")

;; 可使用 `x-func` 过程。
(x-func 1 2)
```

## 目录

- [1.构造过程抽象](1)
  - [1.1 程序设计的基本元素](1/1.1) [示例代码](1/1.1/1.1.rkt) [1.1.7 牛顿法求平方根](1/1.1/newton-sqrt.rkt)
    - [练习 1.1](1/1.1/solution.1.01.rkt)
    - [练习 1.2](1/1.1/solution.1.02.rkt)
    - [练习 1.3](1/1.1/solution.1.03.rkt)
    - [练习 1.4](1/1.1/solution.1.04.rkt)
    - [练习 1.5](1/1.1/solution.1.05.rkt)
    - [练习 1.6](1/1.1/solution.1.06.rkt)
    - [练习 1.7](1/1.1/solution.1.07.rkt) 以及 [new good enough](1/1.1/solution.1.07.new-good-enough.rkt)
    - [练习 1.8](1/1.1/solution.1.08.rkt)
  - [1.2 过程与它们所产生的计算](1/1.2)
    - [练习 1.9](1/1.2/solution.1.09.rkt)
    - [练习 1.10](1/1.2/solution.1.10.rkt)
    - [斐波那契数列](1/1.2/1.2.fib.rkt)
    - [换零钱方式的统计](1/1.2/1.2.count-change.rkt)
    - 练习 1.11 [递归](1/1.2/solution.1.11.recursion.rkt) [迭代](1/1.2/solution.1.11.iteration.rkt)
    - [练习 1.12](1/1.2/solution.1.12.rkt)
    - 练习 1.13 (略)
    - [练习 1.14](1/1.2/solution.1.14.md)
    - [练习 1.15](1/1.2/solution.1.15.md)
    - [练习 1.16](1/1.2/solution.1.16.rkt)
    - [练习 1.17](1/1.2/solution.1.17.rkt)
    - [练习 1.18](1/1.2/solution.1.18.rkt)
    - [练习 1.19](1/1.2/solution.1.19.rkt) [说明](1/1.2/solution.1.19.md)
    - [练习 1.20](1/1.2/solution.1.20.md)
    - [练习 1.21](1/1.2/solution.1.21.rkt)
    - [练习 1.22](1/1.2/solution.1.22.rkt)
    - [练习 1.23](1/1.2/solution.1.23.rkt) 和 [说明](1/1.2/solution.1.23.md)
    - [练习 1.24](1/1.2/solution.1.24.rkt)
    - [练习 1.25](1/1.2/solution.1.25.rkt)
    - [练习 1.26](1/1.2/solution.1.26.md)
    - [练习 1.27](1/1.2/solution.1.27.rkt)
    - [练习 1.28](1/1.2/solution.1.28.rkt)
  - [1.3 用高阶函数做抽象](1/1.3)
    - [练习 1.29](1/1.3/solution.1.29.rkt)
    - [练习 1.30](1/1.3/solution.1.30.rkt)
    - 练习 1.31 [a)](1/1.3/solution.1.31.a.rkt) 和 [b)](1/1.3/solution.1.31.b.rkt)
    - 练习 1.32 [a)](1/1.3/solution.1.32.a.rkt) 和 [b)](1/1.3/solution.1.32.b.rkt)
    - [练习 1.33](1/1.3/solution.1.33.rkt)
    - [练习 1.34](1/1.3/solution.1.34.rkt)
    - [通过区间折半寻找方程的根](1/1.3/1.3.3.half-interval.rkt)
    - [不动点](1/1.3/1.3.3.fixed-point.rkt)
    - [练习 1.35](1/1.3/solution.1.35.rkt)
    - [练习 1.36](1/1.3/solution.1.36.rkt)
    - [练习 1.37](1/1.3/solution.1.37.rkt)
    - [练习 1.38](1/1.3/solution.1.38.rkt)
    - [练习 1.39](1/1.3/solution.1.39.rkt)
    - [练习 1.40](1/1.3/solution.1.40.rkt)
    - [练习 1.41](1/1.3/solution.1.41.rkt)
    - [练习 1.42](1/1.3/solution.1.42.rkt)
    - [练习 1.43](1/1.3/solution.1.43.rkt) :star:
    - [练习 1.44](1/1.3/solution.1.44.rkt)
    - [练习 1.45](1/1.3/solution.1.45.rkt) :star:
    - [练习 1.46](1/1.3/solution.1.46.rkt) :star:
- [2.构造数据现象](2)
  - [2.1 数据抽象导引](2/2.11)
    - [有理数的算术运算](2/2.1/rat.rkt)
    - [练习 2.1](2/2.1/solution.2.01.rkt)
    - [练习 2.2](2/2.1/solution.2.02.rkt)
- [3.模块化、对象和状态](3)
- [4.元语言抽象](4)
- [5.寄存器机器里的计算](5)

----
[os]: https://img.shields.io/badge/Ubuntu-18.04-df5829.svg?logo=ubuntu
[code]: https://img.shields.io/badge/Code-Racket-blue.svg?logoColor=blue&logo=visual-studio-code
[racket-plugin]: https://marketplace.visualstudio.com/items?itemName=karyfoundation.racket
[badge]: https://img.shields.io/badge/Racket-7.3-blue.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBB%0D%0AZG9iZSBJbGx1c3RyYXRvciAxNS4xLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9u%0D%0AOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBT%0D%0AVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzEx%0D%0ALmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9ImNpcmNsZV9waWVjZXMiIHhtbG5zPSJodHRw%0D%0AOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5%0D%0AOTkveGxpbmsiIHg9IjBweCINCgkgeT0iMHB4IiB3aWR0aD0iNTExLjg3NXB4IiBoZWlnaHQ9IjUx%0D%0AMS44MjRweCIgdmlld0JveD0iMCAwIDUxMS44NzUgNTExLjgyNCIgZW5hYmxlLWJhY2tncm91bmQ9%0D%0AIm5ldyAwIDAgNTExLjg3NSA1MTEuODI0Ig0KCSB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxjaXJj%0D%0AbGUgaWQ9ImNpcmNsZSIgZmlsbD0iI0ZGRkZGRiIgY3g9IjI1Ni4yNTIiIGN5PSIyNTUuOTg2IiBy%0D%0APSIyNTMuMDkzIi8+DQo8cGF0aCBpZD0iYmx1ZS1waWVjZSIgZmlsbD0iIzNFNUJBOSIgZD0iTTQ1%0D%0ANS4zOTgsNDEyLjE5N2MzMy43OTItNDMuMDIxLDUzLjk0Ni05Ny4yNjIsNTMuOTQ2LTE1Ni4yMTEN%0D%0ACgljMC0xMzkuNzc5LTExMy4zMTMtMjUzLjA5My0yNTMuMDkzLTI1My4wOTNjLTMwLjQwNiwwLTU5%0D%0ALjU1OCw1LjM2Ny04Ni41NjYsMTUuMTk3QzI3Mi40MzUsNzEuOTg5LDQwOC4zNDksMjQ3LjgzOSw0%0D%0ANTUuMzk4LDQxMi4xOTd6DQoJIi8+DQo8cGF0aCBpZD0ibGVmdC1yZWQtcGllY2UiIGZpbGw9IiM5%0D%0ARjFEMjAiIGQ9Ik0yMjAuMDAzLDE2NC4zMzdjLTM5LjQ4MS00Mi41MzMtODMuNjk1LTc2LjMxMi0x%0D%0AMzAuNTIzLTk4LjcxNQ0KCUMzNi41NzMsMTEyLjAxMSwzLjE1OSwxODAuMDkyLDMuMTU5LDI1NS45%0D%0AODZjMCw2My44MTQsMjMuNjI2LDEyMi4xMDQsNjIuNTk3LDE2Ni42MjMNCglDMTAwLjExMSwzMTku%0D%0AMzkyLDE2NC42OTcsMjE5LjkwNywyMjAuMDAzLDE2NC4zMzd6Ii8+DQo8cGF0aCBpZD0iYm90dG9t%0D%0ALXJlZC1waWVjZSIgZmlsbD0iIzlGMUQyMCIgZD0iTTI2Ni42MzgsMjIxLjcyN2MtNTQuNzkyLDU5%0D%0ALjA1MS0xMDkuMzkyLDE2Mi40MjItMTI5LjE1MiwyNTcuNzk0DQoJYzM1LjQxOSwxOC44NTcsNzUu%0D%0AODQsMjkuNTU5LDExOC43NjYsMjkuNTU5YzQ0LjEzMiwwLDg1LjYxOC0xMS4zMDYsMTIxLjc0LTMx%0D%0ALjE2M0MzNTcuMTcxLDM4MS43MTIsMzE3Ljg2OCwyOTMuNjA0LDI2Ni42MzgsMjIxLjcyNw0KCXoi%0D%0ALz4NCjwvc3ZnPg0K
