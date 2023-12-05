#lang racket

(define (reverse-tree bst)
  (if (null? bst)                            
      '()
      (let ((root (car bst))                 
            (left (cadr bst))
            (right (caddr bst)))
        (list root                           
              (reverse-tree right)           
              (reverse-tree left))))         
    )
