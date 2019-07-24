#lang sicp

(#%require (only racket provide))

(#%require 2htdp/image)
(#%require lang/posn)
(#%require racket/base)
(#%require (only sicp-pict
                 flip-vert
                 flip-horiz
                 below))

(define *current-image* empty-image)

(define (*new-image* new-frame)
  (define (xy->posn x y)
    (let ((v ((frame-coord-map new-frame) (make-vect x y))))
      (make-posn (xcor-vect v) (ycor-vect v))))
  (set! *current-image*
        (polygon
         (list
          (xy->posn 0 0)
          (xy->posn 0 1)
          (xy->posn 1 1)
          (xy->posn 1 0))
         "solid"
         "white")))

(define (draw-line start end)
    (set! *current-image*
        (add-line
         *current-image*
         (xcor-vect start)
         (ycor-vect start)
         (xcor-vect end)
         (ycor-vect end)
         "black")))

(define (paint-in-frame painter frame)
    (*new-image* frame)
    (painter frame)
    *current-image*)

(define (paint painter)
    (paint-in-frame
        painter
        (make-frame
            (make-vect 0 150)
            (make-vect 150 0)
            (make-vect 0 -150))))

;;

(provide flipped-pairs)
(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(provide right-split)
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(provide up-split)
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(provide corner-split)
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(provide square-limit)
(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

;; frame

(provide make-frame)
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(provide origin-frame)
(define (origin-frame f)
  (car f))

(provide edge1-frame)
(define (edge1-frame f)
  (cadr f))

(provide edge2-frame)
(define (edge2-frame f)
  (cdr (cdr f)))

(provide make-vect)
(define (make-vect x y)
  (cons x y))

(provide xcor-vect)
(define (xcor-vect v)
  (car v))

(provide ycor-vect)
(define (ycor-vect v)
  (cdr v))

(provide add-vect)
(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(provide sub-vect)
(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(provide scale-vect)
(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(provide frame-coord-map)
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(provide make-segment)
(define (make-segment start-vect end-vect)
  (cons start-vect end-vect))

(provide start-segment)
(define (start-segment s)
  (car s))

(provide end-segment)
(define (end-segment s)
  (cdr s))

(provide segments->painter)
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))
