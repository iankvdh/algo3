!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'iv 4/25/2022 14:27:20'!
intentarReproducirse
	(Habitat cantidadDeHuevosDeAvispa: 'tipoO') > 0 ifTrue: [ Habitat quitarHuevoDeAvispa: 'tipoO'. Habitat ponerHuevoDeAvispa: 'tipoL'. ]
	ifFalse: [ (Habitat cantidadDeHuevosDeAvispa: 'tipoP') > 0 ifTrue: [ Habitat quitarHuevoDeAvispa: 'tipoP'. Habitat ponerHuevoDeAvispa: 'tipoL'. ] ]! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'iv 4/25/2022 14:27:28'!
intentarReproducirse
	(Habitat cantidadDeOrugas ) > 0 ifTrue: [ Habitat quitarRecurso: 'oruga'. Habitat ponerHuevoDeAvispa: 'tipoO'. ]! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'iv 4/25/2022 14:27:32'!
intentarReproducirse
	(Habitat cantidadDePolillas ) > 0 ifTrue: [ Habitat quitarRecurso: 'polilla'. Habitat ponerHuevoDeAvispa: 'tipoP'. ]! !


!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'cantidadDeHuevos cantidadDeRecursos'!

!Habitat class methodsFor: 'recursos' stamp: 'iv 4/25/2022 14:19:10'!
agregarRecurso: tipoDeRecurso
	cantidadDeRecursos at: tipoDeRecurso put: (cantidadDeRecursos at: tipoDeRecurso) + 1.! !

!Habitat class methodsFor: 'recursos' stamp: 'iv 4/25/2022 13:54:28'!
cantidadDeOrugas
	^cantidadDeRecursos at: 	'oruga'.! !

!Habitat class methodsFor: 'recursos' stamp: 'iv 4/25/2022 13:59:47'!
cantidadDePolillas
	^cantidadDeRecursos at: 	'polilla'.! !

!Habitat class methodsFor: 'recursos' stamp: 'iv 4/25/2022 14:19:16'!
quitarRecurso: tipoDeRecurso
	cantidadDeRecursos at: tipoDeRecurso put: (cantidadDeRecursos at: tipoDeRecurso) - 1.! !

!Habitat class methodsFor: 'recursos' stamp: 'iv 4/25/2022 14:26:04'!
retrocederAlInicioDeLosTiempos
	cantidadDeHuevos := Dictionary new.
	cantidadDeHuevos at: 'tipoO' put: 0.
	cantidadDeHuevos at: 'tipoP' put: 0.
	cantidadDeHuevos at: 'tipoL' put: 0.


	cantidadDeRecursos := Dictionary new.
	cantidadDeRecursos at: 'oruga' put: 0.
	cantidadDeRecursos at: 'polilla' put: 0.! !


!Habitat class methodsFor: 'avispas' stamp: 'iv 4/25/2022 14:04:59'!
cantidadDeHuevosDeAvispa: tipoDeAvispa 
	^cantidadDeHuevos at: tipoDeAvispa.! !

!Habitat class methodsFor: 'avispas' stamp: 'iv 4/25/2022 14:26:58'!
cantidadDeHuevosDeAvispas
	^(cantidadDeHuevos at: 'tipoO') + (cantidadDeHuevos at: 'tipoP')  + (cantidadDeHuevos at: 'tipoL')! !

!Habitat class methodsFor: 'avispas' stamp: 'iv 4/25/2022 13:49:55'!
ponerHuevoDeAvispa: tipoDeAvispa

	cantidadDeHuevos at: tipoDeAvispa put: (cantidadDeHuevos at: tipoDeAvispa) + 1.! !

!Habitat class methodsFor: 'avispas' stamp: 'iv 4/25/2022 14:10:09'!
quitarHuevoDeAvispa: tipoDeAvispa

	cantidadDeHuevos at: tipoDeAvispa put: (cantidadDeHuevos at: tipoDeAvispa) - 1.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'iv 4/25/2022 14:29:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevos := ((Dictionary new) add: ('tipoL'->0); add: ('tipoO'->0); add: ('tipoP'->0); yourself).
	cantidadDeRecursos := ((Dictionary new) add: ('oruga'->0); add: ('polilla'->0); yourself).! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 14:28:11'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^Habitat cantidadDeHuevosDeAvispa: 'tipoL'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 14:28:16'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^Habitat cantidadDeHuevosDeAvispa: 'tipoO'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 14:28:58'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^Habitat cantidadDeHuevosDeAvispa: 'tipoO'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 14:28:19'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^Habitat cantidadDeHuevosDeAvispa: 'tipoP'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:16:52'!
habitat
	^Habitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:51:15'!
hacerQueElHabitatTengaLosRecursosSuficientes
	99 timesRepeat: [ Habitat agregarRecurso: 'oruga' ].
	99 timesRepeat: [ Habitat agregarRecurso: 'polilla' ].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 14:11:20'!
laAvispaLara
	^AvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:22:11'!
laAvispaOriana
	^AvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:56:34'!
laAvispaOrnella
	^AvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:57:57'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:55:06'!
queElHabitatTengaDosOrugasMas
	Habitat agregarRecurso: 'oruga'.
	Habitat agregarRecurso: 'oruga'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 14:01:18'!
queElHabitatTengaDosPolillasMas
	Habitat agregarRecurso: 'polilla'.
	Habitat agregarRecurso: 'polilla'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:52:00'!
queElHabitatTengaUnaOrugaMas
	Habitat agregarRecurso: 'oruga'! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 14:01:05'!
queElHabitatTengaUnaPolillaMas
	Habitat agregarRecurso: 'polilla'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/25/2022 13:19:13'!
retrocederElHabitatAlInicioDeLosTiempos
	Habitat retrocederAlInicioDeLosTiempos.! !

Habitat initializeAfterFileIn!