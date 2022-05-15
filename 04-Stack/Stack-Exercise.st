!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'iv 5/14/2022 16:33:40'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self assertThatABlock: [ stack pop ] ShouldRaise: [ OOStack stackEmptyErrorDescription ].
		
! !

!OOStackTest methodsFor: 'test' stamp: 'iv 5/14/2022 16:32:47'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assertThatABlock: [  stack pop ] ShouldRaise: [ OOStack stackEmptyErrorDescription ].
		
! !

!OOStackTest methodsFor: 'test' stamp: 'iv 5/14/2022 16:32:16'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self assertThatABlock: [ stack top ] ShouldRaise: [ OOStack stackEmptyErrorDescription ].
! !


!OOStackTest methodsFor: 'private' stamp: 'iv 5/14/2022 16:31:50'!
assertThatABlock: aBlock ShouldRaise: anErrorBlock

	self
		should: aBlock 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = anErrorBlock value ]! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:37:01'!
createStackWith10Elements
	| aCollectionOfSentences |
	
	aCollectionOfSentences := OrderedCollection new.
	{
		'Fue'. "Exact match"
		' Fue'. "Leading whitespace"
		'Fu'. "Partial match"
		'Fuego tiene?'. "Correct prefix"
		'Fuego tiene?'. "Repeated sentence"
		'fuego tiene?'. "Testing cap sensitivity"
		'got milk?'. "Testing mismatch on first character"
		'Lampone se la come o-oo-o-o. Fuego tiene?'. "prefix preceded by text"
		' '. "Testing string with only whitespace"
		''. "Testing an empty string"
	} do: [ :aSentence | aCollectionOfSentences add: aSentence ].
	
	^self createStackWithSentences: aCollectionOfSentences.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:01:31'!
createStackWithSentences: aCollectionOfSentences
	| aStack |
	
	aStack := OOStack new.
	aCollectionOfSentences do: [ :aSentence | aStack push: aSentence ].
	^aStack! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 22:48:49'!
test01StackVacioNoEncuentraCoincidentes

	| anEmptyStack matches |
	
	anEmptyStack := OOStack new.
	
	matches := SentenceFinderByPrefix new find: 'MaximoCozzetti' inStack: anEmptyStack.
	
	self assert: matches isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 15:58:16'!
test02PrefixVacioLevantaError

	| anEmptyStack |
	
	anEmptyStack := OOStack new.
	
	self should: [ SentenceFinderByPrefix new find: '' inStack: anEmptyStack ]
		raise:  Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidSyntaxErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 22:49:02'!
test03PrefixConWhitespaceLevantaError

	| anEmptyStack |
	
	anEmptyStack := OOStack new.
	
	self should: [ SentenceFinderByPrefix new find: 'Si está bien hecho no' inStack: anEmptyStack ]
		raise:  Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidSyntaxErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:59:14'!
test04FinderNoModificaAlStackSiNoHayCoincidentes

	| aStack anotherStack |
	
	aStack := self createStackWith10Elements.
	anotherStack := self createStackWith10Elements.
	
	SentenceFinderByPrefix new find: 'OsiasElOsitoMameluco' inStack: aStack.
	
	[aStack isEmpty] whileFalse: [ self assert: aStack pop = anotherStack pop ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:37:01'!
test05FinderNoModificaAlStackSiHayCoincidentes

	| aStack anotherStack |
	
	aStack := self createStackWith10Elements.
	anotherStack := self createStackWith10Elements.
	
	SentenceFinderByPrefix new find: 'Fue' inStack: aStack.
	
	[aStack isEmpty] whileFalse: [ self assert: aStack pop = anotherStack pop ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 15:58:40'!
test06FinderEncuentraCoincidenciaStack1Elemento

	| aStack aStringToMatch matches |
	
	aStringToMatch := 'Queres una naranja?'.
	aStack := OOStack new push: aStringToMatch.
	matches := OrderedCollection new.
	
	matches add: aStringToMatch.
	
	self assert: (SentenceFinderByPrefix new find: 'Que' inStack: aStack) = matches.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 15:58:46'!
test07FinderNoEncuentraCoincidenciaStack1Elemento

	| aStack aStringToMatch |
	
	aStringToMatch := 'Uhhhhh, _pepitas_'.
	aStack := OOStack new push: aStringToMatch.
	
	self assert: (SentenceFinderByPrefix new find: 'Que' inStack: aStack) isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:46:26'!
test08PrefixEnLowercaseNoCoincideConStringEnUppercase

	| aStack aStringToMatch |
	
	aStringToMatch := 'Uhhhhh, _pepitas_'.
	aStack := OOStack new push: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'uhhh' inStack: aStack) isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:46:37'!
test09PrefixEnUppercaseNoCoincideConStringEnLowercase

	| aStack aStringToMatch |
	
	aStringToMatch := 'uhhhhh, _pepitas_'.
	aStack := OOStack new push: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'Uhhh' inStack: aStack) isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:48:22'!
test10EncuentraOracionExactamenteIgualAlPrefix

	| aStack aStringToMatch matches |
	
	aStringToMatch := 'MrTicTac'.
	aStack := OOStack new.
	aStack push: aStringToMatch.
	matches := OrderedCollection new.
	matches add: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'MrTicTac' inStack: aStack) = matches.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:46:13'!
test11NoEncuentraPrefixEnOracionQueEmpiezaConWhitespace

	| aStack aStringToMatch |
	
	aStringToMatch := ' MrTicTac'.
	aStack := OOStack new push: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'MrTic' inStack: aStack) isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:46:02'!
test12NoEncuentraMatchesSiSoloParteDelPrefixCoincide

	| aStack aStringToMatch |
	
	aStringToMatch := 'LosSimuladores'.
	aStack := OOStack new push: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'LosEngañadores' inStack: aStack) isEmpty .
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:45:49'!
test13NoEncuentraMatchesSiElPrefixEstaPeroNoAlInicio

	| aStack aStringToMatch |
	
	aStringToMatch := 'Se pronuncia milazo o milazzo como la pizza?'.
	aStack := OOStack new push: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'mila' inStack: aStack) isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:50:09'!
test14NoEncuentraPrefixEnOracionVacia

	| aStack aStringToMatch |
	
	aStringToMatch := ''.
	aStack := OOStack new push: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'YaNo.' inStack: aStack) isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:50:38'!
test15NoEncuentraPrefixEnOracionFormadaSoloPorWhitespace

	| aStack aStringToMatch |
	
	aStringToMatch := '   '.
	aStack := OOStack new push: aStringToMatch.
	self assert: (SentenceFinderByPrefix new find: 'YaNo.' inStack: aStack) isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:56:01'!
test16SiLaOracionEstaRepetidaLaEncuentraMultiplesVeces
	| aStack aStringToMatch aCollectionOfSentences |
	
	aStringToMatch := 'Usted'.
	aCollectionOfSentences := OrderedCollection new.
	{ 'Usted se tiene que hacer cargo de lo que generó en mi'. 'Usted se tiene que hacer cargo de lo que generó en mi' } do: [ :aSentence | aCollectionOfSentences add: aSentence ].
	
	aStack := self createStackWithSentences: aCollectionOfSentences.
	
	self assert: (SentenceFinderByPrefix new find: aStringToMatch inStack: aStack) = aCollectionOfSentences.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:53:35'!
test17NoEncuentraMatchesSiNoCoincidenStackMultiplesElementos

	| aStack |
	
	aStack := self createStackWith10Elements.

	self assert: (SentenceFinderByPrefix new find: 'tiene?' inStack: aStack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:58:26'!
test18EncuentraAlgunasCoincidenciasEnStackConMultiplesElementos

	| aStack aStringToMatch matches |
	
	aStringToMatch := 'Fue'.
	aStack := self createStackWith10Elements.
	matches := OrderedCollection new.
	matches add: 'Fue'.
	matches add: 'Fuego tiene?'.
	matches add: 'Fuego tiene?'.
		
	self assert: (SentenceFinderByPrefix new find: aStringToMatch inStack: aStack) = matches.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 23:53:30'!
test19EncuentraTodosLosElementosSiTodosCoinciden

	| aStack aStringToMatch aCollectionOfSentences |
	
	aStringToMatch := 'win'.
	aCollectionOfSentences := OrderedCollection new.
	{ 'win'. 'winter'. 'winner'. 'winter is coming'. 'windy'. 'winnable'. 'winter is windy' } do: [ :aSentence | aCollectionOfSentences add: aSentence ].
	
	aStack := self createStackWithSentences: aCollectionOfSentences.
	
	self assert: (SentenceFinderByPrefix new find: aStringToMatch inStack: aStack) = aCollectionOfSentences.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'jmd 5/15/2022 00:51:08'!
initialize
	self initializeWithFixedCapacity: Float infinity! !

!OOStack methodsFor: 'private' stamp: 'jmd 5/15/2022 00:50:10'!
initializeWithFixedCapacity: givenCapacity

	collection := OrderedCollection new.
	capacity := givenCapacity! !

!OOStack methodsFor: 'private' stamp: 'iv 5/14/2022 11:24:55'!
safePop
	
	^collection removeLast.! !

!OOStack methodsFor: 'private' stamp: 'jmd 5/15/2022 00:35:18'!
safePush: anElement
	
	collection add: anElement.! !

!OOStack methodsFor: 'private' stamp: 'iv 5/14/2022 11:24:55'!
safeTop

	^collection at: collection size.
	! !

!OOStack methodsFor: 'private' stamp: 'jmd 5/15/2022 00:41:44'!
status

	StackStatus subclasses detect: [ :stackStatus | stackStatus statusIsValidFor: self ] ifFound: [ :stackStatus | ^stackStatus with: self ] ifNone: [ self error: OOStack stackStatusErrorDescription ].! !


!OOStack methodsFor: 'public methods' stamp: 'jmd 5/15/2022 00:43:17'!
capacity

	^capacity.! !

!OOStack methodsFor: 'public methods' stamp: 'iv 5/14/2022 11:24:55'!
isEmpty
	
	^collection isEmpty.! !

!OOStack methodsFor: 'public methods' stamp: 'iv 5/14/2022 15:02:00'!
pop

	^self status pop.! !

!OOStack methodsFor: 'public methods' stamp: 'jmd 5/15/2022 00:37:57'!
push: anElement

	^self status push: anElement.
	! !

!OOStack methodsFor: 'public methods' stamp: 'iv 5/14/2022 11:24:55'!
size

	^collection size.! !

!OOStack methodsFor: 'public methods' stamp: 'iv 5/14/2022 15:02:00'!
top

	^self status top.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'jmd 5/15/2022 00:11:29'!
stackFullErrorDescription
	
	^ 'Stack is full'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'iv 5/14/2022 11:33:31'!
stackStatusErrorDescription
	
	^ 'Stack status is invalid'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'jmd 5/15/2022 00:49:28'!
withMaxSize: capacity
	
	^OOStack new initializeWithFixedCapacity: capacity! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:53:01'!
find: aPrefix inStack: aStackOfSentences

	| aCollectionOfSentences |
	"abstraer código para mejorar legibilidad"	
	((aPrefix includesSubString: ' ') or: aPrefix = '')
		ifTrue: [ self error: SentenceFinderByPrefix invalidSyntaxErrorDescription ].

	aCollectionOfSentences	:= OrderedCollection new.
	"usar times repeat, sabiendo que va a iterar una cantidad de veces determinada por el size del Stack"
	[ aStackOfSentences isEmpty ] whileFalse: [ aCollectionOfSentences addFirst: aStackOfSentences pop ].
	
	aCollectionOfSentences do: [ :aSentence | aStackOfSentences push: aSentence ].
	^aCollectionOfSentences select: [ :anotherSentence | anotherSentence beginsWith: aPrefix ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 22:36:57'!
invalidSyntaxErrorDescription
^'The prefix cannot be empty nor contain whitespace characters'! !


!classDefinition: #StackStatus category: 'Stack-Exercise'!
Object subclass: #StackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackStatus class' category: 'Stack-Exercise'!
StackStatus class
	instanceVariableNames: ''!

!StackStatus class methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:14:18'!
statusIsValidFor: aStack

	self subclassResponsibility! !

!StackStatus class methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:15:14'!
with: aNewStack

	^self new initializeWith: aNewStack! !


!classDefinition: #EmptyStackStatus category: 'Stack-Exercise'!
StackStatus subclass: #EmptyStackStatus
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:09:41'!
initializeWith: aNewStack

	aStack := aNewStack! !

!EmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:21:29'!
pop

	^self error: OOStack stackEmptyErrorDescription! !

!EmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:10:47'!
push: anObject

	^aStack safePush: anObject! !

!EmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:21:36'!
top

	^self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackStatus class' category: 'Stack-Exercise'!
EmptyStackStatus class
	instanceVariableNames: ''!

!EmptyStackStatus class methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:40:42'!
statusIsValidFor: aStack

	^aStack isEmpty! !


!classDefinition: #FullStackStatus category: 'Stack-Exercise'!
StackStatus subclass: #FullStackStatus
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:09:27'!
initializeWith: aNewStack

	aStack := aNewStack! !

!FullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:09:21'!
pop

	^aStack safePop! !

!FullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:11:10'!
push: anObject

	^self error: OOStack stackFullErrorDescription! !

!FullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:09:24'!
top

	^aStack safeTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FullStackStatus class' category: 'Stack-Exercise'!
FullStackStatus class
	instanceVariableNames: ''!

!FullStackStatus class methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:58:15'!
statusIsValidFor: aStack

	^aStack size >= aStack capacity! !


!classDefinition: #NonEmptyNorFullStackStatus category: 'Stack-Exercise'!
StackStatus subclass: #NonEmptyNorFullStackStatus
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyNorFullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:09:51'!
initializeWith: aNewStack

	aStack := aNewStack! !

!NonEmptyNorFullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:09:55'!
pop

	^aStack safePop! !

!NonEmptyNorFullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:10:52'!
push: anObject

	^aStack safePush: anObject! !

!NonEmptyNorFullStackStatus methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:09:58'!
top

	^aStack safeTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyNorFullStackStatus class' category: 'Stack-Exercise'!
NonEmptyNorFullStackStatus class
	instanceVariableNames: ''!

!NonEmptyNorFullStackStatus class methodsFor: 'as yet unclassified' stamp: 'jmd 5/15/2022 00:56:46'!
statusIsValidFor: aStack

	^(EmptyStackStatus statusIsValidFor: aStack) not and: (FullStackStatus statusIsValidFor: aStack) not! !
