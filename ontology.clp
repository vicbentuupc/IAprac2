;;; ---------------------------------------------------------
;;; ontology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\ontology.ttl
;;; :Date 13/05/2024 08:51:39

(defclass Ejercicio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot bueno_para
        (type INSTANCE)
        (create-accessor read-write))
    (multislot combina_con
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Persona
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot padece
        (type INSTANCE)
        (create-accessor read-write))
    (multislot topObjectProperty
        (type INSTANCE)
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
    (multislot impide
        (type INSTANCE)
        (create-accessor read-write))
)

(definstances instances
)
