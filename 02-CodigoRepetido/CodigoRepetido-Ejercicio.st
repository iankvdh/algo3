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

!CustomerBookTest methodsFor: 'testing' stamp: 'md 5/2/2022 01:06:53'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	|customerBook|
	
	customerBook := 	self newCustomersBookWhithActiveCustomer: 'Paul McCartney'.
	
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

!CustomerBookTest methodsFor: 'testing' stamp: 'md 5/2/2022 01:39:39'!
test03CanNotAddACustomerWithEmptyName 
	
	| customerBook |
	
	customerBook := CustomerBook new.

	self assertClosure: [customerBook addCustomerNamed: ''] RaisesError: [CustomerBook customerCanNotBeEmptyErrorMessage] ofType: Error andCondition: [customerBook isEmpty].
	
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

!CustomerBookTest methodsFor: 'testing' stamp: 'iv 5/2/2022 10:46:26'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook |
			
	customerBook := self newCustomersBookWhithActiveCustomer: 'John Lennon'.
	
	self assertClosure: [customerBook removeCustomerNamed: 'Paul McCartney'] RaisesError: [nil] ofType: NotFound andCondition: [customerBook numberOfCustomers = 1 and: (customerBook includesCustomerNamed: 'John Lennon')].

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

!CustomerBookTest methodsFor: 'testing' stamp: 'md 5/2/2022 01:18:44'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := self newCustomersBookWithSuspendedCustomer: 'Paul McCartney'.

	self assertCustomerBook: customerBook ActiveCustomers: 0 SuspendedCustomers: 1.
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

!CustomerBookTest methodsFor: 'testing' stamp: 'md 5/2/2022 01:18:52'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := self newCustomersBookWithSuspendedCustomer: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assertCustomerBook: customerBook ActiveCustomers: 0 SuspendedCustomers: 0.
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

!CustomerBookTest methodsFor: 'testing' stamp: 'md 5/2/2022 01:39:39'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook :=  self newCustomersBookWhithActiveCustomer: 'John Lennon'.
	
	self assertClosure: [customerBook suspendCustomerNamed: 'Ringo Starr'.] RaisesError: [nil] ofType: CantSuspend andCondition: [customerBook numberOfCustomers = 1 and: (customerBook includesCustomerNamed: 'John Lennon')].
	

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

!CustomerBookTest methodsFor: 'testing' stamp: 'md 5/2/2022 01:39:39'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customerBook |
			
	customerBook := self newCustomersBookWithSuspendedCustomer: 'John Lennon'.

	self assertClosure: [customerBook suspendCustomerNamed: 'John Lennon'] RaisesError: [nil] ofType: CantSuspend andCondition: [customerBook numberOfCustomers = 1 and: (customerBook includesCustomerNamed: 'John Lennon')].

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


!CustomerBookTest methodsFor: 'abstractions' stamp: 'md 5/2/2022 01:39:39'!
assertClosure: aBlock RaisesError: errorMessage ofType: errorType andCondition: affirmation

	[ aBlock value.
	self fail ]
		on: errorType 
		do: [ :anError | 
			self assert: anError messageText = errorMessage value .
			self assert: affirmation value. ]
! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'md 5/2/2022 01:15:43'!
assertCustomerBook: aCustomerBook ActiveCustomers: numberActiveCustomers SuspendedCustomers: numberSuspendedCustomers
	
	self assert: numberActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberSuspendedCustomers + numberActiveCustomers equals: aCustomerBook numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'md 5/2/2022 01:06:53'!
newCustomersBookWhithActiveCustomer: nameOfCustomer

	^CustomerBook new addCustomerNamed: nameOfCustomer! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'md 5/2/2022 01:06:53'!
newCustomersBookWithSuspendedCustomer: nameOfCustomer

	| customerBook |
	
	customerBook := self newCustomersBookWhithActiveCustomer: nameOfCustomer.
	customerBook suspendCustomerNamed: nameOfCustomer.
	
	^customerBook! !

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


!CustomerBook methodsFor: 'customer management' stamp: 'md 5/2/2022 00:57:22'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'md 5/2/2022 00:58:25'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

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
