#lang racket

(define branch
  (lambda (tree fn final)
    (if (not(equal? '() (cadr tree)));Izquierda
        (branch (cadr tree) fn final))
    (if (not(equal? '() (caddr tree)));Derecha
        (branch (caddr tree) fn tree))
    (cons (fn (car final) (car tree))
    (cons (cons (fn (cadr final) (cadr tree)) '(()()))
    (list (cons (fn (caddr final) (caddr tree)) '(()()) ))))


    ))

;Siempre es asi?: '(1 (2 ()() ) (3 ()()) )
;o puede estar asi?: '(1 (2) (3))
    



    