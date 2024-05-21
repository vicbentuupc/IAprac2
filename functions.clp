(deffunction MAIN::simple_question (?question $?values)
    (progn$
        (?var ?values)
        (lowcase ?var)
    )
    (printout t ?question crlf)
    (printout t "Introduce alguno de estos valores: " (implode$ ?values) crlf)
    (bind ?answer (read))
    (while (not (member$ (lowcase ?answer) ?values)) do
        (printout t "Valor no válido, prueba otra vez." crlf)
        (bind ?answer (read))
    )
    (printout t crlf)
    ?answer
)


(deffunction MAIN::general_question (?question)
    (printout t ?question crlf)
    (bind ?answer (read))
    (printout t crlf)
    ?answer
)

(deffunction MAIN::numeric_question (?question ?rangeini ?rangeend)
    (printout t ?question crlf)
    (printout t "Introduce un numero entre: [" ?rangeini ", " ?rangeend"]" crlf)
    (bind ?answer (read))
    (while (or (not (integerp ?answer)) (not(and(>= ?answer ?rangeini)(<= ?answer ?rangeend)))) do
        (printout t "Valor no válido, prueba otra vez." crlf)
        (bind ?answer (read))
    )
    (printout t crlf)
    ?answer
)

(deffunction MAIN::yes_or_no_question (?question)
    (bind ?answer (simple_question ?question si no))
    (if (eq (lowcase ?answer) si)
        then TRUE
        else FALSE
    )
)

(deffunction MAIN::multiple_question  (?question $?values)
    (progn$
        (?var ?values)
        (lowcase ?var)
    )
    (printout t ?question crlf)
    (printout t "Introduce tantos como quieras de los siguientes valores, separados por espacio en una sola línea:" crlf (implode$ ?values) crlf)
    (bind ?answer (readline))
    (bind ?res (explode$ ?answer))
    (bind ?invalidValue FALSE)
    (progn$ (?value ?res)
            (printout t "---------" crlf)
            (printout t ?value crlf)
            (printout t ?values crlf)
            (if (not(member$ ?value ?values))
                then (bind ?invalidValue TRUE)
            )
    )
    (while ?invalidValue do
        (bind ?invalidValue FALSE)
        (printout t "Algun valor no es valido, prueba otra vez." crlf)
        (bind ?answer (readline))
        (bind ?res (explode$ ?answer))
        (progn$ (?value ?res)
            (printout t "---------" crlf)
            (printout t ?value crlf)
            (printout t ?values crlf)
            (if (not(member$ ?value ?values))
                then (bind ?invalidValue TRUE)
            )
        )
    )
    (printout t crlf)
    ?res
)

(deffunction MAIN::tienen_elemento_en_comun (?list1 ?list2) ;;list1 son simbolos, list2 son strings
    (bind ?found FALSE)
    (foreach ?elem1 ?list1
        (bind ?el (str-cat ?elem1))  ;; Convertir el símbolo a string
        (if (member$ ?el ?list2) then
        (bind ?found TRUE)
        (break)
        )
    )
    ?found
)












;;; Define a function to sort a list of Ejercicio instances by puntuacion in decreasing order
; (deffunction MAIN::sort-ejercicios-by-puntuacion-decreasing ()
;   (bind ?all-ejercicios (find-all-facts ((?e Ejercicio)) TRUE))
;   (return (sort-by-slot-decreasing ?all-ejercicios puntuacion)))

; ;;; Define a function to get the value of a slot from a fact
; (deffunction fact-slot (?fact ?slot-name)
;    (fact-slot-value ?fact ?slot-name))

; ;;; Define a helper function to sort a list of facts by a slot in decreasing order
; (deffunction MAIN::sort-by-slot-decreasing (?fact-list ?slot-name)
;   (return (sort ?fact-list
;                 (bind ?x (fact-slot ?x ?slot-name))
;                 (bind ?y (fact-slot ?y ?slot-name))
;                 (return (> ?x ?y)))))

; (deffunction sort-by-slot-decreasing (?fact-list ?slot-name)
;   (if (eq ?fact-list nil) then
;     (return nil))
;   (bind ?sorted-list (list (nth$ 1 ?fact-list)))
;   (bind ?fact-list (rest$ ?fact-list))
;   (while (neq ?fact-list nil) do
;     (bind ?inserted FALSE)
;     (bind ?current (nth$ 1 ?fact-list))
;     (bind ?fact-list (rest$ ?fact-list))
;     (foreach ?item ?sorted-list
;       (if (not ?inserted)
;         (if (> (fact-slot ?current ?slot-name) (fact-slot ?item ?slot-name)) then
;           (bind ?sorted-list (insert$ ?current ?sorted-list (member$ ?item ?sorted-list)))
;           (bind ?inserted TRUE))))
;     (if (not ?inserted)
;       (bind ?sorted-list (create$ ?sorted-list ?current))))
;   (return ?sorted-list))


; (defrule sort 
;     (data $?X ?a ?b $?Y)
;     (test (< ?b ?a))
; =>
;     (assert (data $?X ?b ?a $?Y)))

; (defrule run-sort
;     (data $?X)
;     =>
;     (while (bind ?sorted FALSE)
;         (bind ?sorted TRUE)
;         (foreach ?i $?X
;             (foreach ?j $?X
;                 (if (< (puntuacion ?j) (puntuacion ?i))
;                     then
;                         (bind ?sorted FALSE)
;                         (bind ?temp ?i)
;                         (bind ?i ?j)
;                         (bind ?j ?temp)))))
;     (printout t ?X crlf))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (deffunction rest (?list)
;   (if (eq ?list nil)
;       then
;         nil
;       else
;         (return (subseq ?list 1 (length ?list)))))

; (deffunction MAIN::append (?list1 ?list2)
;   (if (eq ?list1 nil)
;       then
;         ?list2
;       else
;         (return (create$ (first ?list1) (append (rest ?list1) ?list2)))))


; (deffunction MAIN::filter (?func ?list)
;   (if (eq ?list nil)
;       then
;         nil
;       else
;         (progn
;           (if (call ?func (first ?list))
;               then
;                 (return (create$ (first ?list) (filter ?func (rest ?list))))
;               else
;                 (return (filter ?func (rest ?list))))))
; )

; (deffunction MAIN::custom-sort-by (?list ?compare-func)
;   (if (or (eq ?list nil) (eq (rest ?list) nil))
;       then
;         ?list
;       else
;         (progn
;           (bind ?pivot (first ?list))
;           (bind ?rest (rest ?list))
;           (bind ?less (custom-sort-by (filter (lambda (?x) (not (?compare-func ?pivot ?x))) ?rest) ?compare-func))
;           (bind ?greater (custom-sort-by (filter (lambda (?x) (?compare-func ?pivot ?x)) ?rest) ?compare-func))
;           (return (append ?less (create$ ?pivot) ?greater)))))