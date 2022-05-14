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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 08:52:33'!
test1StackVacioNoEncuentraCoincidentes
| anEmptyStack matches |
anEmptyStack := OOStack new.
matches := SentenceFinderByPrefix new find: 'Si está bien hecho no' inStack: anEmptyStack.
self assert: matches equals: OrderedCollection new.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:00:55'!
test2PrefixVacioLevantaError
| anEmptyStack |
anEmptyStack := OOStack new.
self
	should: [ SentenceFinderByPrefix new find: '' inStack: anEmptyStack ]
	raise:  Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix invalidSyntaxErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:01:31'!
test3PrefixConWhitespaceLevantaError
| anEmptyStack |
anEmptyStack := OOStack new.
self
	should: [ SentenceFinderByPrefix new find: ' 					 ' inStack: anEmptyStack ]
	raise:  Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix invalidSyntaxErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:08:06'!
test4FinderNoModificaAlStackSiNoHayCoincidentes
| aStack anotherStack |
aStack := self createStack10Elements.
anotherStack := self createStack10Elements.
SentenceFinderByPrefix new find: 'Osias el osito mameluco' inStack: aStack.
[aStack isEmpty] whileFalse: 
	[ self assert: aStack pop = anotherStack pop ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:08:45'!
test5FinderNoModificaAlStackSiHayCoincidentes
| aStack anotherStack |
aStack := self createStack10Elements.
anotherStack := self createStack10Elements.
SentenceFinderByPrefix new find: 'Fuego tiene?' inStack: aStack.
[aStack isEmpty] whileFalse: 
	[ self assert: aStack pop = anotherStack pop ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:23:43'!
test6FinderEncuentraCoincidenciaStack1Elemento
| aStack aStringToMatch matches |
aStringToMatch := 'Queres una naranja?'.
aStack := OOStack new push: aStringToMatch.
matches := OrderedCollection new.
matches add: aStringToMatch.
self assert: (SentenceFinderByPrefix new find: 'Que' inStack: aStack) = matches.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:21:03'!
test7FinderNoEncuentraCoincidenciaStack1Elemento
| aStack aStringToMatch |
aStringToMatch := 'Uhhhhh, _pepitas_'.
aStack := OOStack new push: aStringToMatch.
self assert: (SentenceFinderByPrefix new find: 'Que' inStack: aStack) = (OrderedCollection new).
! !


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
safePop
	
	^collection removeLast.! !

!OOStack methodsFor: 'private' stamp: 'iv 5/14/2022 11:24:55'!
safeTop

	^collection at: collection size.
	! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:24:55'!
initialize

	collection := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:24:55'!
isEmpty
	
	^collection isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:25:26'!
pop

	^self stackStatus pop.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:25:59'!
push: anElement
	
	collection add: anElement.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:24:55'!
size

	^collection size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:35:43'!
stackStatus

	{EmptyStackStatus. NonEmptyStackStatus} detect: [ :stackStatus | stackStatus statusIsValidFor: self ] ifFound: [ :stackStatus | ^stackStatus with: self ] ifNone: [ self error: OOStack stackStatusErrorDescription ].! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'iv 5/14/2022 11:25:26'!
top

	^self stackStatus top.
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

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:00:39'!
find: aPrefix inStack: aStackOfSentences
	"comment stating purpose of message"
	| aCollectionOfSentences aSentence |
	aPrefix withBlanksTrimmed = '' 
		ifTrue: [self error: SentenceFinderByPrefix invalidSyntaxErrorDescription].
	aCollectionOfSentences	:= OrderedCollection new.
	[aStackOfSentences isEmpty] whileFalse: 
		[aSentence := aStackOfSentences pop. 
		aCollectionOfSentences addFirst: aSentence].
	aCollectionOfSentences do: [:anotherSentence | aStackOfSentences push: anotherSentence].
	^aCollectionOfSentences select: [:anotherSentence | anotherSentence beginsWith: aPrefix].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'jmd 5/14/2022 09:00:39'!
invalidSyntaxErrorDescription
^'The prefix must contain at least one non whitespace character'! !
