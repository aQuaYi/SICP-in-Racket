#lang sicp

(#%require "deriv.rkt")

(deriv '(** x 8) 'x)

(deriv '(** x 1) 'x)

(deriv '(** x 0) 'x)