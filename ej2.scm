#lang racket

(define (reversa lista)
  (let func ((ls lista) (empty '()))
    (if (null? ls) empty
        (func (cdr ls) (cons (car ls) empty))
      )
    )
  )           

(define (selectivemap ls fun ls_pos)
  (let func ((lista ls) (fn fun) (lista_pos ls_pos) (n 1) (lista_vacia '()))    
    (cond
      ((null? lista) (reversa lista_vacia))
      ((null? lista_pos) (func (cdr lista) fn lista_pos (+ n 1) (cons (car lista) lista_vacia)))
      ((equal? n (car lista_pos)) (func (cdr lista) fn (cdr lista_pos) (+ n 1) (cons (fn (car lista)) lista_vacia)))
      (else
       (func (cdr lista) fn lista_pos (+ n 1) (cons (car lista) lista_vacia)))
      )
    )
  )

;(selectivemap '(1 2 3 4 5) (lambda(x)(+ x x)) '(2 3))