RUN THIS COMMAND ON CLIPS IDE:
(batch "run.clp.bat")










// GPT prompt
Te pasare instancias de ejercicios físicos en formato CLIPS. Quiero que crees más instancias siguiendo esos patrones y con los mismos atributos:
"nivel_fuerza": entre 1 y 5, nivel de dificultad en referencia a la fuerza de la persona
"nivel_cardio": entre 1 y 5, nivel de dificultad en referencia a la resistencia del usuario
"objetivo": para que sirve ese ejercicio, puede tener múltiples etiquetas. Hay estas posibilidades: "mantenimiento, ponerse_en_forma, rebajar_peso, musculación, flexibilidad, equilibrio"

Aquú unos ejemplos:
"([Carrera sostenida] of Ejercicio
        (nivel_fuerza 1)
        (nivel_cardio 4)
        (objetivo "mantenimiento" "rebajar_peso")
    )

([Flexiones] of  Ejercicio
        (nivel_fuerza 3)
        (nivel_cardio 1)
        (objetivo "ponerse_en_forma")
    )    
    
    
"