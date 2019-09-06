#lang sicp

(define (make-serializer)
  (let ([mutex (make-mutex)])
    (lambda (p)
      (define (serialized-p . args)
        (mutex 'acquire)
        (let ([val (apply p args)])
          (mutex 'release)
          val))
      serialized-p)))

(define (make-mutex)
  (let ([cell (list false)])
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire))) ;retry
            ((eq? m 'release) (clear! cell))))
    the-mutex))

(define (clear! cell)
  (set-car! cell false))

(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))

;;;

(define (make-n-loop n)
  (define (make-loop)
    (let ([loop (list false)])
      (set-cdr! loop loop)
      loop))
  (define (extend loop)
    (let ([cell (cons false (cdr loop))])
      (set-cdr! loop cell)
      loop))
  (define (iter loop n)
    (if (= n 0)
        loop
        (iter (extend loop) (- n 1))))
  (iter (make-loop) (- n 1)))

(define (make-n-mutex n)
  (let ([loop (make-n-loop n)]
        [protected (make-serializer)])
    (define (acquire loop)
      (if (test-and-set! loop)
          (begin (display "try next -> ")
                 (acquire (cdr loop)))
          (begin (display "locked")
                 (newline))))
    (define (release loop)
      (if (car loop)
          (set-car! loop false)
          (release (cdr loop))))
    (define (the-n-mutex m)
      (cond ((eq? m 'acquire)
             (acquire loop))
            ((eq? m 'release)
             ((protected release) loop)))) ;;; serialize release
    the-n-mutex))

(define n-mutex (make-n-mutex 2))

(n-mutex 'acquire)

(n-mutex 'acquire)

; (n-mutex 'acquire) ;;; 取消本行注释，再运行本程序，程序会因为无法获取锁，而无限循环下去