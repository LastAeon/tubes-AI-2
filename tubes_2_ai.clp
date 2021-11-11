(deffunction MAIN::kanker ())

(deffunction MAIN::tidak-kanker ())

(deffunction MAIN::kanker
   ()
   =>
   (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf))

(deffunction MAIN::tidak-kanker
   ()
   =>
   (printout t "Hasil Prediksi = Terprediksi Tidak Kanker Payudara" crlf))

(defrule MAIN::read-concave-point
   =>
   (printout t "mean_concave_point: ")
   (assert (mean_concave_point (read))))

(defrule MAIN::read-worst-perimeter
   (mean_concave_point ?m)
   (test (> ?m 0.05))
   =>
   (printout t "worst_perimeter: ")
   (assert (worst_perimeter (read))))

(defrule MAIN::hasil-worst-perimeter
   (worst_perimeter ?w)
   (test (> ?w 114.45))
   =>
   (tidak-kanker))

(defrule MAIN::read-worst-texture
   (worst_perimeter ?w)
   (test (<= ?w 114.45))
   =>
   (printout t "worst_texture: ")
   (assert (worst_texture (read))))

(defrule MAIN::read-perimeter-error
   (worst_texture ?w)
   (test (> ?w 25.65))
   =>
   (printout t "perimeter_error: ")
   (assert (perimeter_error (read))))

(defrule MAIN::hasil-perimeter-error
   (perimeter_error ?p)
   (test (> ?p 1.56))
   =>
   (tidak-kanker))

(defrule MAIN::read-mean-radius
   (perimeter_error ?p)
   (test (<= ?p 1.56))
   =>
   (printout t "mean_radius: ")
   (assert (mean_radius (read))))

(defrule MAIN::hasil1-mean-radius
   (mean_radius ?m)
   (test (<= ?m 13.34))
   =>
   (tidak-kanker))

(defrule MAIN::hasil2-mean-radius
   (mean_radius ?m)
   (test (> ?m 13.34))
   =>
   (kanker))

(defrule MAIN::read-worst-concave-points
   (worst_texture ?w)
   (test (<= ?w 25.65))
   =>
   (printout t "worst_concave_points: ")
   (assert (worst_concave_points (read))))

(defrule MAIN::hasil1-worst-concave-points
   (worst_concave_points ?w)
   (test (<= ?w 0.17))
   =>
   (kanker))

(defrule MAIN::hasil2-worst-concave-points
   (worst_concave_points ?w)
   (test (> ?w 0.17))
   =>
   (tidak-kanker))

