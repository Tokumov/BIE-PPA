#lang racket

(define (time-translate time)
  (let ((hour (car time))
        (minute (cadr time)))
    (+ (* (- hour 8) 60) minute)))

(define (coffee-shop times)
  (define (helper times available-counters)
    (cond
      [(null? times) (length available-counters)]
      [else
       (let* ((arrival-time (time-translate (car times)))
              (new-available-counters (filter (lambda (t) (> arrival-time t)) available-counters))
              (counters-needed (if (null? new-available-counters)
                                   (cons (+ arrival-time 1) available-counters)
                                   (cons (+ arrival-time 1) new-available-counters))))
         (helper (cdr times) counters-needed))]))
  (helper times '())
  )