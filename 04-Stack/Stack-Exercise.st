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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:11:10'!
createStackWith10Elements
	| aStack |
	aStack := OOStack new.
	aStack push: 'Fuego tiene'. "Partial match"
	aStack push: 'Fuego tiene?'. "Exact match"
	aStack push: 'Fuego tiene?Lampone sos un dulce de leche'. "Correct prefix"
	aStack push: 'Fuego tiene?Lampone sos un dulce de leche'. "Repeated sentence"
	aStack push: 'fuego tiene?'. "Testing cap sensitivity"
	aStack push: 'got milk?'. "Testing mismatch on first character"
	aStack push: ' Fuego tiene?'. "Testing correct sentence preceded by whitespace"
	aStack push: 'Lampone se la come o-oo-o-o. Fuego tiene?'. "Testing correct sentence preceded by text"
	aStack push: ' '. "Testing string with only whitespace"
	aStack push: ''. "Testing an empty string"
	^aStack! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:10:40'!
createStackWith7ElementsWithTheSamePrefix
	| aStack |
	
	aStack := OOStack new.
	{ 'win'. 'winter'. 'winner'. 'winter is coming'. 'windy'. 'winnable'. 'winter is windy' } do: [ :aSentence | aStack push: aSentence ].
	"
	aStack push: 'win'. 
	aStack push: 'winter'. 
	aStack push: 'winner'. 
	aStack push: 'winter is coming'.
	aStack push: 'windy'.
	aStack push: 'winnable'.
	aStack push: 'winter is windy'. "
	^aStack! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 01:21:10'!
notasParaTests
"
Hacer pruebas con prefijo '' y prefijo '   ', entre otros.
Hay que hacer pruebas con distintos tamaños de stack:
	stack vacío
	stack con un elemento
	stack con varios elementos
Para los distintos tamaños de stack probar:
	prefijo con ningun elemento coincidente
	prefijo con un unico elemento coincidente
	prefijo con muchos elementos coincidentes
	prefijo con todos los elementos coincidentes
Probar todos los casos que se mencionan en #createStack10Elements
"! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 15:58:09'!
test01StackVacioNoEncuentraCoincidentes

	| anEmptyStack matches |
	
	anEmptyStack := OOStack new.
	
	matches := SentenceFinderByPrefix new find: 'Si está bien hecho no' inStack: anEmptyStack.
	
	self assert: matches isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 15:58:16'!
test02PrefixVacioLevantaError

	| anEmptyStack |
	
	anEmptyStack := OOStack new.
	
	self should: [ SentenceFinderByPrefix new find: '' inStack: anEmptyStack ]
		raise:  Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidSyntaxErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 15:58:22'!
test03PrefixConWhitespaceLevantaError

	| anEmptyStack |
	
	anEmptyStack := OOStack new.
	
	self should: [ SentenceFinderByPrefix new find: ' 					 ' inStack: anEmptyStack ]
		raise:  Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidSyntaxErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:11:10'!
test04FinderNoModificaAlStackSiNoHayCoincidentes

	| aStack anotherStack |
	
	aStack := self createStackWith10Elements.
	anotherStack := self createStackWith10Elements.
	
	SentenceFinderByPrefix new find: 'Osias el osito mameluco' inStack: aStack.
	
	[aStack isEmpty] whileFalse: [ self assert: aStack pop = anotherStack pop ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:11:10'!
test05FinderNoModificaAlStackSiHayCoincidentes

	| aStack anotherStack |
	
	aStack := self createStackWith10Elements.
	anotherStack := self createStackWith10Elements.
	
	SentenceFinderByPrefix new find: 'Fuego tiene?' inStack: aStack.
	
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:11:10'!
test08FinderEncuentraCoincidenciasStackMultiplesElementos

	| aStack aStringToMatch matches |
	
	aStringToMatch := 'Fuego tiene'.
	aStack := self createStackWith10Elements.
	matches := OrderedCollection new.
	
	matches add: 'Fuego tiene'.
	matches add: 'Fuego tiene?'.
	matches add: 'Fuego tiene?Lampone sos un dulce de leche'.
	matches add: 'Fuego tiene?Lampone sos un dulce de leche'.

	self assert: (SentenceFinderByPrefix new find: aStringToMatch inStack: aStack) = matches.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:11:10'!
test09FinderNoEncuentraCoincidenciasStackMultiplesElementos

	| aStack |
	
	aStack := self createStackWith10Elements.

	self assert: (SentenceFinderByPrefix new find: 'Que' inStack: aStack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:10:56'!
test10FinderEncuentraCoincidenciasStackTodosLosElementos

	| aStack aStringToMatch matches |
	
	aStringToMatch := 'win'.
	aStack := self createStackWith7ElementsWithTheSamePrefix.
	matches := OrderedCollection new.
	
	{ 'win'. 'winter'. 'winner'. 'winter is coming'. 'windy'. 'winnable'. 'winter is windy' } do: [ :aSentence | matches add: aSentence ].
	
	self assert: (SentenceFinderByPrefix new find: aStringToMatch inStack: aStack) = matches.! !


!classDefinition: #EmptyStackStatus category: 'Stack-Exercise'!
Object subclass: #EmptyStackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:39:55'!
initializeWith: aNewStack! !

!EmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:21:29'!
pop

	^self error: OOStack stackEmptyErrorDescription! !

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

!EmptyStackStatus class methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:21:53'!
with: aNewStack

	^self new initializeWith: aNewStack! !


!classDefinition: #NonEmptyStackStatus category: 'Stack-Exercise'!
Object subclass: #NonEmptyStackStatus
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:22:16'!
initializeWith: aNewStack

	aStack := aNewStack! !

!NonEmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:22:06'!
pop

	^aStack safePop! !

!NonEmptyStackStatus methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:22:10'!
top

	^aStack safeTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStackStatus class' category: 'Stack-Exercise'!
NonEmptyStackStatus class
	instanceVariableNames: ''!

!NonEmptyStackStatus class methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:41:00'!
statusIsValidFor: aStack

	^aStack isEmpty not! !

!NonEmptyStackStatus class methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:22:00'!
with: aNewStack

	^self new initializeWith: aNewStack! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'iv 5/14/2022 11:24:55'!
initialize

	collection := OrderedCollection new.! !

!OOStack methodsFor: 'private' stamp: 'iv 5/14/2022 11:24:55'!
safePop
	
	^collection removeLast.! !

!OOStack methodsFor: 'private' stamp: 'iv 5/14/2022 11:24:55'!
safeTop

	^collection at: collection size.
	! !

!OOStack methodsFor: 'private' stamp: 'iv 5/14/2022 15:02:00'!
status

	{EmptyStackStatus. NonEmptyStackStatus} detect: [ :stackStatus | stackStatus statusIsValidFor: self ] ifFound: [ :stackStatus | ^stackStatus with: self ] ifNone: [ self error: OOStack stackStatusErrorDescription ].! !


!OOStack methodsFor: 'public methods' stamp: 'iv 5/14/2022 11:24:55'!
isEmpty
	
	^collection isEmpty.! !

!OOStack methodsFor: 'public methods' stamp: 'iv 5/14/2022 15:02:00'!
pop

	^self status pop.! !

!OOStack methodsFor: 'public methods' stamp: 'iv 5/14/2022 11:25:59'!
push: anElement
	
	collection add: anElement.! !

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

!OOStack class methodsFor: 'error descriptions' stamp: 'iv 5/14/2022 11:33:31'!
stackStatusErrorDescription
	
	^ 'Stack status is invalid'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 16:14:28'!
find: aPrefix inStack: aStackOfSentences

	| aCollectionOfSentences |
	
	aPrefix withBlanksTrimmed = '' 
		ifTrue: [self error: SentenceFinderByPrefix invalidSyntaxErrorDescription].

	aCollectionOfSentences	:= OrderedCollection new.
	
	[aStackOfSentences isEmpty ] whileFalse: [aCollectionOfSentences addFirst: aStackOfSentences pop].
	
	aCollectionOfSentences do: [:aSentence | aStackOfSentences push: aSentence].
	^aCollectionOfSentences select: [:anotherSentence | anotherSentence beginsWith: aPrefix].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:00:39'!
invalidSyntaxErrorDescription
^'The prefix must contain at least one non whitespace character'! !
