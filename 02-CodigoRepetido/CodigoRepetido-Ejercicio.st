!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 4/30/2022 20:07:33'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self test: [CustomerBook new addCustomerNamed: 'John Lennon'.] ShouldNotTakeMoreThan: 50 * millisecond.

"
CODIGO ORIGINAL:
	| customerBook millisecondsBeforeRunning millisecondsAfterRunning |
	
	customerBook := CustomerBook new.
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (50 * millisecond)
"
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 5/1/2022 20:18:54'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	|customerBook|
	
	customerBook := 	self newCustomersBookWhithActiveCustomerCalled: 'Paul McCartney'.
	
	self test: [customerBook removeCustomerNamed: 'Paul McCartney'.] ShouldNotTakeMoreThan: 100 * millisecond.

"
CODIGO ORIGINAL:
	| customerBook millisecondsBeforeRunning millisecondsAfterRunning paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (100 * millisecond)
	
"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 5/1/2022 21:20:24'!
test03CanNotAddACustomerWithEmptyName 
	
	| customerBook |
	
	customerBook := CustomerBook new.
	
	self run: [customerBook addCustomerNamed: ''] errorMessageIs: [CustomerBook customerCanNotBeEmptyErrorMessage] assertIsTrue: [customerBook isEmpty] assertIsTrue: [1=1] errorTipe: Error.
	
"
CODIGO ORIGINAL:

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 5/1/2022 21:20:45'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook |
			
	customerBook := self newCustomersBookWhithActiveCustomerCalled: 'johnLennon'.
	
	self run: [customerBook removeCustomerNamed: 'Paul McCartney'] errorMessageIs: [nil] assertIsTrue: [customerBook numberOfCustomers = 1] assertIsTrue: [ (customerBook includesCustomerNamed: 'johnLennon')] errorTipe: NotFound.

"
CODIGO ORIGINAL:
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 5/1/2022 20:17:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := self newCustomersBookWhithSuspendedCustomerCalled: 'Paul McCartney'.

	self check: customerBook numberOfActiveCustomers: 0 numberOfSuspendedCustomers: 1 numberOfCustomers: 1.
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').


"
CODIGO ORIGINAL:
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 5/1/2022 20:17:39'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := self newCustomersBookWhithSuspendedCustomerCalled: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self check: customerBook numberOfActiveCustomers: 0 numberOfSuspendedCustomers: 0 numberOfCustomers: 0.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').
	
	
"
CODIGO ORIGINAL:
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).

"
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 5/1/2022 21:21:06'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook :=  self newCustomersBookWhithActiveCustomerCalled: 'John Lennon'.
	
	self run: [customerBook suspendCustomerNamed: 'Ringo Starr'.] errorMessageIs: [nil] assertIsTrue: [customerBook numberOfCustomers = 1] assertIsTrue: [(customerBook includesCustomerNamed: 'John Lennon')] errorTipe: CantSuspend.
	

"
CODIGO ORGINIAL:
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IV 5/1/2022 21:21:17'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customerBook |
			
	customerBook := self newCustomersBookWhithSuspendedCustomerCalled: 'John Lennon'.

	self run: [customerBook suspendCustomerNamed: 'John Lennon'] errorMessageIs: [nil] assertIsTrue: [customerBook numberOfCustomers = 1.] assertIsTrue: [(customerBook includesCustomerNamed: 'John Lennon')] errorTipe: CantSuspend.

"
CODIGO ORGINIAL:
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
"! !


!CustomerBookTest methodsFor: 'abstractions' stamp: 'IV 5/1/2022 19:28:27'!
check: customerBook numberOfActiveCustomers: numberActiveCustomers numberOfSuspendedCustomers: numberSuspendedCustomers numberOfCustomers: numberCustomers
	
	self assert: numberActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: numberSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: numberCustomers equals: customerBook numberOfCustomers.
	! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'IV 5/1/2022 20:13:44'!
newCustomersBookWhithActiveCustomerCalled: nameOfCustomer

	^CustomerBook new addCustomerNamed: nameOfCustomer! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'IV 5/1/2022 20:16:48'!
newCustomersBookWhithSuspendedCustomerCalled: nameOfCustomer

	| customerBook |
	
	customerBook := self newCustomersBookWhithActiveCustomerCalled: nameOfCustomer.
	customerBook suspendCustomerNamed: nameOfCustomer.
	
	^customerBook! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'IV 5/1/2022 21:19:53'!
run: aBlock errorMessageIs: errorMessage assertIsTrue: affirmation1 assertIsTrue: affirmation2 errorTipe: errorTipe

	[ aBlock value.
	self fail ]
		on: errorTipe 
		do: [ :anError | 
			self assert: anError messageText = errorMessage value .
			self assert: affirmation1 value.
			self assert: affirmation2 value. ]
! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'IV 4/30/2022 20:08:10'!
test: aBlock ShouldNotTakeMoreThan: anAmountOfTime

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (anAmountOfTime)
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'IV 4/30/2022 19:38:05'!
removeCustomerNamed: aName 

	(active includes: aName)
		 ifTrue: [ ^active remove: aName ].

	(suspended includes: aName)
		 ifTrue: [ ^suspended remove: aName ].

	^ NotFound signal.
	
 "
CODIGO ORIGINAL:

	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].

	^ NotFound signal.
"
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
