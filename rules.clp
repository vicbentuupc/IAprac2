;; Global Variables
(defglobal ?*ejercicios* = (create$ ""))

;; Modules
(defmodule MAIN (export ?ALL))

;; Read info
(defmodule READ_DATA
    (import MAIN ?ALL)
    (export ?ALL)
)

;; Transform data to abstract problem
(defmodule ABSTRACT_DATA
    (import MAIN ?ALL)
    (import READ_DATA ?ALL)
    (export ?ALL)
)

;; Generate Exercices
(defmodule PROCESS_DATA
    (import MAIN ?ALL)
    (import READ_DATA ?ALL)
    (import ABSTRACT_DATA ?ALL)
    (export ?ALL)
)

;; Show routine
(defmodule SHOW_DATA
    (import MAIN ?ALL)
    (import READ_DATA ?ALL)
    (import ABSTRACT_DATA ?ALL)
    (import PROCESS_DATA ?ALL)
    (export ?ALL)
)

(defmodule SORT
    (import MAIN ?ALL)
    (import READ_DATA ?ALL)
    (import ABSTRACT_DATA ?ALL)
    (import PROCESS_DATA ?ALL)
    (import SHOW_DATA ?ALL)
    (export ?ALL)
)


;;;;;;;;;;;;;;;;;;;;;;;;; MAIN MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule MAIN::initiate "Initiate"
    (declare (salience 10))
    =>
    (make-instance Usuario of Persona)
    (printout t "Bienvenido al planificador de rutinas!" crlf)
    (focus READ_DATA)
)

;;;;;;;;;;;;;;;;;;;;;;;;; READ DATA MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule READ_DATA::read_name "Read user name"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (general_question "¿Como te llamas?"))
    (assert (name ?answer))
)

(defrule READ_DATA::read_age "Read age of user"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "Cuantos años tienes?" 18 100))
    (send ?user put-edad ?answer)
)

(defrule READ_DATA::read_time "Read time available per day"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "¿De cuantos minutos dispones al dia?" 30 120))
    (send ?user put-tiempo_diario ?answer)
)

(defrule READ_DATA::read_objectives "Read user objectives"
    ?user <- (object (is-a Persona))
    =>
    (bind ?has_answer (yes_or_no_question "¿Tienes algun objetivo concreto en mente?"))
    (if ?has_answer
        then
        (bind ?possible_objectives (create$ mantenimiento ponerse_en_forma rebajar_peso musculacion flexibilidad equilibrio))
        (bind ?answer (multiple_question "Cuales son tus objetivos?" ?possible_objectives))
        (send ?user put-objetivo ?answer)
        (assert (filter_objectives))
    )
)

(defrule READ_DATA::end_reading "Go to next step"
    (declare (salience -10))
    =>
    (printout t "Procesando datos..." crlf)
    (focus ABSTRACT_DATA)
)




;;;;;;;;;;;;;;;;;;;;;;;;; ABSTRACT DATA MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;

;;(defrule ABSTRACT_DATA::abstract_time_available)






;;;algunos inputs van directamente al Process module, y algunos inputs tienen que pasar por el abstract module antes













(defrule ABSTRACT_DATA::end_abstraction "Go to next step"
    (declare (salience -10))
    ?user <- (object(is-a Persona))
    =>
    (focus PROCESS_DATA)
)



;;;;;;;;;;;;;;;;;;;;;;;;; PROCESS DATA MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule PROCESS_DATA::init_process "Start process data"
    (declare (salience 10))
    ?user <- (object (is-a Persona))
    =>
    (bind ?*ejercicios* (find-all-instances ((?inst Ejercicio)) TRUE))
)

;; Filtro total (elimina ejercios)


(defrule PROCESS_DATA::filter_age
    ?user <- (object (is-a Persona))
    =>
    (bind ?age (send ?user get-edad))
    (printout t ?age crlf)
    (bind ?filtered_ejercicios (create$))
    (foreach ?inst ?*ejercicios*
        (if (and (< (send ?inst get-edad_max) ?age) (neq (send ?inst get-edad_max) 0)) then
            ; (printout t "Delete: ")
            ; (printout t ?inst "    " (send ?inst get-edad_max) crlf)
            (unmake-instance ?inst)
        else
            (bind ?filtered_ejercicios (create$ ?filtered_ejercicios ?inst))
        )
    )
    (bind ?*ejercicios* ?filtered_ejercicios)
)






;; Filtro parcial (puntua ejercicios)

(defrule PROCESS_DATA::filtrar_objetivo "Recorre todos los ejercicios y filtra los si tienen objetivos en comun con user"
    ?hecho <- (filter_objectives)
    ?user <- (object (is-a Persona))
    =>
    (bind ?i 1)
    (bind ?objetivos_escogidos (send ?user get-objetivo))

    (while (<= ?i (length$ ?*ejercicios*)) do
        (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
        (bind ?obj_ejercicio (send ?ejercicio_nth get-objetivo))
        (bind ?shared_count 0)
        
        (foreach ?obj ?obj_ejercicio
            (if (member$ ?obj ?objetivos_escogidos) then
                (bind ?shared_count (+ ?shared_count 1))
            )
        )

        (if (> ?shared_count 0) then
            (bind ?current_score (send ?ejercicio_nth get-puntuacion))
            (if (not (integerp ?current_score)) then
                (bind ?current_score 0))
            (bind ?new_score (+ ?current_score (* ?shared_count 10)))
            (send ?ejercicio_nth put-puntuacion ?new_score)
        )

        (bind ?i (+ ?i 1))
    )

    (retract ?hecho)
)






















(defrule PROCESS_DATA::end_process "End processing and show results"
    (declare (salience -10))
    ?user <- (object (is-a Persona))
    =>
    (focus SORT)
    ; (focus SHOW_DATA)
)


;;;;;;;;;;;;;;;;;;;;;;;;; SHOW DATA MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;


; (defrule SHOW_DATA::show_results "Show the final schedule"
;     ?user <- (object (is-a Persona))
;     =>
;     (printout t crlf)
;     (bind ?i 1)


;     (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
;     (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
;     (printout t "Lunes: " ?nom_ejercicio crlf)
;     (bind ?i (+ ?i 1))

;     (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
;     (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
;     (printout t "Martes: " ?nom_ejercicio crlf)
;     (bind ?i (+ ?i 1))

;     (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
;     (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
;     (printout t "Miercoles: " ?nom_ejercicio crlf)
;     (bind ?i (+ ?i 1))

;     (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
;     (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
;     (printout t "Jueves: " ?nom_ejercicio crlf)
;     (bind ?i (+ ?i 1))

;     (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
;     (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
;     (printout t "Viernes: " ?nom_ejercicio crlf)
; )


(defrule SHOW_DATA::show_results "Show the final schedule"
    ?user <- (object (is-a Persona))
    =>
    (printout t crlf)
    (bind ?i 1)
    (bind ?days (create$ "Lunes" "Martes" "Miercoles" "Jueves" "Viernes"))

    (foreach ?day ?days
        (if (<= ?i (length$ ?*ejercicios*)) then
            (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
            (bind ?nombre_ejercicio (str-cat ?ejercicio_nth))
            (printout t ?day ": " ?nombre_ejercicio crlf)
            (bind ?i (+ ?i 1))
        else
            (printout t ?day ": " "No exercise assigned" crlf)
        )
    )
)


































;;;;;;;;;;;;;;;;;;;;;;;;; SORT MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule SORT::order-by-score
    =>
    (bind ?i 1)
    (while (<= ?i (length$ ?*ejercicios*)) do
        (bind ?j (+ ?i 1))
        (while (<= ?j (length$ ?*ejercicios*)) do
            (bind ?ejercicio_i (nth$ ?i ?*ejercicios*))
            (bind ?ejercicio_j (nth$ ?j ?*ejercicios*))
            (bind ?score_i (send ?ejercicio_i get-puntuacion))
            (bind ?score_j (send ?ejercicio_j get-puntuacion))
            (if (< ?score_i ?score_j) then
                (bind ?*ejercicios* (replace$ ?*ejercicios* ?i ?i ?ejercicio_j))
                (bind ?*ejercicios* (replace$ ?*ejercicios* ?j ?j ?ejercicio_i))
            )
            (bind ?j (+ ?j 1))
        )
        (bind ?i (+ ?i 1))
    )
    (focus SHOW_DATA)
)