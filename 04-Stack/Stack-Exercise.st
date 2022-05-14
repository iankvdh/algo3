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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 01:21:40'!
createStack10Elements
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


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
Object subclass: #EmptyStack
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:51:35'!
initializeWith: aNewStack
	"comment stating purpose of message"
	aStack := aNewStack! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 21:06:29'!
pop
	"comment stating purpose of message"
	^self error: OOStack stackEmptyErrorDescription! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:44:20'!
top
	"comment stating purpose of message"
	^self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:51:13'!
isValidStack: aStack
	"comment stating purpose of message"
	^aStack isEmpty! !

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 21:00:26'!
with: aNewStack
	"comment stating purpose of message"
	^self new initializeWith: aNewStack! !


!classDefinition: #NonEmptyStack category: 'Stack-Exercise'!
Object subclass: #NonEmptyStack
	instanceVariableNames: 'aStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:52:47'!
initializeWith: aNewStack
	"comment stating purpose of message"
	aStack := aNewStack! !

!NonEmptyStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 21:06:43'!
pop
	"comment stating purpose of message"
	^aStack safePop! !

!NonEmptyStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:53:12'!
top
	"comment stating purpose of message"
	^aStack safeTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStack class' category: 'Stack-Exercise'!
NonEmptyStack class
	instanceVariableNames: ''!

!NonEmptyStack class methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:52:17'!
isValidStack: aStack
	"comment stating purpose of message"
	^aStack isEmpty not! !

!NonEmptyStack class methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 21:00:20'!
with: aNewStack
	"comment stating purpose of message"
	^self new initializeWith: aNewStack! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'IV 5/12/2022 13:53:22'!
initialize

	elements := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'IV 5/12/2022 13:53:22'!
isEmpty
	
	^elements isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 21:06:20'!
pop

	^self storageStatus pop.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 21:05:47'!
push: anElement
	
	elements addLast: anElement.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 21:06:00'!
safePop
	
	^elements removeLast.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:53:50'!
safeTop

	^elements at: elements size.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'IV 5/12/2022 13:53:22'!
size

	^elements size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:57:59'!
storageStatus
	{EmptyStack. NonEmptyStack} detect: [:status | status isValidStack: self ] ifFound: [:status | ^status with: self] ifNone: [].! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/12/2022 20:44:54'!
top

	^self storageStatus top.
	"
	^elements at: elements size.
	"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 00:55:02'!
find: aPrefix inStack: aStackOfSentences
	"comment stating purpose of message"
	| aCollectionOfSentences aSentence |
	aPrefix withBlanksTrimmed = '' 
		ifTrue: [self error: 'The prefix must contain at least one non whitespace character'].
	aCollectionOfSentences	:= OrderedCollection new.
	[aStackOfSentences isEmpty] whileFalse: 
		[aSentence := aStackOfSentences pop. 
		aCollectionOfSentences addFirst: aSentence].
	aCollectionOfSentences do: [:anotherSentence | aStackOfSentences push: anotherSentence].
	^aCollectionOfSentences select: [:anotherSentence | anotherSentence beginsWith: aPrefix].
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 00:43:15'!
findByPrefix: aPrefix inStack: aStackOfSentences
	"comment stating purpose of message"
	| aSentence matchingSentences |
	aPrefix withBlanksTrimmed = '' 
		ifTrue: [self error: 'The prefix must contain at least one non whitespace character'].
		
	aStackOfSentences isEmpty ifTrue: [^OrderedCollection new].
	aSentence := aStackOfSentences pop.
	matchingSentences := self findByPrefix: aPrefix inStack: aStackOfSentences.
	(aSentence beginsWith: aPrefix) ifTrue: [matchingSentences add: aSentence].
	aStackOfSentences push: aSentence.
	^matchingSentences
! !
