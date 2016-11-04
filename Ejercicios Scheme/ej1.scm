#lang scheme

(define group-by-type
  (lambda (lista)
    (let func((ls lista) (num '()) (str '()) (lista '()))
      (cond
        ((null? ls);terminar recursion
          (list (reverse num) (reverse str) (reverse lista)))
        ((number? (car ls))
          (func (cdr ls) (cons (car ls) num) str lista))
        ((string? (car ls))
          (func (cdr ls) num (cons (car ls) str) lista))
        ((list? (car ls))
          (func (cdr ls) num str (cons (car ls) lista)))))))
<<<<<<< HEAD
=======
         
>>>>>>> 50db3048db4527a408b9d3a2ff5230d139f7f8ca
