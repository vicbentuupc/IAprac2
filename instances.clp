(definstances instances


;;;;;;;;;;;;;;;;;;;;;; Ejercicios ;;;;;;;;;;;;;;;;;;;;;;

([Sentadillas] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 2)
   (objetivo ponerse_en_forma rebajar_peso musculacion)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 5)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Saltos_de_tijera))

([Flexiones] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 3)
   (objetivo mantenimiento ponerse_en_forma musculacion)
   (grupos_musculares pectorales triceps hombros)
   (calorias_por_min 8)
   (repeticiones_min 8)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Dominadas))

([Burpees] of Ejercicio
   (nivel_fuerza 5)
   (nivel_cardio 5)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares pectorales triceps cuadriceps)
   (calorias_por_min 12)
   (edad_max 50)
   (repeticiones_min 5)
   (repeticiones_max 10)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Correr Mountain_climbers))

([Plancha] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 1)
   (objetivo mantenimiento flexibilidad equilibrio)
   (grupos_musculares abdomen hombros)
   (calorias_por_min 3)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 1)
   (tiempo_max 5))

([Remo_con_mancuernas] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 2)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares espalda biceps)
   (calorias_por_min 6)
   (repeticiones_min 10)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Levantamiento_de_pesas))

([Zancadas] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 2)
   (objetivo ponerse_en_forma rebajar_peso musculacion)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 6)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Step-ups))

([Dominadas] of Ejercicio
   (nivel_fuerza 5)
   (nivel_cardio 3)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares espalda biceps)
   (calorias_por_min 8)
   (repeticiones_min 5)
   (repeticiones_max 10)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Flexiones))

([Press_de_banca] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 1)
   (objetivo musculacion mantenimiento)
   (grupos_musculares pectorales triceps)
   (calorias_por_min 7)
   (repeticiones_min 8)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 10))

([Correr] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 5)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 10)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 20)
   (tiempo_max 60)
   (combina_con Burpees))

([Saltos_de_tijera] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 4)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 8)
   (repeticiones_min 15)
   (repeticiones_max 30)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Sentadillas))

([Levantamiento_de_pesas] of Ejercicio
   (nivel_fuerza 5)
   (nivel_cardio 2)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares pectorales biceps triceps hombros espalda)
   (calorias_por_min 9)
   (repeticiones_min 6)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 15)
   (combina_con Remo_con_mancuernas))

([Abdominales] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 2)
   (objetivo mantenimiento ponerse_en_forma)
   (grupos_musculares abdomen)
   (calorias_por_min 5)
   (repeticiones_min 15)
   (repeticiones_max 30)
   (tiempo_min 5)
   (tiempo_max 10))

([Mountain_climbers] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 5)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares cuadriceps abdomen hombros)
   (calorias_por_min 10)
   (repeticiones_min 20)
   (repeticiones_max 40)
   (tiempo_min 5)
   (tiempo_max 15)
   (combina_con Burpees))

([Elevaciones_laterales] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 1)
   (objetivo mantenimiento flexibilidad)
   (grupos_musculares hombros)
   (calorias_por_min 4)
   (repeticiones_min 10)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10))

([Step-ups] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 3)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 7)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 15)
   (combina_con Zancadas))

([Peso_muerto] of Ejercicio
   (nivel_fuerza 5)
   (nivel_cardio 2)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares espalda gluteos isquiotibiales)
   (calorias_por_min 8)
   (repeticiones_min 6)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 15)
   (combina_con Levantamiento_de_pesas))

([Fondos] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 2)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares triceps pectorales)
   (calorias_por_min 7)
   (repeticiones_min 8)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10)
   (combina_con Flexiones))

([Crunch] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 1)
   (objetivo mantenimiento flexibilidad)
   (grupos_musculares abdomen)
   (calorias_por_min 3)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10))

([Bicicleta_estatica] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 4)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 8)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 20)
   (tiempo_max 60))

([Press_militar] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 1)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares hombros triceps)
   (calorias_por_min 6)
   (repeticiones_min 8)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 10))

([Caminata_rapida] of Ejercicio
   (nivel_fuerza 1)
   (nivel_cardio 3)
   (objetivo mantenimiento ponerse_en_forma)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 5)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 20)
   (tiempo_max 60))

([Saltar_la_cuerda] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 5)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 12)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 10)
   (tiempo_max 30))

([Press_de_hombros] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 1)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares hombros triceps)
   (calorias_por_min 6)
   (repeticiones_min 8)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 10))

([Patada_de_burro] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 2)
   (objetivo mantenimiento ponerse_en_forma)
   (grupos_musculares gluteos cuadriceps)
   (calorias_por_min 4)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10))

([Hip_thrust] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 1)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares gluteos isquiotibiales)
   (calorias_por_min 5)
   (repeticiones_min 8)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10))

([Curl_de_biceps] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 1)
   (objetivo musculacion mantenimiento)
   (grupos_musculares biceps)
   (calorias_por_min 4)
   (repeticiones_min 10)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10))

([Extension_de_triceps] of Ejercicio
   (nivel_fuerza 3)
   (nivel_cardio 1)
   (objetivo musculacion mantenimiento)
   (grupos_musculares triceps)
   (calorias_por_min 4)
   (repeticiones_min 10)
   (repeticiones_max 15)
   (tiempo_min 5)
   (tiempo_max 10))

([Puente_de_gluteos] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 1)
   (objetivo mantenimiento ponerse_en_forma)
   (grupos_musculares gluteos)
   (calorias_por_min 3)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10))

([Skipping] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 4)
   (objetivo ponerse_en_forma rebajar_peso)
   (grupos_musculares cuadriceps gluteos)
   (calorias_por_min 9)
   (repeticiones_min 1)
   (repeticiones_max 1)
   (tiempo_min 10)
   (tiempo_max 30))

([Rotacion_de_torso] of Ejercicio
   (nivel_fuerza 2)
   (nivel_cardio 1)
   (objetivo flexibilidad mantenimiento)
   (grupos_musculares abdomen)
   (calorias_por_min 2)
   (repeticiones_min 10)
   (repeticiones_max 20)
   (tiempo_min 5)
   (tiempo_max 10))

([Remo_con_barra] of Ejercicio
   (nivel_fuerza 4)
   (nivel_cardio 2)
   (objetivo musculacion ponerse_en_forma)
   (grupos_musculares espalda biceps)
   (calorias_por_min 7)
   (repeticiones_min 8)
   (repeticiones_max 12)
   (tiempo_min 5)
   (tiempo_max 10))


;;;;;;;;;;;;;;;;;;;;;; Problemas ;;;;;;;;;;;;;;;;;;;;;;














)