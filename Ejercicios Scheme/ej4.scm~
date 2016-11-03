#lang racket

(define bintree
  (lambda (lsTrees funcion)
    
    (let foo((trees (cdr lsTrees))(fn funcion)(finalTree (car lsTrees)))
      (cond
        ((null? trees) finalTree)
        ((trees #t)(navegar (car trees)(caadr trees)(caaddr trees)(car finalTree)(caadr finalTree)(caaddr finalTree) fn)) ))))


(define nav
  (lambda (tree final fn)
    (cons
      (fn (car tree) (car final))
      (append
      (if (null? (cadr tree)) (list '());Left
          (list (nav (cadr tree) (cadr final) fn)))
      (if (null? (caddr tree)) (list '());Right
          (list (nav (caddr tree) (caddr final) fn)))))
    ))
      

;(define uno'(1(2()())(3()())))
;(define dos'(10(20()())(30()())))