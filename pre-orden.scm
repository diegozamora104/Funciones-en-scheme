#lang racket

(define (izq arbol)
  (cadr arbol))

(define (drch arbol)
  (caddr arbol))

(define (pre-orden arbol1 arbol2)
  (cons
   (if (not(pair? arbol1)) 0
       (+ (car arbol1) (car arbol2)))
   (if (not(pair? arbol1)) '()
       (append (list (+ (car(pre-orden (izq arbol1) arbol2)) (car(pre-orden arbol1 (izq arbol2))))) 
               (list (+ (car(pre-orden (drch arbol1) arbol2)) (car(pre-orden arbol1 (drch arbol2)))))
               ))))

;(pre-orden '(1(2()())(3()())) '(1(2()())(3()())) )