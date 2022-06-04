!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'jmd 6/3/2022 19:36:42'!
test08IncomingTransferIncreasesBalanceOnTransferValue

	| aReceiverAccount aSenderAccount transferValue |
	aReceiverAccount := ReceptiveAccount  new.
	aSenderAccount := ReceptiveAccount  new.
	transferValue := 50 * peso.
	Transfer send: transferValue from: aSenderAccount to: aReceiverAccount.
	
	self assert: transferValue equals: aReceiverAccount balance
! !

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'jmd 6/3/2022 19:36:42'!
test09OutgoingTransferDecreasesBalanceOnTransferValue

	| aReceiverAccount aSenderAccount transferValue |
	aReceiverAccount := ReceptiveAccount  new.
	aSenderAccount := ReceptiveAccount  new.
	transferValue := 100 * peso.
	Transfer send: transferValue from: aSenderAccount to: aReceiverAccount.
	Transfer send: transferValue from: aSenderAccount to: aReceiverAccount.
	Transfer send: transferValue from: aReceiverAccount to: aSenderAccount.
	
	self assert: transferValue equals: aReceiverAccount balance
! !

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'jmd 6/4/2022 19:53:32'!
test10IncomingTransferKnowsOutgoingTransfer

	| aReceiverAccount aSenderAccount aTransfer anIncomingTransfer |
	aReceiverAccount := ReceptiveAccount  new.
	aSenderAccount := ReceptiveAccount  new.
	aTransfer := Transfer send: 100 * peso from: aSenderAccount to: aReceiverAccount.
	anIncomingTransfer := aTransfer incomingTransfer.
	self assert: anIncomingTransfer matchingTransfer equals: aTransfer outgoingTransfer.
! !

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'jmd 6/4/2022 19:53:21'!
test11OutgoingTransferKnowsIncomingTransfer

	| aReceiverAccount aSenderAccount aTransfer anOutgoingTransfer |
	aReceiverAccount := ReceptiveAccount  new.
	aSenderAccount := ReceptiveAccount  new.
	aTransfer := Transfer send: 100 * peso from: aSenderAccount to: aReceiverAccount.
	anOutgoingTransfer := aTransfer outgoingTransfer.
	self assert: anOutgoingTransfer matchingTransfer equals: aTransfer incomingTransfer.
! !


!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'initialization' stamp: 'jmd 6/3/2022 18:57:48'!
initializeFor: aValue

	value := aValue! !


!AccountTransaction methodsFor: 'accessing' stamp: 'jmd 6/3/2022 19:36:03'!
impactBalace: aBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'accessing' stamp: 'jmd 6/3/2022 19:35:40'!
value 

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'jmd 6/3/2022 18:58:53'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'accessing' stamp: 'jmd 6/3/2022 18:49:54'!
impactBalace: aBalance 
	^aBalance + self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'accessing' stamp: 'jmd 6/3/2022 18:50:51'!
impactBalace: aBalance 
	^aBalance - self value! !


!classDefinition: #AccountTransfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransfer methodsFor: 'initialization' stamp: 'jmd 6/3/2022 19:49:11'!
initializeFor: aTransfer

	transfer := aTransfer! !


!AccountTransfer methodsFor: 'accessing' stamp: 'jmd 6/3/2022 19:42:06'!
impactBalace: aBalance

	self subclassResponsibility.! !

!AccountTransfer methodsFor: 'accessing' stamp: 'jmd 6/3/2022 19:49:43'!
value 

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer class
	instanceVariableNames: ''!

!AccountTransfer class methodsFor: 'instance creation' stamp: 'jmd 6/3/2022 19:48:58'!
for: aTransfer

	^ self new initializeFor: aTransfer ! !

!AccountTransfer class methodsFor: 'instance creation' stamp: 'jmd 6/3/2022 19:50:28'!
register: aTransfer on: account

	| transaction |
	
	transaction := self for: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #IncomingTransfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer subclass: #IncomingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!IncomingTransfer methodsFor: 'accessing' stamp: 'jmd 6/3/2022 19:31:29'!
impactBalace: aBalance

	^aBalance + transfer value.! !

!IncomingTransfer methodsFor: 'accessing' stamp: 'jmd 6/4/2022 19:48:29'!
matchingTransfer
	^transfer outgoingTransfer.! !


!classDefinition: #OutgoingTransfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer subclass: #OutgoingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!OutgoingTransfer methodsFor: 'accessing' stamp: 'jmd 6/3/2022 19:31:18'!
impactBalace: aBalance 
	^aBalance - transfer value.! !

!OutgoingTransfer methodsFor: 'accessing' stamp: 'jmd 6/4/2022 19:49:06'!
matchingTransfer
	^transfer incomingTransfer.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'jmd 6/3/2022 18:49:21'!
balance

	^transactions inject: 0 into: [ :aBalance :aTransaction | aTransaction impactBalace: aBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'anIncomingTransfer anOutgoingTransfer value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'accessing' stamp: 'jmd 6/4/2022 19:49:24'!
incomingTransfer
	^anIncomingTransfer ! !

!Transfer methodsFor: 'accessing' stamp: 'jmd 6/4/2022 19:48:46'!
outgoingTransfer
	^anOutgoingTransfer.! !

!Transfer methodsFor: 'accessing' stamp: 'jmd 6/4/2022 19:54:25'!
value

	^value! !


!Transfer methodsFor: 'initialization' stamp: 'jmd 6/4/2022 19:31:39'!
initializeSend: transferValue from: aSenderAccount to: aReceiverAccount

	anIncomingTransfer := IncomingTransfer register: self on: aReceiverAccount.
	anOutgoingTransfer := OutgoingTransfer register: self on: aSenderAccount.
	value := transferValue.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'jmd 6/4/2022 19:35:30'!
send: transferValue from: aSenderAccount to: aReceiverAccount
	^self new initializeSend: transferValue from: aSenderAccount to: aReceiverAccount ! !
