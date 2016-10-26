;#lang racket ;preguntar esto!

(define (group-by-type paq)
  (let func((ls paq) (num '()) (str '()) (lista '()))
    (cond
      ((null? ls) (list num str lista))
      ((number? (car ls)) (func (cdr ls) (cons (car ls) num) str lista))
      ((string? (car ls)) (func (cdr ls) num (cons (car ls) str) lista))
      ((list? (car ls)) (func (cdr ls) num str (cons (car ls) lista)))
    )
  )
  )



         