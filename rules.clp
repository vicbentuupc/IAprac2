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

(defrule READ_DATA::read_time "Read time available per day"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "¿De cuantos minutos dispones al dia?" 30 120))
    (send ?user put-tiempo_diario ?answer)
    (assert (daily_time ?answer))
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
    ;; Debug print
    (printout t "Ejercicios encontrados: " ?*ejercicios* crlf)
)




(defrule PROCESS_DATA::filtrar_objetivo "Recorre todos los ejercicios y filtra los si tienen objetivos en comun con user"
    ?hecho <- (filter_objectives)
    ?user <- (object(is-a Persona))
    =>
    (bind ?i 1)
    (bind ?aux (create$))
    (bind ?objetivos_escogidos (send ?user get-objetivo))

    (while (<= ?i (length$ ?*ejercicios*)) do
        (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
        (bind ?obj_ejercicio (send ?ejercicio_nth get-objetivo))
        (if (tienen_elemento_en_comun ?objetivos_escogidos ?obj_ejercicio) ;;objetivos_escogidos es una lista de simbolos
            then (bind ?aux (create$ ?aux ?ejercicio_nth)))                ;;obj_ejercicio es una lista de strings

        (bind ?i (+ ?i 1))
    )

    (bind ?*ejercicios* ?aux)
    (retract ?hecho)
)




















(defrule PROCESS_DATA::end_process "End processing and show results"
    (declare (salience -10))
    ?user <- (object (is-a Persona))
    =>
    (focus SHOW_DATA)
)


;;;;;;;;;;;;;;;;;;;;;;;;; SHOW DATA MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule SHOW_DATA::show_results "Show the final schedule"
    ?user <- (object (is-a Persona))
    =>
    (printout t "Esta es la rutina que se te recomienda:" crlf)
    (printout t crlf)
    (bind ?i 1)

    ;; Debug print
    (printout t "Fetching exercises..." crlf)

    (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
    (printout t "Exercise instance for Lunes: " ?ejercicio_nth crlf)
    (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
    (printout t "Lunes: " ?nom_ejercicio crlf)
    (bind ?i (+ ?i 1))

    (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
    (printout t "Exercise instance for Martes: " ?ejercicio_nth crlf)
    (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
    (printout t "Martes: " ?nom_ejercicio crlf)
    (bind ?i (+ ?i 1))

    (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
    (printout t "Exercise instance for Miercoles: " ?ejercicio_nth crlf)
    (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
    (printout t "Miercoles: " ?nom_ejercicio crlf)
    (bind ?i (+ ?i 1))

    (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
    (printout t "Exercise instance for Jueves: " ?ejercicio_nth crlf)
    (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
    (printout t "Jueves: " ?nom_ejercicio crlf)
    (bind ?i (+ ?i 1))

    (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
    (printout t "Exercise instance for Viernes: " ?ejercicio_nth crlf)
    (bind ?nom_ejercicio (str-cat ?ejercicio_nth))
    (printout t "Viernes: " ?nom_ejercicio crlf)
)
