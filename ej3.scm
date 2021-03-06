#lang scheme

(define (largo ls)
    (if (null? ls) 0
        (+ 1 (largo (cdr ls)))
        )
    )

(define (azar lista random_num cont)
  (if (= random_num cont) (car lista)
      (azar (cdr lista) random_num (+ cont 1))
      )
  )

(define (roulette lista)
  (let ((ran_num 0))
    (lambda()
      (set! ran_num (random(largo lista)))
      (azar lista ran_num 0)
      )
    )
  )
    
;(define bingo (roulette '("par de patos" "trece" "cuatro")))