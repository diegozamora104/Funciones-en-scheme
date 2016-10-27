#lang scheme

(define (reverse lista)
  (let func ((temp lista) (empty_list '()))
  (if (null? temp) (list->string empty_list)
      (func (cdr temp) (cons (car temp) empty_list))
        )
    )
  )

(define (aux pbra dic)
  (if(null? dic) pbra 
  (if(equal? pbra (caar dic)) (cadar dic)
     (aux pbra (cdr dic))
     )
  )
)

(define (analizador lista dic)
  (let func((temp lista) (texto '()))
    (cond 
    ((null? temp) (append texto))
    ((aux (car temp) dic) (func (cdr temp) (cons (aux (car temp) dic) texto))) 
    )
  )
)

(define (append lista)
        (let app ((empty (car lista)) (ls (cdr lista)))
          (if (null? ls)
              (string-append empty ".")
              (app (string-append empty " " (car ls)) (cdr ls))
            )
        )
  )
  
(define (final-boss frase dic)
  (let func ((word (string->list frase)) (invertido '()) (palabras '()))
    (cond
      ((equal? (car word) #\.) (analizador (cons (reverse invertido) palabras) dic))
      ((equal? (car word) #\space) (func (cdr word) '() (cons (reverse invertido) palabras)))
      (else
       (func (cdr word) (cons (car word) invertido) palabras ))
    )
   ) 
  )

;(final-boss "Hoy mama y papa fueron de viaje, llevaron a hijo pero hija se quedo en casa." '(("papa" "Bob") ("hijo" "Carl") ("hija" "Diana") ("mama" "Alice")))