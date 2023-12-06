#lang racket

(define (time-to-minutes time)
  (let ((hour (car time))
        (minute (cadr time)))
    (+ (* (- hour 8) 60) minute)))

(define (coffee-shop times)
  (define (update-counters available-counters arrival-time)
    (foldl (lambda (counter acc)
             (if (> counter arrival-time)
                 (cons counter acc)
                 acc))
           '()
           available-counters))

  (define (helper times available-counters counter-count)
    (cond
      [(null? times) counter-count]
      [else
       (let* ((arrival-time (time-to-minutes (car times)))
              (new-available-counters (update-counters available-counters arrival-time))
              (new-counter-count (if (null? new-available-counters)
                                     (+ counter-count 1)
                                     counter-count))
              (updated-counters (cons (+ arrival-time 1) new-available-counters)))
         (helper (cdr times) updated-counters new-counter-count))]))
  (helper times '() 0))