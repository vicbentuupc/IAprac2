;;; ---------------------------------------------------------
;;; ontology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\ontology.ttl
;;; :Date 22/05/2024 22:16:44

(defclass Ejercicio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot combina_con
        (type INSTANCE)
        (create-accessor read-write))
    (slot edad_max
        (type INTEGER)
        (create-accessor read-write))
    (multislot grupos_musculares
        (type STRING)
        (create-accessor read-write))
    (slot nivel_cardio
        (type INTEGER)
        (create-accessor read-write))
    (slot nivel_fuerza
        (type INTEGER)
        (create-accessor read-write))
    (multislot objetivo
        (type STRING)
        (create-accessor read-write))
    (slot puntuacion
        (type INTEGER)
        (create-accessor read-write)
        (default 0))
    (slot repeticiones
        (type INTEGER)
        (create-accessor read-write))
    (slot series
        (type INTEGER)
        (create-accessor read-write))
    (slot tiempo
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Persona
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot padece
        (type INSTANCE)
        (create-accessor read-write))
    (slot edad
        (type INTEGER)
        (create-accessor read-write))
    (multislot grupos_musculares
        (type STRING)
        (create-accessor read-write))
    (slot nivel_cardio
        (type INTEGER)
        (create-accessor read-write))
    (slot nivel_fuerza
        (type INTEGER)
        (create-accessor read-write))
    (multislot objetivo
        (type STRING)
        (create-accessor read-write))
    (slot tiempo_diario
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Problema
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot es_aliviado_por
        (type INSTANCE)
        (create-accessor read-write))
    (multislot impide
        (type INSTANCE)
        (create-accessor read-write))
)

(definstances instances
)
