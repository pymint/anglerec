(prompt "\nAutoLISP rr lisp file loaded.")
(princ) ; Suppress the return value of the prompt function
;(alert "\nAutoLISP Test lisp file loaded.")


(defun c:anglerec ()  

  (setq p1(getpoint "\n Pick first corner and direction: "))
  (setq p11(getpoint p1 "\n"))
  (setq a2 (angle (trans p1 1 0) (trans p11 1 0)))

  (setq p3(getpoint "\n Pick opposite corner: "))
  (setq a1 (angle (trans p1 1 0) (trans p3 1 0)))

  (setq a11 (* 180 (/ a1 pi)))
  (setq a22 (* 180 (/ a2 pi)))

  (setq a (abs (- a11 a22)))
  (setq x (distance p1 p3))

  (setq t (sin (* pi (/ (- 90 a) 180))))

  (setq z (* x t))

  (setq p2 (polar p1 a2 z))

  (setq y (distance p2 p3))

  (setq a33 (+ 180 a22))
  (setq a3 (/ (* a33 pi) 180))
  (setq p4 (polar p3 a3 z))
  (command "pline" p1 p2 p3 p4 "_c")
  (princ)
)
