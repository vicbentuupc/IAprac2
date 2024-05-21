;; Global Variables
(defglobal ?*ejercicios* = (create$ ""))
(defglobal ?*peso* = (create$))
(defglobal ?*altura* = (create$))
(defglobal ?*puntacion_carrera* = (create$))
(defglobal ?*puntacion_flexiones* = (create$))
(defglobal ?*puntuacion_estilo_vida* = (create$))

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
    (bind ?answer (numeric_question "¿Que edad tienes?" 18 100))
    (send ?user put-edad ?answer)
)

(defrule READ_DATA::read_weight "Read weight of user"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "¿Cuanto pesas aproximadamente(kg)?" 10 100))
    (bind ?*peso* ?answer)
)

(defrule READ_DATA::read_height "Read height of user"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "¿Cuanto mides aproximadamente(cm)?" 10 300))
    (bind ?*altura* ?answer)
)

(defrule READ_DATA::read_time "Read time available per day"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "¿De cuantos minutos dispones al dia?" 30 120))
    (send ?user put-tiempo_diario ?answer)
)

(defrule READ_DATA::read_problems
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (yes_or_no_question "¿Tienes alguna lesion o problema de salud?"))
    (if ?answer
        then
        ; (bind ?possible_problems (find-all-instances ((?inst Problema)) TRUE))
        (bind ?possible_problems (create$ DolorDeEspalda DolorDeRodilla PresionAlta DolorDeCuello DolorDeCodo PresionBaja DolorDeHombro DolorDeCadera DolorDeTobillo DolorDeMuñeca ArticulacionesRigidas))
        (bind ?response (multiple_question "¿Cual?" ?possible_problems))

        (bind ?answer (create$ ))
        (foreach ?inst ?response
            ; (printout t  "***************" crlf)
            ; (printout t ?inst crlf)
            (bind ?result (find-instance ((?instaux Problema)) (eq ?instaux (instance-name ?inst))))
            (bind ?result (nth$ 1 ?result))
            ; (printout t ------ crlf)
            ; (printout t ?result crlf)
            ; (printout t (send ?result get-es_aliviado_por) crlf)
            ; (printout t "------" crlf)
            ; (printout t (length$ ?answer) crlf)
            (bind ?answer (insert$ ?answer (+ (length$ ?answer) 1) ?result))
            (printout t ?answer crlf)
        )
    (send ?user put-padece ?answer)
    (assert (filter_problems))
    )
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

(defrule READ_DATA::read_muscular_group "Read user muscular group objectives"
    ?user <- (object (is-a Persona))
    =>
    (bind ?has_answer (yes_or_no_question "¿Quieres trabajar algun grupo musucular en concreto?"))
    (if ?has_answer
        then
        (bind ?possible_objectives (create$ pectorales biceps triceps abdomen hombros espalda cuadriceps gluteos isquiotibiales))
        (bind ?answer (multiple_question "¿Que grupo muscular quieres trabajar?" ?possible_objectives))
        (send ?user put-grupos_musculares ?answer)
        (assert (filter_muscular_group))
    )
)

;;;Preguntas para la extraccion de nivel;;;

(defrule READ_DATA::read_carrera_sos "Read how difficult is for the user to run 10m"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "Puntua como de dificil te resulta correr durante 10 minutos seguidos" 1 10))
    (bind ?*puntacion_carrera* ?answer)
)

(defrule READ_DATA::read_felxiones "Read how difficult is for the user to do 10 push-ups"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "Puntua como de dificil te resulta hacer 10 flexiones seguidas" 1 10))
    (bind ?*puntacion_flexiones* ?answer)
)

(defrule READ_DATA::read_Life_style "Read how the user considerate his life style level"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "¿Como de activo consideras tu estilo de vida?" 1 10))
    (bind ?*puntuacion_estilo_vida* ?answer)
)

(defrule READ_DATA::end_reading "Go to next step"
    (declare (salience -10))
    =>
    (printout t "Procesando datos..." crlf)
    (focus ABSTRACT_DATA)
)


;;;;;;;;;;;;;;;;;;;;;;;;; ABSTRACT DATA MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;





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


(defrule PROCESS_DATA::filter_problems
    (declare (salience 5))
    ?user <- (object (is-a Persona))
    ?hecho <- (filter_problems)
    =>
    (bind ?problemas (send ?user get-padece))
    (foreach ?problem ?problemas
        ; (printout t "---------   " ?problem crlf)
        ; (printout t "SIZE: " (length$ ?*ejercicios*) crlf)
        (bind ?filtered_ejercicios (send ?problem get-impide))
        ; (printout t ?filtered_ejercicios crlf)
        (foreach ?inst ?filtered_ejercicios
            ; (printout t "---------   " ?inst crlf)
            ; (printout t "preSIZE: " (length$ ?*ejercicios*) crlf)
            ; (send ?inst delete)
            ; (printout t "postSIZE: " (length$ ?*ejercicios*) crlf)
            ; (bind ?*ejercicios* (delete-member$ ?*ejercicios* ?inst))
            (bind ?to_delete (nth$ 1 (find-instance ((?instaux Ejercicio)) (eq ?instaux (instance-name ?inst)))))
            ; (printout t "Delete: ")
            ; (printout t ?to_delete crlf)
            (send ?to_delete delete)
        )
    )
    (printout t "SIZE: " (length$ ?*ejercicios*) crlf)
    (bind ?*ejercicios* (find-all-instances ((?inst Ejercicio)) TRUE))
    (printout t "SIZE: " (length$ ?*ejercicios*) crlf)
)

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
(defrule PROCESS_DATA::filtrar_objetivo "Recorre todos los ejercicios y filtra los que tienen objetivos en comun con user"
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


;; Filtro parcial (puntua ejercicios)
(defrule PROCESS_DATA::filtrar_grupo_muscular "Recorre todos los ejercicios y filtra los que tienen grupo_musucular en comun con user"
    ?hecho <- (filter_muscular_group)
    ?user <- (object (is-a Persona))
    =>
    (bind ?i 1)
    (bind ?objetivos_escogidos (send ?user get-grupos_musculares))

    (while (<= ?i (length$ ?*ejercicios*)) do
        (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
        (bind ?obj_ejercicio (send ?ejercicio_nth get-grupos_musculares))
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