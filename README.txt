
RUN THIS COMMAND ON CLIPS IDE:
(batch "run.clp.bat")



Añadir default a score exercice
(slot puntuacion
        (type INTEGER)
        (create-accessor read-write)
        (default 0))





Abstraccion:
- sacar nivel_cardio y fuerza: shinto
   edad, imc (peso/altura), carrera sostenida, minutos caminados_dia


Filtros:
- puntuar dificultad con nivel shinto
- combina_con



Generar el output: shinto
- horario



//SHINTO, preguntarle a Victor:
hay 2 opciones, que la clase persona, contenga toda la informacion que se recoja de las Preguntas
y crear variables globales para el valor de la abstraccion. (como lo tiene Jianing)
O bien, que la clase persona contenga el valor de la abstraccion, y que se guarde la informacion de las Preguntas
en variables globales. (Como lo tenemos nosotros)















// GPT prompt
Te pasare instancias de ejercicios físicos en formato CLIPS. Quiero que generes la máxima cantidad posible de instancias siguiendo esos patrones y con los mismos atributos:
"nivel_fuerza": entre 1 y 5, nivel de dificultad en referencia a la fuerza de la persona
"nivel_cardio": entre 1 y 5, nivel de dificultad en referencia a la resistencia del usuario
"objetivo": para que sirve ese ejercicio, puede tener múltiples etiquetas. Hay estas posibilidades: "mantenimiento, ponerse_en_forma, rebajar_peso, musculación, flexibilidad, equilibrio"
"grupos_musculares": que grupos musculares ejercita, puede tener múltiples etiquetas. Hay estas posibilidades: "pectorales, biceps, triceps, abdomen, hombros, espalda, cuadriceps, gluteos, isquiotibiales" 
"edad_max": en caso que haya, edad máxima para realizar tal ejercicio. Si no la hay, no poner el campo.
"combina_con": entre 0 y múltiples, otros ejercicios complementarios que podria ir bien realizar en la misma sesion. En casos que no haya, no poner el campo. Si hay, ese ejercicio debe existir.
"repeticiones": cantidad de repeticiones por ejercicio.
"series": cantidad de series por ejercicio.
"tiempo": tiempo en minutos para realizar el ejercicio.


Aqui unos ejemplos. Empieza de zero, sin tener en cuenta estos ejercicios. Genera tantas instancias como puedas, lo más variadas que puedas en cada campo.

([FlexionesDePecho] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 2)
  (objetivo mantenimiento ponerse_en_forma)
  (grupos_musculares pectorales triceps)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([SentadillasConSalto] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 3)
  (objetivo rebajar_peso)
  (grupos_musculares abdomen cuadriceps)
  (edad_max 65)
  (combina_con Planchas Burpees)
  (repeticiones 15)
  (series 4)
  (tiempo 15)
)

([Estocadas] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 5)
  (objetivo flexibilidad equilibrio)
  (grupos_musculares gluteos isquiotibiales)
  (repeticiones 20)
  (series 2)
  (tiempo 5)
)

([CurlDeBicepsConMancuernas] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares biceps hombros)
  (edad_max 60)
  (repeticiones 10)
  (series 4)
  (tiempo 12)
)

([Planchas] of Ejercicio
  (nivel_fuerza 1)
  (nivel_cardio 4)
  (objetivo mantenimiento rebajar_peso)
  (grupos_musculares abdomen espalda)
  (combina_con FlexionesDePecho Estocadas)
  (repeticiones 18)
  (series 3)
  (tiempo 8)
)

([ZancadasConPeso] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 3)
  (objetivo ponerse_en_forma)
  (grupos_musculares cuadriceps gluteos)
  (edad_max 65)
  (combina_con SentadillasConSalto Planchas)
  (repeticiones 14)
  (series 3)
  (tiempo 10)
)

([ElevacionDePiernas] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 2)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares isquiotibiales)
  (repeticiones 16)
  (series 2)
  (tiempo 6)
)

([Burpees] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 4)
  (objetivo ponerse_en_forma musculación)
  (grupos_musculares pectorales abdomen)
  (repeticiones 12)
  (series 4)
  (tiempo 14)
)

([PressDeBanca] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 2)
  (objetivo musculación equilibrio)
  (grupos_musculares biceps triceps)
  (edad_max 60)
  (combina_con CurlDeBicepsConMancuernas Burpees)
  (repeticiones 10)
  (series 5)
  (tiempo 15)
)

([PesoMuerto] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 1)
  (objetivo rebajar_peso)
  (grupos_musculares espalda gluteos)
  (repeticiones 20)
  (series 3)
  (tiempo 12)
)













Ahora genera instancias de problemas físicos / salud con los siguientes campos:
es_aliviado_por: entre 0 y multiples ejercicios son buenos para solventar / tratar este problema. En casos que no haya, no poner el campo. Si hay, ese ejercicio debe existir.
impide: entre 0 y multiples ejercicios que no deben hacerse si se tiene este problema de salud. En casos que no haya, no poner el campo. Si hay, ese ejercicio debe existir.

El formato deberia ser:

([NombreProblema] of Problema
  (es_aliviado_por nombre_ex1 nombre_ex2 nombre_ex3 nombre_ex4 etc)
  (impide nombre_ex1 nombre_ex2 nombre_ex3 nombre_ex4 etc)
)


Generame instancias para estos problemas: 
DolorDeEspalda, DolorDeRodilla, PresionAlta, DolorDeCuello, DolorDeCode, PresionBaja, DolorDeHombro