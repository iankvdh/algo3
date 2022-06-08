!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'aReceiverAccount aSenderAccount anAccount anOtherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'iv 6/7/2022 12:16:31'!
test08ATransferKnowsItsValue

	| aTransfer |
	
	aTransfer := Transfer send: 50 * peso from: aSenderAccount to: aReceiverAccount.
	
	self assert: 50 * peso equals: aTransfer value
! !

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'iv 6/7/2022 12:09:56'!
test09IncomingTransferIncreasesBalanceOnTransferValue

	| aTransfer |

	aTransfer := Transfer send: 50 * peso from: aSenderAccount to: aReceiverAccount.
	
	self assert: aTransfer value equals: aReceiverAccount balance
! !

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'iv 6/7/2022 12:16:36'!
test10OutgoingTransferDecreasesBalanceOnTransferValue

	| aTransfer |

	aTransfer :=Transfer send: 100 * peso from: aSenderAccount to: aReceiverAccount.

	self assert: aTransfer value negated equals: aSenderAccount balance! !

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'iv 6/7/2022 12:16:40'!
test11IncomingTransferKnowsOutgoingTransfer

	| aTransfer anIncomingTransfer |

	aTransfer := Transfer send: 100 * peso from: aSenderAccount to: aReceiverAccount.
	anIncomingTransfer := aTransfer incomingTransfer.
	
	self assert: anIncomingTransfer matchingTransfer equals: aTransfer outgoingTransfer.
! !

!ReceptiveAccountTest methodsFor: 'transfer tests' stamp: 'iv 6/7/2022 12:16:48'!
test12OutgoingTransferKnowsIncomingTransfer

	|  aTransfer anOutgoingTransfer |
	
	aTransfer := Transfer send: 100 * peso from: aSenderAccount to: aReceiverAccount.
	anOutgoingTransfer := aTransfer outgoingTransfer.
	
	self assert: anOutgoingTransfer matchingTransfer equals: aTransfer incomingTransfer.
! !


!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'iv 6/7/2022 12:13:03'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'iv 6/7/2022 12:13:22'!
test02DepositIncreasesBalanceOnTransactionValue 


	Deposit register: 100 * peso on: anAccount.
		
	self assert: 100 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'iv 6/7/2022 12:13:51'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anAccount.
		
	self assert: 50 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'iv 6/7/2022 12:14:35'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: anAccount) value
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'iv 6/7/2022 12:14:59'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := Deposit register: 100 * peso on: anAccount.
	withdraw := Withdraw register: 50 * peso on: anAccount.
		
	self assert: (anAccount hasRegistered: deposit).
	self assert: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'iv 6/7/2022 12:15:16'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (anAccount hasRegistered: deposit).
	self deny: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'transaction tests' stamp: 'iv 6/7/2022 12:15:57'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	deposit := Deposit register: 50 * peso on: anAccount.
		
	self assert: 1 equals: anAccount transactions size.
	self assert: (anAccount transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:23:29'!
test13BalnceOfAEmptyPortfolioIsZero

	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self assert: 0 equals: aPortfolio balance
! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:23:21'!
test14BalanceOfAPortfolioWithASingleAccountReturnTheAccountBalance

	| aPortfolio |
	
	Deposit register: 100 * peso on: anAccount.
	aPortfolio := Portfolio with: anAccount.
	
	self assert: anAccount balance equals: aPortfolio balance
! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:23:11'!
test15BalanceOfAPortfolioWithMultipleAccountsReturnTheSumOfTheAccountsBalances

	| aPortfolio |
	
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 50 * peso on: anOtherAccount.
	aPortfolio := Portfolio with: anAccount with: anOtherAccount.
	
	self assert: anAccount balance + anOtherAccount balance equals: aPortfolio balance! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:23:03'!
test16PortfolioKnowsATransactionsOfOneOfItsAccounts

	| aPortfolio aDeposit |
	
	aDeposit := Deposit register: 100 * peso on: anAccount.
	Deposit register: 50 * peso on: anOtherAccount.
	
	aPortfolio := Portfolio with: anAccount with: anOtherAccount.
	
	self assert: (aPortfolio hasRegistered: aDeposit)! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:22:35'!
test17PortfolioDoesntKnowsATransactionOfAnAccountThatNoBelongsToIt

	| aPortfolio aDeposit |
	
	aDeposit := Deposit register: 100 * peso on: anOtherAccount.

	aPortfolio := Portfolio with: anAccount.
	
	self deny: (aPortfolio hasRegistered: aDeposit)! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:22:43'!
test18PortfolioKnowsTheTransactionsOfOneOfItsAccounts

	| aPortfolio aDeposit withdraw transactionsOfAnAccount |
	
	aDeposit := Deposit register: 100 * peso on: anAccount.
	withdraw := Withdraw register: 20 * peso on: anAccount.
	
	Deposit register: 50 * peso on: anOtherAccount.
	
	aPortfolio := Portfolio with: anAccount with: anOtherAccount.
	transactionsOfAnAccount := aPortfolio transactionsOf: anAccount.
	
	self assert: transactionsOfAnAccount size equals: 2.
	self assert: transactionsOfAnAccount includes: aDeposit.
	self assert: transactionsOfAnAccount includes: withdraw.
	! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:22:12'!
test19PortfolioDoesntKnowsTransactionsOfAnAccountsThatNoBelongsToIt

	| aPortfolio |
	
	aPortfolio := Portfolio with: anAccount .
	
	self should: [aPortfolio transactionsOf: anOtherAccount] raise: Error withExceptionDo: [:anError | self assert: anError messageText =  Portfolio doesntKnowAccountErrorDescription].
! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:22:05'!
test20TheBalanceOfAPortfolioWichContainsAnotherPortfolioIsTheSumOfTheBalancesOfItsAccounts

	| aPortfolio anOtherPortfolio |
	
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 50 * peso on: anOtherAccount.
	Deposit register: 20 * peso on: aReceiverAccount. "Probablemente lo podamos mejorar"
	Deposit register: 10 * peso on: aSenderAccount.
	
	aPortfolio := Portfolio with: anAccount with: aReceiverAccount.
	
	anOtherPortfolio := Portfolio withAllOfCollection: {anOtherAccount. aPortfolio. aSenderAccount}.
	
	self assert: 180 * peso equals: anOtherPortfolio balance
! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:25:48'!
test21PortfolioKnowsATransactionOfOAnAccountThatIsContainedInAnotherPortfolioContainedInIt

	| aPortfolio anOtherPortfolio aDeposit |
	
	aDeposit := Deposit register: 100 * peso on: anAccount.

	aPortfolio := Portfolio with: anAccount.
	
	anOtherPortfolio := Portfolio with: aPortfolio. 
	
	self assert: (anOtherPortfolio hasRegistered: aDeposit).

	
	
	
	! !

!ReceptiveAccountTest methodsFor: 'portfolio test' stamp: 'iv 6/7/2022 14:29:41'!
test22PortfolioKnowsTheTransactionsOfOneOfItsAccountsThatIsContainedInAnotherPortfolioContainedInIt


	| aPortfolio anOtherPortfolio aDeposit aWithdraw transactionsOfAnAccount |
	
	aDeposit := Deposit register: 100 * peso on: anAccount.
	aWithdraw := Withdraw register: 20 * peso on: anAccount.

	aPortfolio := Portfolio with: anAccount.
	
	anOtherPortfolio := Portfolio with: aPortfolio. 
	
	transactionsOfAnAccount := anOtherPortfolio transactionsOf: anAccount.
	
	self assert: transactionsOfAnAccount size equals: 2.
	self assert: transactionsOfAnAccount includes: aDeposit.
	self assert: transactionsOfAnAccount includes: aWithdraw.
	

	
	
	
	! !


!ReceptiveAccountTest methodsFor: 'portfolio extra test' stamp: 'iv 6/7/2022 22:50:09'!
test23APortfolioCantContainTheSameAccountTwice
	
	self should: [Portfolio with: anAccount with: anAccount ] raise: Error withExceptionDo: [:anError | self assert: anError messageText =  Portfolio cantContainTheSameAccountTwiceErrorDescription ].

	
	
	
	
	
	! !

!ReceptiveAccountTest methodsFor: 'portfolio extra test' stamp: 'iv 6/7/2022 22:51:32'!
test24APortfolioCantContainAnOtherPortfolioWhoSharesAnAccountWithIt
	| aPortfolio anOtherPortfolio |


	aPortfolio := Portfolio with: anAccount.
	
	anOtherPortfolio := Portfolio with: anAccount . 
	
	self should: [anOtherPortfolio add: aPortfolio] raise: Error withExceptionDo: [:anError | self assert: anError messageText =  Portfolio cantContainTheSameAccountTwiceErrorDescription ].

	
	
	! !

!ReceptiveAccountTest methodsFor: 'portfolio extra test' stamp: 'iv 6/7/2022 23:12:34'!
test25
"No puedo agregar una cuenta a un portfolio cuando este último ya es hijo de otro portfolio padre que tenía dicha cuenta."


	
	
	! !

!ReceptiveAccountTest methodsFor: 'portfolio extra test' stamp: 'iv 6/7/2022 23:12:42'!
test26
"No puedo agregar un portfolio a otro porfolio, si el primero incluye una cuenta que el segundo ya tiene."


	
	
	! !


!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'iv 6/7/2022 12:37:59'!
setUp

	anAccount := ReceptiveAccount  new.
	anOtherAccount := ReceptiveAccount  new.
	
	aReceiverAccount := ReceptiveAccount  new.
	aSenderAccount := ReceptiveAccount  new.! !


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

!AccountTransfer methodsFor: 'accessing' stamp: 'iv 6/7/2022 11:58:09'!
matchingTransfer
	self subclassResponsibility ! !

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


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts allAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:32:43'!
add: item
	item beAddedTo: self.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:50:34'!
addAccount: anAcount
	(allAccounts includes: anAcount) ifTrue: [self error: Portfolio cantContainTheSameAccountTwiceErrorDescription].
	allAccounts add: anAcount.
	accounts add: anAcount ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:48:49'!
addAll: aCollectionOfitem
	aCollectionOfitem do: [:anItem | self add: anItem ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:44:35'!
balance
	^allAccounts sum: [:anItem | anItem balance ] ifEmpty: [^0]
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:40:32'!
beAddedTo: aPortfolio
	allAccounts do: [:anAccount | aPortfolio addAccount: anAccount ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:46:43'!
hasRegistered: aTransaction

	allAccounts do: [:anAccount |	 (anAccount hasRegistered: aTransaction)  ifTrue: [^true] ].
	^false
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:45:44'!
initialize
	
	accounts := Set new.
	allAccounts := Set new.
	portfolios := Set new.

! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:47:06'!
transactionsOf: anAccount

	(allAccounts includes: anAccount) ifTrue: [^anAccount transactions ].
	
	self error: Portfolio doesntKnowAccountErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:50:15'!
cantContainTheSameAccountTwiceErrorDescription
	^ 'Portfolio cant containthe same account twice'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 13:15:29'!
doesntKnowAccountErrorDescription
	^ 'Portfolio does not contain that account'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 14:53:44'!
with: anItem
	^self new add: anItem ! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 14:53:57'!
with: anItem with: anOtherItem
	^(self with: anItem) add: anOtherItem 
	! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 14:54:06'!
withAllOfCollection: aCollectionOfItems

	^self new addAll: aCollectionOfItems! !


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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 22:38:35'!
beAddedTo: aPortfolio
	aPortfolio addAccount: self.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'iv 6/7/2022 15:42:13'!
includes: anAccount
	^(self= anAccount)! !


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

!Transfer methodsFor: 'accessing' stamp: 'iv 6/7/2022 12:17:10'!
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
