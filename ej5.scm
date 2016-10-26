(define F
  (lambda (n x f L m g A)
          (productoria 0 n x f L m g A)))

(define (productoria i n x f L m g A )
  (if (< i n)
      (* (productoria (+ i 2) n x f L m g A)
         (- (f (potencia x i)) (sumatoria ...)))
      1))

(define (sumatoria L m g))

(define (potencia x y)
  (if (= y 1)
      x
      (* x (potencia x (- y 1)))))