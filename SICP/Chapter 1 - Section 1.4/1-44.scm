;; Exercise 1.44.  
;; The idea of smoothing a function is an important concept in signal
;; processing. If f is a function and dx is some small number, then 
;; the smoothed version of f is the function whose value at a point x 
;; is the average of f(x - dx), f(x), and f(x + dx). Write a procedure
;; smooth that takes as input a procedure that computes f and returns 
;; a procedure that computes the smoothed f. It is sometimes valuable 
;; to repeatedly smooth a function (that is, smooth the smoothed function, 
;; and so on) to obtained the n-fold smoothed function. Show how to generate
;; the n-fold smoothed function of any given function using smooth and 
;; repeated from exercise 1.43. 

(define dx 0.00001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f x) (f (- x dx)) (f (+ x dx)))
       3)))
(define (n-fold f n)
  ((repeated smooth n) f))

(define (repeated f n)
    (define (helper g i)
      (if (= i n)
          g
          (helper (compose f g)  (+ i 1))))
    (helper f 1))
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square n)
  (* n n))

((n-fold square 2) 3)

