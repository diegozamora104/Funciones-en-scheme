#lang scheme

(define (F n x f L m g A)
  (let func ((i 0) (num 1))
    (if(equal? i n) num
       (func (+ i 2) (* (- (f (potencia x i)) (sumatoria i L m g A)) num))
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
  (cond
    ((equal? y 0) 1)
    ((equal? y 1) x)
    (else 
      (* x (potencia x (- y 1)))
      )
    )
  )

;(F 6 2 (lambda (x) (+ x x)) '(1 4 6 2 3) 3 (lambda (x) (* x 2)) -2)