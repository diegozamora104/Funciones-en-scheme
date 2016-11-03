#lang scheme

(define group-by-type
  (lambda (paq)
    (let func((ls paq) (num '()) (str '()) (lista '()))
      (cond
        ((null? ls)
          (list (reverse num) (reverse str) (reverse lista)))
        ((number? (car ls))
          (func (cdr ls) (cons (car ls) num) str lista))
        ((string? (car ls))
          (func (cdr ls) num (cons (car ls) str) lista))
        ((list? (car ls))
          (func (cdr ls) num str (cons (car ls) lista)))))))

;(group-by-type '(1 "two" 3 '(1 2) 4 "five"))

         