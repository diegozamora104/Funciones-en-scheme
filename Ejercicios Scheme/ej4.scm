#lang scheme

(define operate-bintrees
  (lambda (lsarboles funcion)
    (let func ((base (car lsarboles))(arbol (cdr lsarboles))(op funcion))
      (if (null? arbol)
          base
        (func (nav (car arbol) base op) (cdr arbol) op )))))

(define nav
  (lambda (tree final fn)
    (cons (fn (car final) (car tree))
      (append
       (if (null? (cadr tree))
           (list '());Left
           (list (nav (cadr tree) (cadr final) fn)))
       (if (null? (caddr tree))
           (list '());Right
           (list (nav (caddr tree) (caddr final) fn)))))))
      
;(define trees '((1 (2 () ()) (3 () ())) (1 (1 () ()) (1 () ())) (7 (8() ()) (9 () ()))))
;(operate-bintrees trees +)