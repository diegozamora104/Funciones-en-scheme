#lang scheme

(define (azar lista random_num cont)
  (if (equal? random_num cont)
      (car lista)
      (azar (cdr lista) random_num (+ cont 1))))

(define roulette
  (lambda (lista)
    (let ((ran_num 0))
      (lambda()
        (set! ran_num (random(length lista)))
        (azar lista ran_num 0)))))
    
;(define bingo (roulette '("par de patos" "trece" "cuatro")))