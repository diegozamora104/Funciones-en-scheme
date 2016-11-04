#lang scheme

(define F ;FUNCION PRINCIPAL
  (lambda (n x f L m g A)
    (let func ((i 0) (num 1))
      (if(equal? i n)
         num
         (func (+ i 2) (* (- (f (potencia x i))
                             (sumatoria i L m g (determinante A -1))) num))))))
        
(define sumatoria
  (lambda (i L m g A)
    (cond
      ((null? L) 0)
      ((< (car L) m)
       (+ (* (g (/ i (car L))) (potencia A (car L)))
          (sumatoria i (cdr L) m g A)))
      (else
       (sumatoria i (cdr L) m g A)))))

(define potencia
  (lambda (x y)
    (cond
      ((equal? y 0) 1)
      ((equal? y 1) x)
      (else 
       (* x (potencia x (- y 1)))))))
;
; De aqui en adelante son las funciones que se
;encargan de calcular el determinante  de grado n
;
(define determinante ;Funcion principal del determinante
  (lambda (mx i)
    (cond
      ((equal? 2 (length mx))
       (- (* (caar mx) (cadadr mx)) (* (cadar mx) (caadr mx))));sarrus 2x2
      ((> (abs i) (length mx)) 0)
      (else
       (+ (* (iterador (car mx)(abs i))
             (determinante (reducirMatriz (cdr mx) '() i) -1)
             (* (/ (abs i) i) -1))
          (determinante mx (if (< i 0)(+ (abs i) 1)(-(+ i 1)))))))))
  
(define reducirMatriz; Elimina la i-esima columna
  (lambda (mx lsMx i)
    (if (null? mx)
        (invertirMatriz lsMx '())
        (let fila((col (car mx))(lsCol '())(j 1))
          (cond ((null? col) (reducirMatriz (cdr mx)(cons lsCol lsMx) i))
                ((equal? j (abs i))(fila (cdr col) lsCol(+ j 1)))
                (else
                 (fila (cdr col) (cons (car col) lsCol) (+ j 1))))))))

                    
(define invertirMatriz;reducirMatriz entrega una matriz al revés,
  (lambda (matriz final)    ;esta función la endereza
    (if (null? matriz)
        final
        (let invertir((ls (car matriz)) (temp '()))
          (if (null? ls)
              (invertirMatriz (cdr matriz) (cons temp final))
              (invertir (cdr ls) (cons (car ls) temp)))))))

(define iterador; Retorna el i-esimo numero de la lista
  (lambda (ls i)
    (cond
      ((equal? i 1) (car ls))
      ((iterador (cdr ls) (- i 1))))))

