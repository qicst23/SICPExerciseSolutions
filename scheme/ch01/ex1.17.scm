#lang scheme 
(require (planet schematics/schemeunit:3))

(define (double n) (* n 2))
(define (halve n)  (/ n 2))
(define (mult a n)
  (define (mult2 b m)
    (cond ((= m 0) 0)
          ((even? m) (mult2 (double b) (halve m)))
          (else (+ b (mult2 b (- m 1))))))
  (mult2 a n))
        
(check-equal? (mult 2 0)  0)
(check-equal? (mult 2 1)  2)
(check-equal? (mult 2 2)  4)
(check-equal? (mult 2 3)  6)
(check-equal? (mult 2 4)  8)
(check-equal? (mult 2 5) 10)
(check-equal? (mult 2 6) 12)
(check-equal? (mult 2 7) 14)