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
            (if (not(member$ (lowcase ?value) ?values))
                then (bind ?invalidValue TRUE)
            )
    )
    (while ?invalidValue do
        (bind ?invalidValue FALSE)
        (printout t "Algun valor no es valido, prueba otra vez." crlf)
        (bind ?answer (readline))
        (bind ?res (explode$ ?answer))
        (progn$ (?value ?res)
            (if (not(member$ (lowcase ?value) ?values))
                then (bind ?invalidValue TRUE)
            )
        )
    )
    (printout t crlf)
    ?res
)

(deffunction MAIN::tienen_elemento_en_comun (?list1 ?list2)
    (bind ?found FALSE)
    (foreach ?elem1 ?list1
        (bind ?el (str-cat ?elem1))
        (if (member$ ?el ?list2) then
        (bind ?found TRUE)
        (break)
        )
    )
    ?found
)
