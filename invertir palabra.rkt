#lang scheme
(define cosa (lambda(frase )
  (let fx((word (string->list frase)) (invertido '()))
    (if (null? word) (list->string invertido)
        (fx  (cdr word) (cons (car word) invertido))
     )
   ) 
   )
  
  )