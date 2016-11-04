#lang scheme

(define operate-bintrees; Funcion principal
  (lambda (lstree funcion)
    (let func ((base (car lstree))(arbol (cdr lstree))(op funcion))
      (if (null? arbol);(func) : entrega dos arboles a la funcion nav 
          base
        (func (nav (car arbol) base op) (cdr arbol) op )))))

(define nav; navega simultáneamente a través de dos arboles binarios 
  (lambda (tree final fn)
    (cons
      (fn (car tree) (car final));
      (append
       (if (null? (cadr tree))
           (list '());Left
           (list (nav (cadr tree) (cadr final) fn)))
       (if (null? (caddr tree))
           (list '());Right
           (list (nav (caddr tree) (caddr final) fn)))))))
      
