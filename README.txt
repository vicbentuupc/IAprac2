
RUN THIS COMMAND ON CLIPS IDE:
(batch "run.clp.bat")



Añadir default a score exercice
(slot puntuacion
        (type INTEGER)
        (create-accessor read-write)
        (default 0))





Abstraccion:
- sacar nivel_cardio y fuerza


Filtros:
- filtrar_edad victor
- filtrar problemas
- puntuar grupo_muscular
- puntuar problema es_aliviado_por
- puntuar dificultad con nivel


Instancias: victor
- por ejecicio: series, repeticiones y tiempo fijos
- problemas


Generar el output: shinto
- horario

















// GPT prompt
Te pasare instancias de ejercicios físicos en formato CLIPS. Quiero que generes la máxima cantidad posible de instancias siguiendo esos patrones y con los mismos atributos:
"nivel_fuerza": entre 1 y 5, nivel de dificultad en referencia a la fuerza de la persona
"nivel_cardio": entre 1 y 5, nivel de dificultad en referencia a la resistencia del usuario
"objetivo": para que sirve ese ejercicio, puede tener múltiples etiquetas. Hay estas posibilidades: "mantenimiento, ponerse_en_forma, rebajar_peso, musculación, flexibilidad, equilibrio"
"grupos_musculares": que grupos musculares ejercita, puede tener múltiples etiquetas. Hay estas posibilidades: "pectorales, biceps, triceps, abdomen, hombros, espalda, cuadriceps, gluteos, isquiotibiales" 
"calorias_por_min": calorias que consume por minute este ejercicio
"edad_max": en caso que haya, edad máxima para realizar tal ejercicio. Si no la hay, no poner el campo.
"combina_con": entre 0 y múltiples, otros ejercicios complementarios a este para realizar en una sesion. En casos que no haya, no poner el campo.  Si hay ejercicios, esos ejercicios deben existir. Es una propiedad simetrica, si a combina con b, b combina con a.
"repeticiones_min": cantidad mínima de repeticiones en una sesión.
"repeticiones_max": cantidad máxima de repeticiones en una sesión.
"tiempo_min": tiempo en minutos mínimo para realizar el ejercicio.
"tiempo_max": tiempo en minutos máximo para realizar el ejercicio.


Aqui unos ejemplos. Empieza de zero, puedes repetir los ejercicios ya existentes

([Sentadillas] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 2)
   (objetivo (ponerse_en_forma rebajar_peso musculación))
   (grupos_musculares (cuadriceps gluteos))
   (calorias_por_min 5)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con ("Saltos de tijera")))

([Flexiones] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 3)
   (objetivo (mantenimiento ponerse_en_forma musculación))
   (grupos_musculares (pectorales triceps hombros))
   (calorias_por_min 8)
   (repeticiones_min 8)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con ("Dominadas")))

([Burpees] of Ejercicio
   (nivel_fuerza 5)
   (nivel_cardio 5)
   (objetivo (ponerse_en_forma rebajar_peso))
   (grupos_musculares (pectorales triceps cuadriceps))
   (calorias_por_min 12)
   (edad_max 50)
   (repeticiones_min 5)
   (repeticiones_max 10)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con ("Correr" "Mountain climbers")))

([Plancha] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 1)
   (objetivo (mantenimiento flexibilidad equilibrio))
   (grupos_musculares (abdomen hombros))
   (calorias_por_min 3)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 1)
   (tiempo_max 5))

([Remo con mancuernas] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 2)
   (objetivo (musculación ponerse_en_forma))
   (grupos_musculares (espalda biceps))
   (calorias_por_min 6)
   (repeticiones_min 10)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con ("Levantamiento de pesas")))

([Zancadas] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 2)
   (objetivo (ponerse_en_forma rebajar_peso musculación))
   (grupos_musculares (cuadriceps gluteos))
   (calorias_por_min 6)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con ("Step-ups")))

([Dominadas] of Ejercicio
   (nivel_fuerza 5)
   (nivel_cardio 3)
   (objetivo (musculación ponerse_en_forma))
   (grupos_musculares (espalda biceps))
   (calorias_por_min 8)
   (repeticiones_min 5)
   (repeticiones_max 10)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con ("Flexiones")))

([Press de banca] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 1)
   (objetivo (musculación mantenimiento))
   (grupos_musculares (pectorales triceps))
   (calorias_por_min 7)
   (repeticiones_min 8)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 10))

([Correr] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 5)
   (objetivo (ponerse_en_forma rebajar_peso))
   (grupos_musculares (cuadriceps gluteos))
   (calorias_por_min 10)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 20)
   (tiempo_max 60)
   (combina_con ("Burpees")))

([Saltos de tijera] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 4)
   (objetivo (ponerse_en_forma rebajar_peso))
   (grupos_musculares (cuadriceps gluteos))
   (calorias_por_min 8)
   (repeticiones_min 15)
   (repeticiones_max 30)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con ("Sentadillas")))

([Levantamiento de pesas] of Ejercicio
   (nivel_fuerza 5)
   (nivel_cardio 2)
   (objetivo (musculación ponerse_en_forma))
   (grupos_musculares (pectorales biceps triceps hombros espalda))
   (calorias_por_min 9)
   (repeticiones_min 6)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 15)
   (combina_con ("Remo con mancuernas")))

([Abdominales] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 2)
   (objetivo (mantenimiento ponerse_en_forma))
   (grupos_musculares (abdomen))
   (calorias_por_min 5)
   (repeticiones_min 15)
   (repeticiones_max 30)
   (tiempo_min 5)
   (tiempo_max 10))

([Mountain climbers] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 5)
   (objetivo (ponerse_en_forma rebajar_peso))
   (grupos_musculares (cuadriceps abdomen hombros))
   (calorias_por_min 10)
   (repeticiones_min 20)
   (repeticiones_max 40)
   (tiempo_min 5)
   (tiempo_max 15)
   (combina_con ("Burpees")))

([Elevaciones laterales] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 1)
   (objetivo (mantenimiento flexibilidad))
   (grupos_musculares (hombros))
   (calorias_por_min 4)
   (repeticiones_min 10)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10))

([Step-ups] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 3)
   (objetivo (ponerse_en_forma rebajar_peso))
   (grupos_musculares (cuadriceps gluteos))
   (calorias_por_min 7)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 15)
   (combina_con ("Zancadas")))

