#lang racket

(define (reverse-tree bst)
  (if (null? bst)                           
      '()
      (let ((root (car bst))                 
            (left (cadr bst))
            (right (caddr bst)))
        (cons root                           
              (cons (reverse-tree right)      
                    (cons (reverse-tree left) '())))))
)