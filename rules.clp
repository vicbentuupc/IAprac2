;; Global Variables
(defglobal ?*ejercicios* = (create$ ""))
(defglobal ?*peso* = 0)
(defglobal ?*altura* = 0)
(defglobal ?*puntuacion_carrera* = 0)
(defglobal ?*puntuacion_flexiones* = 0)
(defglobal ?*puntuacion_estilo_vida* = 0)

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
        (bind ?possible_problems (create$ DolorDeEspalda DolorDeRodilla PresionAlta DolorDeCuello DolorDeCodo PresionBaja DolorDeHombro DolorDeCadera DolorDeTobillo DolorDeMuñeca ArticulacionesRigidas))
        (bind ?response (multiple_question "¿Cual?" ?possible_problems))

        (bind ?answer (create$ ))
        (foreach ?inst ?response
            (bind ?result (find-instance ((?instaux Problema)) (eq ?instaux (instance-name ?inst))))
            (bind ?result (nth$ 1 ?result))
            (bind ?answer (insert$ ?answer (+ (length$ ?answer) 1) ?result))
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
    (bind ?*puntuacion_carrera* ?answer)
    (assert (abs_carrera))
)

(defrule READ_DATA::read_felxiones "Read how difficult is for the user to do 10 push-ups"
    ?user <- (object (is-a Persona))
    =>
    (bind ?answer (numeric_question "Puntua como de dificil te resulta hacer 10 flexiones seguidas" 1 10))
    (bind ?*puntuacion_flexiones* ?answer)
    (assert (abs_flexiones))
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

(defrule ABSTRACT_DATA::abstraccion_nivel_cardio "Obtener nivel de cardio a partir de (imc,carrera,estilo_vida)"
    ?user <- (object(is-a Persona))
    ?hecho <- (abs_carrera)
    =>
    

    ;;;Cuanta mas alta es la puntuacion de dificultad, menor es el nivel de la persona
    (if (<= ?*puntuacion_carrera* 2) then (send ?user put-nivel_cardio 5)
     else (if (<= ?*puntuacion_carrera* 4) then (send ?user put-nivel_cardio 4)
           else (if (<= ?*puntuacion_carrera* 6) then (send ?user put-nivel_cardio 3)
                else (if (<= ?*puntuacion_carrera* 8) then (send ?user put-nivel_cardio 2)
                    else  (send ?user put-nivel_cardio 1)
                    )
                )
           )
    )

    ;;;restamos 1 punto en el nivel de cardio si no esta habituado a la actividad;;;
    (bind ?nivel_actual (send ?user get-nivel_cardio))
    (if (<= ?*puntuacion_estilo_vida* 5) then 
        (if (> ?nivel_actual 1) then (bind ?nivel_actual (- ?nivel_actual 1)))
        (send ?user put-nivel_cardio ?nivel_actual)
    )

    ;;;restamos otro punto mas en el nivel de cardio si esta en baja forma;;;
    (bind ?nivel_actual (send ?user get-nivel_cardio))
    (if (<= ?*puntuacion_estilo_vida* 2) then 
        (if (> ?nivel_actual 1) then (bind ?nivel_actual (- ?nivel_actual 1)))
        (send ?user put-nivel_cardio ?nivel_actual)
    )

    ;;;sumamos un 1 punto en el nivel de cardio en el caso de que sea muy activo a diario;;;
    (bind ?nivel_actual (send ?user get-nivel_cardio))
    (if (>= ?*puntuacion_estilo_vida* 9) then 
        (if (< ?nivel_actual 5) then (bind ?nivel_actual (+ ?nivel_actual 1)))
        (send ?user put-nivel_cardio ?nivel_actual)
    )

    ;;;Si su imc es mayor a 25, inidica que tiene sobrepeso, restamos 1 punto;;;
    (bind ?altura_metros (/ ?*altura* 100))
    (bind ?imc (/ ?*peso* (* ?altura_metros ?altura_metros)))
    (if (>= ?imc 25.0) then 
        (if (> ?nivel_actual 1) then (bind ?nivel_actual (- ?nivel_actual 1)))
        (send ?user put-nivel_cardio ?nivel_actual)
    )

    (assert (filter_cardio))
    (retract ?hecho)
)


(defrule ABSTRACT_DATA::abstraccion_nivel_fuerza "Obtener nivel de fuerza a partir de (flexiones,estilo_vida)"
    ?user <- (object(is-a Persona))
    ?hecho <- (abs_flexiones)
    =>
    ;;;Cuanta mas alta es la puntuacion de dificultad, menor es el nivel de la persona
    (if (<= ?*puntuacion_flexiones* 2) then (send ?user put-nivel_fuerza 5)
     else (if (<= ?*puntuacion_flexiones* 4) then (send ?user put-nivel_fuerza 4)
           else (if (<= ?*puntuacion_flexiones* 6) then (send ?user put-nivel_fuerza 3)
                else (if (<= ?*puntuacion_flexiones* 8) then (send ?user put-nivel_fuerza 2)
                    else  (send ?user put-nivel_fuerza 1)
                    )
                )
           )
    )
    
    ;;;restamos 1 punto en el nivel de fuerza si no esta habituado a la actividad;;;
    (bind ?nivel_actual (send ?user get-nivel_fuerza))
    (if (<= ?*puntuacion_estilo_vida* 5) then 
        (if (> ?nivel_actual 1) then (bind ?nivel_actual (- ?nivel_actual 1)))
        (send ?user put-nivel_fuerza ?nivel_actual)
    )

    ;;;restamos otro punto mas en el nivel de fuerza si esta en baja forma;;;
    (bind ?nivel_actual (send ?user get-nivel_fuerza))
    (if (<= ?*puntuacion_estilo_vida* 2) then 
        (if (> ?nivel_actual 1) then (bind ?nivel_actual (- ?nivel_actual 1)))
        (send ?user put-nivel_fuerza ?nivel_actual)
    )

    ;;;sumamos un 1 punto en el nivel de fuerza en el caso de que sea muy activo a diario;;;
    (bind ?nivel_actual (send ?user get-nivel_fuerza))
    (if (>= ?*puntuacion_estilo_vida* 9) then 
        (if (< ?nivel_actual 5) then (bind ?nivel_actual (+ ?nivel_actual 1)))
        (send ?user put-nivel_fuerza ?nivel_actual)
    )

    (assert (filter_fuerza))
    (retract ?hecho)
)

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
    ; (printout t "SIZE: " (length$ ?*ejercicios*) crlf)
    (bind ?*ejercicios* (find-all-instances ((?inst Ejercicio)) TRUE))
    ; (printout t "SIZE: " (length$ ?*ejercicios*) crlf)
)

;; Filtro total (elimina ejercios)
(defrule PROCESS_DATA::filter_age
    ?user <- (object (is-a Persona))
    =>
    (bind ?age (send ?user get-edad))
    ; (printout t ?age crlf)
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

;; Filtro parcial (puntua ejercicios)
(defrule PROCESS_DATA::filtrar_nivel_cardio "Recorre todos los ejercicios y filtra los que tiene nivel_cardio en comun con user"
    ?hecho <- (filter_cardio)
    ?user <- (object (is-a Persona))
    =>
    (bind ?i 1)
    (bind ?nv_cardio_user (send ?user get-nivel_cardio))
        
    (printout t "nivel_cardio:" ?nv_cardio_user crlf) 

    (while (<= ?i (length$ ?*ejercicios*)) do
        (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
        (bind ?nv_cardio_ejer (send ?ejercicio_nth get-nivel_cardio))

        ;;;solo cuando el nivel del usuario es mayor al del ejercicio, lo puntuamos positiviamente
        ;;;Cuanto mas diferente sean los niveles, menor es la puntacion añadida (10 - diff*2)
        (if (>= ?nv_cardio_user ?nv_cardio_ejer) then   
            (bind ?current_score (send ?ejercicio_nth get-puntuacion))
            (if (not (integerp ?current_score)) then
                (bind ?current_score 0))
            (bind ?diff (- ?nv_cardio_user ?nv_cardio_ejer))
            (bind ?add_score (- 10 (* ?diff 2)))
            (bind ?new_score (+ ?current_score ?add_score))
            (send ?ejercicio_nth put-puntuacion ?new_score)

        ;;;En el caso de que el nivel del ejercicio sea mayor, restamos puntacion
        ;;;Cuanto mas diferente sean los niveles, mayor es la puntacion añadida (diff*2)
        else
            (bind ?current_score (send ?ejercicio_nth get-puntuacion))
            (if (not (integerp ?current_score)) then
                (bind ?current_score 0))
            (bind ?diff (- ?nv_cardio_ejer ?nv_cardio_user))
            (bind ?add_score (* ?diff 2))
            (bind ?new_score (- ?current_score ?add_score))
            (send ?ejercicio_nth put-puntuacion ?new_score)
        )

        (bind ?i (+ ?i 1))
    )
    (retract ?hecho)
)


;; Filtro parcial (puntua ejercicios)
(defrule PROCESS_DATA::filtrar_nivel_fuerza "Recorre todos los ejercicios y filtra los que tiene nivel_fuerza en comun con user"
    ?hecho <- (filter_fuerza)
    ?user <- (object (is-a Persona))
    =>
    (bind ?i 1)
    (bind ?nv_fuerza_user (send ?user get-nivel_fuerza))

    (printout t "nivel_fuerza:" ?nv_fuerza_user crlf) 

    (while (<= ?i (length$ ?*ejercicios*)) do
        (bind ?ejercicio_nth (nth$ ?i ?*ejercicios*))
        (bind ?nv_fuerza_ejer (send ?ejercicio_nth get-nivel_fuerza))

        ;;;Cuanto mas diferente sean los niveles, menor es la puntacion añadida (10 - diff*2)
        (if (>= ?nv_fuerza_user ?nv_fuerza_ejer) then   
            (bind ?current_score (send ?ejercicio_nth get-puntuacion))
            (if (not (integerp ?current_score)) then
                (bind ?current_score 0))
            (bind ?diff (- ?nv_fuerza_user ?nv_fuerza_ejer))
            (bind ?add_score (- 10 (* ?diff 2)))
            (bind ?new_score (+ ?current_score ?add_score))
            (send ?ejercicio_nth put-puntuacion ?new_score)

        ;;;En el caso de que el nivel del ejercicio sea mayor, restamos puntacion
        ;;;Cuanto mas diferente sean los niveles, mayor es la puntacion añadida (diff*2)
        else
            (bind ?current_score (send ?ejercicio_nth get-puntuacion))
            (if (not (integerp ?current_score)) then
                (bind ?current_score 0))
            (bind ?diff (- ?nv_fuerza_ejer ?nv_fuerza_user))
            (bind ?add_score (* ?diff 2))
            (bind ?new_score (- ?current_score ?add_score))
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
)


;;;;;;;;;;;;;;;;;;;;;;;;; SHOW DATA MODULE ;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule SHOW_DATA::show_results "Show the final schedule"
    ?user <- (object (is-a Persona))
    =>
    (printout t crlf)
    (bind ?i 1)
    (bind ?days (create$ "Lunes" "Martes" "Miercoles" "Jueves" "Viernes" "Sabado" "Domingo"))

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