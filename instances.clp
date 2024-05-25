(definstances instances


;;;;;;;;;;;;;;;;;;;;;; Ejercicios ;;;;;;;;;;;;;;;;;;;;;;

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


;; Tanda 1

([FlexionesDiamante] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 2)
  (objetivo musculación ponerse_en_forma)
  (grupos_musculares pectorales triceps)
  (repeticiones 15)
  (series 3)
  (tiempo 12)
)

([MountainClimbers] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 5)
  (objetivo rebajar_peso ponerse_en_forma)
  (grupos_musculares abdomen cuadriceps)
  (repeticiones 20)
  (series 4)
  (tiempo 10)
)

([RemoConBarra] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 2)
  (objetivo musculación mantenimiento)
  (grupos_musculares espalda biceps)
  (edad_max 55)
  (repeticiones 12)
  (series 3)
  (tiempo 15)
)

([Sentadillas] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 2)
  (objetivo mantenimiento rebajar_peso)
  (grupos_musculares cuadriceps gluteos)
  (repeticiones 15)
  (series 4)
  (tiempo 10)
)

([FondosDeTriceps] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares triceps pectorales)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([Abdominales] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 3)
  (objetivo flexibilidad ponerse_en_forma)
  (grupos_musculares abdomen)
  (combina_con Planchas)
  (repeticiones 20)
  (series 4)
  (tiempo 8)
)

([Dominadas] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 3)
  (objetivo musculación ponerse_en_forma)
  (grupos_musculares espalda biceps)
  (edad_max 50)
  (repeticiones 10)
  (series 4)
  (tiempo 12)
)

([PressMilitar] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 2)
  (objetivo musculación mantenimiento)
  (grupos_musculares hombros triceps)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([PlanchaLateral] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 4)
  (objetivo equilibrio mantenimiento)
  (grupos_musculares abdomen)
  (combina_con Planchas Estocadas)
  (repeticiones 15)
  (series 3)
  (tiempo 6)
)

([CurlDeMartillo] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares biceps)
  (edad_max 60)
  (repeticiones 10)
  (series 4)
  (tiempo 12)
)

([StepUps] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 3)
  (objetivo rebajar_peso ponerse_en_forma)
  (grupos_musculares cuadriceps gluteos)
  (repeticiones 20)
  (series 3)
  (tiempo 10)
)

([ElevacionesLaterales] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 1)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares hombros)
  (repeticiones 15)
  (series 4)
  (tiempo 8)
)

([LevantamientoDeRodillas] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 5)
  (objetivo ponerse_en_forma rebajar_peso)
  (grupos_musculares abdomen)
  (repeticiones 25)
  (series 3)
  (tiempo 10)
)

([Hiperextensiones] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 2)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares espalda gluteos)
  (repeticiones 20)
  (series 2)
  (tiempo 8)
)

([Skipping] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 5)
  (objetivo rebajar_peso ponerse_en_forma)
  (grupos_musculares cuadriceps abdomen)
  (repeticiones 30)
  (series 4)
  (tiempo 10)
)

([RotacionesDeCintura] of Ejercicio
  (nivel_fuerza 1)
  (nivel_cardio 2)
  (objetivo flexibilidad equilibrio)
  (grupos_musculares abdomen espalda)
  (repeticiones 20)
  (series 3)
  (tiempo 5)
)

([SaltoDeCuerda] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 5)
  (objetivo ponerse_en_forma rebajar_peso)
  (grupos_musculares cuadriceps abdomen)
  (repeticiones 100)
  (series 3)
  (tiempo 12)
)

([PrensaDePiernas] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 2)
  (objetivo musculación)
  (grupos_musculares cuadriceps gluteos)
  (edad_max 55)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([RemoConMancuernas] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 2)
  (objetivo musculación mantenimiento)
  (grupos_musculares espalda biceps)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([PressDeHombros] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares hombros triceps)
  (repeticiones 12)
  (series 4)
  (tiempo 10)
)

([PatadaDeGluteo] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 2)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares gluteos)
  (repeticiones 15)
  (series 3)
  (tiempo 8)
)

([AbdominalesBicicleta] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 3)
  (objetivo ponerse_en_forma rebajar_peso)
  (grupos_musculares abdomen)
  (repeticiones 25)
  (series 4)
  (tiempo 10)
)

([RemoInverso] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 2)
  (objetivo musculación mantenimiento)
  (grupos_musculares espalda biceps)
  (repeticiones 15)
  (series 3)
  (tiempo 12)
)

([FlexionesConAplauso] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 3)
  (objetivo ponerse_en_forma rebajar_peso)
  (grupos_musculares pectorales triceps)
  (repeticiones 12)
  (series 3)
  (tiempo 8)
)




;;;;;; Tanda 2

([FlexionesDiamante] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 2)
  (objetivo musculación)
  (grupos_musculares pectorales triceps)
  (repeticiones 15)
  (series 4)
  (tiempo 12)
)

([MountainClimbers] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 5)
  (objetivo rebajar_peso ponerse_en_forma)
  (grupos_musculares abdomen cuadriceps)
  (combina_con Burpees Planchas)
  (repeticiones 30)
  (series 3)
  (tiempo 10)
)

([RemoConBarra] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares espalda biceps)
  (repeticiones 10)
  (series 4)
  (tiempo 15)
)

([SentadillasSumo] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 2)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares cuadriceps gluteos)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([PressMilitar] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares hombros triceps)
  (edad_max 60)
  (combina_con CurlDeBicepsConMancuernas)
  (repeticiones 10)
  (series 4)
  (tiempo 12)
)

([Sprints] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 5)
  (objetivo rebajar_peso ponerse_en_forma)
  (grupos_musculares cuadriceps gluteos)
  (combina_con Burpees)
  (repeticiones 10)
  (series 3)
  (tiempo 8)
)

([AbdominalesBicicleta] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 3)
  (objetivo mantenimiento)
  (grupos_musculares abdomen)
  (repeticiones 20)
  (series 3)
  (tiempo 10)
)

([Dominadas] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 2)
  (objetivo musculación ponerse_en_forma)
  (grupos_musculares espalda biceps)
  (edad_max 55)
  (repeticiones 8)
  (series 4)
  (tiempo 15)
)

([SaltosDeCaja] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 4)
  (objetivo rebajar_peso)
  (grupos_musculares cuadriceps gluteos)
  (combina_con SentadillasConSalto MountainClimbers)
  (repeticiones 12)
  (series 3)
  (tiempo 12)
)

([ExtensionDeTricepsConMancuernas] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares triceps)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([ElevacionesLaterales] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 1)
  (objetivo mantenimiento)
  (grupos_musculares hombros)
  (edad_max 65)
  (repeticiones 15)
  (series 3)
  (tiempo 10)
)

([BoxeoConSombra] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 5)
  (objetivo ponerse_en_forma)
  (grupos_musculares hombros abdomen)
  (combina_con Sprints Planchas)
  (repeticiones 20)
  (series 3)
  (tiempo 15)
)

([HipThrust] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 2)
  (objetivo musculación)
  (grupos_musculares gluteos isquiotibiales)
  (repeticiones 15)
  (series 4)
  (tiempo 12)
)

([StepUps] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 3)
  (objetivo rebajar_peso)
  (grupos_musculares cuadriceps gluteos)
  (combina_con SentadillasConSalto)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([PlanchaLateral] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 3)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares abdomen espalda)
  (repeticiones 10)
  (series 3)
  (tiempo 8)
)

([BurroKick] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 2)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares gluteos)
  (repeticiones 20)
  (series 3)
  (tiempo 8)
)



;;;;;; Tanda 3

([RemoConMancuernas] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares espalda biceps)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([SaltosEnTijera] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 4)
  (objetivo ponerse_en_forma)
  (grupos_musculares cuadriceps gluteos)
  (combina_con Sprints Burpees)
  (repeticiones 20)
  (series 3)
  (tiempo 10)
)

([DesplantesConMancuernas] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 2)
  (objetivo musculación)
  (grupos_musculares cuadriceps gluteos)
  (edad_max 60)
  (repeticiones 15)
  (series 4)
  (tiempo 12)
)

([FlexionesPike] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 3)
  (objetivo ponerse_en_forma)
  (grupos_musculares hombros pectorales)
  (repeticiones 10)
  (series 4)
  (tiempo 10)
)

([PatadasDeBurro] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 3)
  (objetivo mantenimiento)
  (grupos_musculares gluteos isquiotibiales)
  (repeticiones 15)
  (series 3)
  (tiempo 8)
)

([PressArnold] of Ejercicio
  (nivel_fuerza 5)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares hombros biceps)
  (repeticiones 12)
  (series 4)
  (tiempo 12)
)

([LevantamientoDePiernas] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 2)
  (objetivo flexibilidad mantenimiento)
  (grupos_musculares abdomen)
  (repeticiones 20)
  (series 3)
  (tiempo 8)
)

([SaltosDeTijeraConPeso] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 4)
  (objetivo rebajar_peso)
  (grupos_musculares cuadriceps gluteos)
  (combina_con SentadillasConSalto)
  (repeticiones 15)
  (series 3)
  (tiempo 10)
)

([PressDeHombroConMancuernas] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares hombros triceps)
  (edad_max 65)
  (repeticiones 12)
  (series 3)
  (tiempo 10)
)

([PlanchasConToqueDeHombro] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 3)
  (objetivo ponerse_en_forma mantenimiento)
  (grupos_musculares abdomen hombros)
  (repeticiones 20)
  (series 3)
  (tiempo 8)
)

([FlexionesDeBrazo] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 2)
  (objetivo mantenimiento)
  (grupos_musculares triceps pectorales)
  (repeticiones 15)
  (series 3)
  (tiempo 8)
)

([ElevacionesDeTalones] of Ejercicio
  (nivel_fuerza 1)
  (nivel_cardio 1)
  (objetivo flexibilidad)
  (grupos_musculares cuadriceps)
  (repeticiones 25)
  (series 3)
  (tiempo 5)
)

([PlanchasConAbduccionDePierna] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 3)
  (objetivo ponerse_en_forma mantenimiento)
  (grupos_musculares abdomen gluteos)
  (combina_con Burpees MountainClimbers)
  (repeticiones 15)
  (series 3)
  (tiempo 10)
)

([FlexionesDePechoInclinadas] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 2)
  (objetivo mantenimiento musculación)
  (grupos_musculares pectorales triceps)
  (edad_max 60)
  (repeticiones 15)
  (series 3)
  (tiempo 10)
)

([SentadillasConMancuernas] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 2)
  (objetivo ponerse_en_forma)
  (grupos_musculares cuadriceps gluteos)
  (combina_con ZancadasConPeso)
  (repeticiones 15)
  (series 3)
  (tiempo 12)
)

([PlanchaConRotacion] of Ejercicio
  (nivel_fuerza 3)
  (nivel_cardio 3)
  (objetivo mantenimiento flexibilidad)
  (grupos_musculares abdomen espalda)
  (repeticiones 20)
  (series 3)
  (tiempo 10)
)

([ElevacionesDePierna] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 2)
  (objetivo mantenimiento)
  (grupos_musculares abdomen isquiotibiales)
  (repeticiones 20)
  (series 3)
  (tiempo 8)
)

([SaltosLaterales] of Ejercicio
  (nivel_fuerza 2)
  (nivel_cardio 4)
  (objetivo rebajar_peso ponerse_en_forma)
  (grupos_musculares cuadriceps gluteos)
  (combina_con Burpees)
  (repeticiones 20)
  (series 3)
  (tiempo 10)
)

([RemoInvertido] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 2)
  (objetivo musculación)
  (grupos_musculares espalda biceps)
  (repeticiones 12)
  (series 4)
  (tiempo 12)
)

([PressDeBancaConMancuernas] of Ejercicio
  (nivel_fuerza 4)
  (nivel_cardio 1)
  (objetivo musculación)
  (grupos_musculares pectorales triceps)
  (edad_max 60)
  (repeticiones 12)
  (series 4)
  (tiempo 12)
)

;;;;;;;;;;;;;;;;;;;;;; Problemas ;;;;;;;;;;;;;;;;;;;;;;


([DolorDeEspalda] of Problema
  (es_aliviado_por Planchas PlanchaLateral PlanchaConRotacion ElevacionDePiernas RemoInvertido)
  (impide PesoMuerto RemoConBarra PressDeBanca FlexionesPike SentadillasConMancuernas SentadillasConSalto CurlDeBicepsConMancuernas PressMilitar PressArnold)
)

([DolorDeRodilla] of Problema
  (es_aliviado_por ElevacionDePiernas BurroKick PlanchaConRotacion HipThrust)
  (impide SentadillasConSalto SaltosDeCaja ZancadasConPeso DesplantesConMancuernas StepUps Sprints SaltosEnTijera SentadillasSumo)
)

([PresionAlta] of Problema
  (es_aliviado_por Sprints SaltosEnTijera BoxeoConSombra StepUps SaltosLaterales)
  (impide RemoConBarra CurlDeBicepsConMancuernas PressDeBanca PressMilitar PesoMuerto PressArnold Dominadas Burpees PressDeHombroConMancuernas)
)

([DolorDeCuello] of Problema
  (es_aliviado_por Planchas ElevacionDePiernas AbdominalesBicicleta PlanchaConRotacion)
  (impide PressMilitar PressArnold FlexionesDePechoInclinadas SaltosDeCaja PressDeHombroConMancuernas Dominadas RemoConBarra CurlDeBicepsConMancuernas)
)

([DolorDeCodo] of Problema
  (es_aliviado_por BurroKick PlanchaConRotacion FlexionesDeBrazo PlanchaConAbduccionDePierna)
  (impide CurlDeBicepsConMancuernas RemoConMancuernas ExtensionDeTricepsConMancuernas Dominadas PressArnold PressDeHombroConMancuernas FlexionesDiamante PressDeBanca RemoConBarra)
)

([PresionBaja] of Problema
  (es_aliviado_por Sprints SaltosDeCaja SaltosEnTijeraConPeso Burpees)
  (impide PesoMuerto PressDeHombroConMancuernas Dominadas RemoConBarra PressArnold CurlDeBicepsConMancuernas ExtensionDeTricepsConMancuernas PressMilitar PressDeBanca)
)

([DolorDeHombro] of Problema
  (es_aliviado_por Planchas PlanchaConRotacion PlanchaLateral BurroKick PatadasDeBurro)
  (impide PressMilitar ElevacionesLaterales FlexionesPike PressArnold RemoConMancuernas CurlDeBicepsConMancuernas FlexionesDiamante PressDeBanca RemoInvertido)
)




;;; Tanda 2

([DolorDeCadera] of Problema
  (es_aliviado_por ElevacionDePiernas BurroKick PlanchaConAbduccionDePierna)
  (impide SentadillasConSalto SaltosDeCaja ZancadasConPeso SentadillasSumo)
)

([DolorDeTobillo] of Problema
  (es_aliviado_por ElevacionesDeTalones StepUps PlanchaConRotacion)
  (impide Sprints SaltosEnTijera SaltosLaterales SaltosDeCaja)
)

([DolorDeMuñeca] of Problema
  (es_aliviado_por ElevacionDePiernas PlanchaLateral AbdominalesBicicleta)
  (impide FlexionesDePecho FlexionesDiamante PlanchaConRotacion Burpees)
)

([ArticulacionesRigidas] of Problema
  (es_aliviado_por PlanchaConRotacion PlanchaLateral BurroKick PatadasDeBurro)
  (impide RemoConBarra CurlDeBicepsConMancuernas PressMilitar PressArnold)
)





)