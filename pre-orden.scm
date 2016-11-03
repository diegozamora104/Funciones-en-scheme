#lang racket

(define (izq arbol)
  (cadr arbol))

(define (drch arbol)
  (caddr arbol))

(define (pre-orden2 arbol1 arbol2)
  (cons
   (if (not(pair? arbol1)) 0
       (+ (car arbol1) (car arbol2)))
   (if (not(pair? arbol1)) '()
       (append (list (+ (car(pre-orden2 (izq arbol1) arbol2)) (car(pre-orden2 arbol1 (izq arbol2))))) 
               (list (+ (car(pre-orden2 (drch arbol1) arbol2)) (car(pre-orden2 arbol1 (drch arbol2)))))
               ))))

(define (pre-orden arbol)
  (cons
   (if (not(pair? arbol)) '()
       (car arbol))
   (if (not(pair? arbol)) '()
       (append (pre-orden (izq arbol)) (pre-orden (drch arbol))))))

;(pre-orden '(1(2()())(3()())) '(1(2()())(3()())) )