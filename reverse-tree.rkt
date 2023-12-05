(define (reverse-tree bst)
  (cond
    ((null? bst) '())
    (else
     (list (car bst)            
           (reverse-tree (caddr bst))
           (reverse-tree (cadr bst)))))
  )