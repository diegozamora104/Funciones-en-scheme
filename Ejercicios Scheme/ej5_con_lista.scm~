#lang racket

;(define F
;  (lambda (n x f L m g A)
;          (productoria 0 n x f L m g A)))

;(define (productoria i n x f L m g A )
;  (if (< i n) (* (productoria (+ i 2) n x f L m g A)  (- (f (potencia x i)) (sumatoria i L m g A)))
;      1)
;  )

(define (F n x f L m g A)
  (let func ((i 0) (num '()))
    (if(equal? i n) num
       (func (+ i 2) (cons (- (f (potencia x i)) (sumatoria i L m g A)) num))
       )
    )
  )
        
(define (sumatoria i L m g A)
  (cond
  ((null? L) 0)
  ((< (car L) m)(+ (* (g (/ i (car L))) (potencia A (car L)))
        (sumatoria i (cdr L) m g A)))
  (else (sumatoria i (cdr L) m g A))))

(define (potencia x y)
  (if (= y 1)
      x
      (* x (potencia x (- y 1)))))

(define (prod ls)
  (if (null? ls) 1
      (* (car ls) (prod (cdr ls)))
      )
  )

;(F 6 2 (lambda (x) (+ x x)) '(1 4 6 2 3) 3 (lambda (x) (* x 2)) -2)