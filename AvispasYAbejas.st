!classDefinition: #AvispaLara category: 'AvispasYAbejas'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejas'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'iv 4/23/2022 16:52:14'!
intentarReproducirse
	Habitad cantidadDeHuevosO > 0 ifTrue: [ Habitad quitarHuevoO. Habitad ponerHuevoDeAvispaLara. ]
	ifFalse: [Habitad cantidadDeHuevosP > 0 ifTrue: [ Habitad quitarHuevoP. Habitad ponerHuevoDeAvispaLara. ] 
		ifFalse: [Habitad cantidadDeHuevosL > 0 ifTrue: [ Habitad quitarHuevoP. Habitad ponerHuevoDeAvispaLara. ] ] ]

! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejas'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejas'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'iv 4/23/2022 16:51:50'!
intentarReproducirse
	Habitad cantidadDeOrugas > 0 ifTrue: [ Habitad quitarOruga. Habitad ponerHuevoDeAvispaOriana. ]! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejas'!
DenotativeObject subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOrnella class' category: 'AvispasYAbejas'!
AvispaOrnella class
	instanceVariableNames: ''!

!AvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'iv 4/23/2022 16:52:38'!
intentarReproducirse
	Habitad cantidadDeOrugas > 0 ifTrue: [ Habitad quitarOruga. Habitad ponerHuevoDeAvispaOrnella. ]! !


!classDefinition: #AvispaPolly category: 'AvispasYAbejas'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejas'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'iv 4/23/2022 16:52:45'!
intentarReproducirse
	Habitad cantidadDePolillas > 0 ifTrue: [ Habitad quitarPolilla. Habitad ponerHuevoDeAvispaPolly. ]! !


!classDefinition: #Habitad category: 'AvispasYAbejas'!
DenotativeObject subclass: #Habitad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitad class' category: 'AvispasYAbejas'!
Habitad class
	instanceVariableNames: 'cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeAvispas cantidadDeHuevosO cantidadDeHuevosP cantidadDeHuevosL'!

!Habitad class methodsFor: 'polillas' stamp: 'iv 4/21/2022 20:52:16'!
agregarPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !

!Habitad class methodsFor: 'polillas' stamp: 'iv 4/21/2022 20:50:39'!
cantidadDePolillas
	^cantidadDePolillas! !

!Habitad class methodsFor: 'polillas' stamp: 'iv 4/21/2022 20:53:00'!
quitarPolilla
	cantidadDePolillas := cantidadDePolillas  - 1.! !


!Habitad class methodsFor: 'as yet unclassified' stamp: 'iv 4/23/2022 16:40:04'!
quitarHuevoO
	cantidadDeHuevosO := cantidadDeHuevosO - 1.! !

!Habitad class methodsFor: 'as yet unclassified' stamp: 'iv 4/23/2022 16:40:34'!
quitarHuevoP
	cantidadDeHuevosP := cantidadDeHuevosP - 1.! !

!Habitad class methodsFor: 'as yet unclassified' stamp: 'iv 4/23/2022 16:42:28'!
retrocederAlInicioDeLosTiempos
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugas  := 0.
	cantidadDePolillas  := 0.
	cantidadDeHuevosO := 0.
	cantidadDeHuevosP := 0.
	cantidadDeHuevosL := 0.! !


!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:55:27'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosO + cantidadDeHuevosP  + cantidadDeHuevosL ! !

!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:46:35'!
cantidadDeHuevosL
	^cantidadDeHuevosL! !

!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:18:35'!
cantidadDeHuevosO
	^cantidadDeHuevosO! !

!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:24:46'!
cantidadDeHuevosP
	^cantidadDeHuevosP! !

!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:55:35'!
ponerHuevoDeAvispaLara
	cantidadDeHuevosL := cantidadDeHuevosL + 1.! !

!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:55:42'!
ponerHuevoDeAvispaOriana
	cantidadDeHuevosO := cantidadDeHuevosO + 1.! !

!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:55:46'!
ponerHuevoDeAvispaOrnella
	cantidadDeHuevosO := cantidadDeHuevosO + 1.! !

!Habitad class methodsFor: 'avispas' stamp: 'iv 4/23/2022 16:55:52'!
ponerHuevoDeAvispaPolly	
	cantidadDeHuevosP:= cantidadDeHuevosP + 1.
! !


!Habitad class methodsFor: 'orugas' stamp: 'iv 4/21/2022 20:11:34'!
agregarOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.! !

!Habitad class methodsFor: 'orugas' stamp: 'iv 4/21/2022 20:13:16'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!Habitad class methodsFor: 'orugas' stamp: 'iv 4/21/2022 20:15:55'!
quitarOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !


!Habitad class methodsFor: '--** private fileout/in **--' stamp: 'iv 4/23/2022 17:08:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeHuevosO := 0.
	cantidadDeHuevosP := 0.
	cantidadDeHuevosL := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejas'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejas'!
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


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/23/2022 16:47:37'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^Habitad cantidadDeHuevosL.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/23/2022 16:16:10'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^Habitad cantidadDeHuevosO.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/23/2022 16:25:27'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^Habitad cantidadDeHuevosO ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/23/2022 16:24:32'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^Habitad cantidadDeHuevosP! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 19:54:54'!
habitat
	^Habitad.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 20:51:28'!
hacerQueElHabitatTengaLosRecursosSuficientes
	99 timesRepeat: [ Habitad agregarOruga ].
	99 timesRepeat: [ Habitad agregarPolilla ].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/23/2022 16:28:48'!
laAvispaLara
	^AvispaLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 19:56:19'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 20:27:56'!
laAvispaOrnella
	^AvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 20:32:27'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 20:17:21'!
queElHabitatTengaDosOrugasMas
	Habitad agregarOruga.
	Habitad agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/23/2022 16:06:22'!
queElHabitatTengaDosPolillasMas
	Habitad agregarPolilla.
	Habitad agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 20:25:25'!
queElHabitatTengaUnaOrugaMas
	Habitad agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/23/2022 16:05:19'!
queElHabitatTengaUnaPolillaMas
	Habitad agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'iv 4/21/2022 20:03:28'!
retrocederElHabitatAlInicioDeLosTiempos
	Habitad retrocederAlInicioDeLosTiempos.! !

Habitad initializeAfterFileIn!