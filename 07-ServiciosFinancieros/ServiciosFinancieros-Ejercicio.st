!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'anAccount anOtherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'portfolio restrictions test' stamp: 'iv 6/9/2022 11:50:09'!
test20APortfolioCantContainTheSameAccountTwice

	| aPortfolio |
	
	aPortfolio := Portfolio withAccount: anAccount.
	
	self should: [ aPortfolio addAccount: anAccount ] raise: Error description: Portfolio ErrorDescriptionAccountAlreadyInPortfolioHierarchy.! !

!PortfolioTest methodsFor: 'portfolio restrictions test' stamp: 'iv 6/9/2022 11:50:20'!
test21CantAddAccountToPortfolioIfAccountAlreadyInSubportfolio

	| aPortfolio anotherPortfolio |
	
	aPortfolio := Portfolio withAccount: anAccount.
	anotherPortfolio := Portfolio new addPortfolio: aPortfolio.
	
	self should: [ anotherPortfolio addAccount: anAccount ] raise: Error description: Portfolio ErrorDescriptionAccountAlreadyInPortfolioHierarchy.! !

!PortfolioTest methodsFor: 'portfolio restrictions test' stamp: 'iv 6/9/2022 11:50:33'!
test22APortfolioCantContainItself

	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self should: [ aPortfolio addPortfolio: aPortfolio ] raise: Error description: Portfolio ErrorDescriptionPortfolioCantContainItself.! !

!PortfolioTest methodsFor: 'portfolio restrictions test' stamp: 'iv 6/9/2022 11:50:49'!
test23CantAddAnAccountToAPortfolioIfParentPortfolioAlreadyContainsAccount

	| aPortfolio aSubportfolio |
	
	aSubportfolio := Portfolio new.
	aPortfolio := Portfolio withAccount: anAccount.
	aPortfolio addPortfolio: aSubportfolio.
	
	self should: [ aSubportfolio addAccount: anAccount ] raise: Error description: Portfolio ErrorDescriptionAccountAlreadyInPortfolioHierarchy.! !

!PortfolioTest methodsFor: 'portfolio restrictions test' stamp: 'iv 6/9/2022 11:51:19'!
test24CantAddPortfolioToHierarchyIfPortfolioContainsAccountsThatAreInHierarchy

	| aNewPortfolio aParentPortfolio |
	
	aParentPortfolio := Portfolio withAccount: anAccount.
	aNewPortfolio := Portfolio withAccount: anAccount.
	
	self should: [ aParentPortfolio addPortfolio: aNewPortfolio ] raise: Error description: Portfolio ErrorDescriptionAccountAlreadyInPortfolioHierarchy.! !


!PortfolioTest methodsFor: 'setUp' stamp: 'iv 6/9/2022 11:49:45'!
setUp
	anAccount := ReceptiveAccount new.
	anOtherAccount := ReceptiveAccount  new.
	! !


!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:48:02'!
test12AnEmptyPortfolioHasBalanceOf0

	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self assert: aPortfolio balance equals: 0.! !

!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:49:35'!
test13BalanceOfAPortfolioWithOneEqualsAccountsBalance

	| aPortfolio |
	
	Deposit register: 100 * peso on: anAccount.
	aPortfolio := Portfolio withAccount: anAccount.
	
	self assert: aPortfolio balance equals: anAccount balance.! !

!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:49:45'!
test14BalanceOfAPortfolioWithManyAccountsEqualsTheSumOfTheAccountsBalance

	| aPortfolio |

	Deposit register: 100 * peso on: anAccount.
	Deposit register: 20 * peso on: anOtherAccount.
	aPortfolio := Portfolio withAccount: anAccount.
	aPortfolio addAccount: anOtherAccount.
	
	self assert: aPortfolio balance equals: anAccount balance + anOtherAccount balance.! !

!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:49:45'!
test15PortfolioCanReturnTransactionsOfAnAccount

	| aPortfolio transactions |
	
	transactions := OrderedCollection new.
	Deposit register: 20 * peso on: anOtherAccount.
	transactions add: (Deposit register: 100 * peso on: anAccount).
	transactions add: (Deposit register: 1 * peso on: anAccount).
	
	aPortfolio := Portfolio withAccount: anAccount.
	aPortfolio addAccount: anOtherAccount.
	self assert: (aPortfolio transactionsOf: anAccount) equals: transactions.! !

!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:49:45'!
test16PortfolioRaisesErrorIfAskedTransactionsOfAnAccountItDoesntInclude

	| aPortfolio |
	
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 20 * peso on: anOtherAccount.
	aPortfolio := Portfolio withAccount: anOtherAccount.
	
	self should: [aPortfolio transactionsOf: anAccount] raise: Error description: Portfolio ErrorDescriptionAccountNotFound.! !

!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:49:35'!
test17PortfolioHasTransactionsThatBelongToContainedAccounts

	| aPortfolio  aTransaction |
	
	aTransaction := Deposit register: 1 * peso on: anAccount.
	aPortfolio := Portfolio withAccount: anAccount.

	self assert: (aPortfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:49:45'!
test18PortfolioDoesntHaveTransactionsThatDontBelongToContainedAccounts

	| aPortfolio  aTransaction |
	
	aTransaction := Deposit register: 1 * peso on: anAccount.
	aPortfolio := Portfolio withAccount: anOtherAccount.
	
	self deny: (aPortfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'portfolio main protocol test' stamp: 'iv 6/9/2022 11:49:45'!
test19BalanceOfAPortfolioOfPortfoliosEqualsTheSumOfTheBalancesOfTheAccountsContainedInThem

	| aParentPortfolio aPortfolio anotherPortfolio |
	
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 10 * peso on: anOtherAccount.
	aPortfolio := Portfolio withAccount: anAccount.
	anotherPortfolio := Portfolio withAccount: anOtherAccount.
	aPortfolio addPortfolio: anotherPortfolio.
	aParentPortfolio := Portfolio withPortfolio: aPortfolio.

	self assert: aParentPortfolio balance equals: anAccount balance + anOtherAccount balance.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'anAccount aReceiverAccount aSenderAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'account transfer tests' stamp: 'iv 6/9/2022 11:20:31'!
test08IncomingTransferIncreasesBalanceOnTransferValue

	| transferValue |

	transferValue := 50 * peso.
	Transfer send: transferValue from: aSenderAccount to: aReceiverAccount.
	
	self assert: transferValue equals: aReceiverAccount balance
! !

!ReceptiveAccountTest methodsFor: 'account transfer tests' stamp: 'iv 6/9/2022 11:23:05'!
test09OutgoingTransferDecreasesBalanceOnTransferValue

	| transferValue |

	transferValue := 100 * peso.
	Transfer send: transferValue from: aSenderAccount to: aReceiverAccount.

	self assert: transferValue negated equals: aSenderAccount balance
! !

!ReceptiveAccountTest methodsFor: 'account transfer tests' stamp: 'iv 6/9/2022 11:23:23'!
test10IncomingTransferKnowsOutgoingTransfer

	| aTransfer anIncomingTransfer |
	
	aTransfer := Transfer send: 100 * peso from: aSenderAccount to: aReceiverAccount.
	anIncomingTransfer := aTransfer incomingTransfer.
	
	self assert: anIncomingTransfer matchingTransfer equals: aTransfer outgoingTransfer.
! !

!ReceptiveAccountTest methodsFor: 'account transfer tests' stamp: 'iv 6/9/2022 11:23:46'!
test11OutgoingTransferKnowsIncomingTransfer

	| aTransfer anOutgoingTransfer |

	aTransfer := Transfer send: 100 * peso from: aSenderAccount to: aReceiverAccount.
	anOutgoingTransfer := aTransfer outgoingTransfer.
	
	self assert: anOutgoingTransfer matchingTransfer equals: aTransfer incomingTransfer.
! !


!ReceptiveAccountTest methodsFor: 'account transaction tests' stamp: 'iv 6/9/2022 11:16:25'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'account transaction tests' stamp: 'iv 6/9/2022 11:16:37'!
test02DepositIncreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: anAccount .
		
	self assert: 100 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'account transaction tests' stamp: 'iv 6/9/2022 11:16:50'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: anAccount .
	Withdraw register: 50 * peso on: anAccount .
		
	self assert: 50 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'account transaction tests' stamp: 'iv 6/9/2022 11:17:16'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: anAccount ) value
! !

!ReceptiveAccountTest methodsFor: 'account transaction tests' stamp: 'iv 6/9/2022 11:17:34'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := Deposit register: 100 * peso on: anAccount .
	withdraw := Withdraw register: 50 * peso on: anAccount .
		
	self assert: (anAccount hasRegistered: deposit).
	self assert: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'account transaction tests' stamp: 'iv 6/9/2022 11:18:09'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |

	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (anAccount hasRegistered: deposit).
	self deny: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'account transaction tests' stamp: 'iv 6/9/2022 11:18:34'!
test07AccountKnowsItsTransactions 

	| deposit |

	deposit := Deposit register: 50 * peso on: anAccount .
		
	self assert: 1 equals: anAccount transactions size.
	self assert: (anAccount transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'iv 6/9/2022 11:19:57'!
setUp
	anAccount := ReceptiveAccount new.
	aReceiverAccount := ReceptiveAccount  new.
	aSenderAccount := ReceptiveAccount  new.
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


!AccountTransaction methodsFor: 'accessing' stamp: 'iv 6/9/2022 11:52:52'!
impactBalace: aBalanceToBeImpacted

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'accessing' stamp: 'iv 6/9/2022 11:09:50'!
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

!Deposit methodsFor: 'accessing' stamp: 'iv 6/9/2022 11:53:07'!
impactBalace: aBalanceToBeImpacted 
	^aBalanceToBeImpacted + self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'accessing' stamp: 'iv 6/9/2022 11:53:17'!
impactBalace: aBalanceToBeImpacted 
	^aBalanceToBeImpacted - self value! !


!classDefinition: #AccountTransfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransfer methodsFor: 'initialization' stamp: 'jmd 6/3/2022 19:49:11'!
initializeFor: aTransfer

	transfer := aTransfer! !


!AccountTransfer methodsFor: 'accessing' stamp: 'iv 6/9/2022 11:53:48'!
impactBalace: aBalanceToBeImpacted

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

!IncomingTransfer methodsFor: 'accessing' stamp: 'iv 6/9/2022 11:53:56'!
impactBalace: aBalanceToBeImpacted

	^aBalanceToBeImpacted + transfer value.! !

!IncomingTransfer methodsFor: 'accessing' stamp: 'jmd 6/4/2022 19:48:29'!
matchingTransfer
	^transfer outgoingTransfer.! !


!classDefinition: #OutgoingTransfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer subclass: #OutgoingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!OutgoingTransfer methodsFor: 'accessing' stamp: 'iv 6/9/2022 11:54:01'!
impactBalace: aBalanceToBeImpacted 
	^aBalanceToBeImpacted - transfer value.! !

!OutgoingTransfer methodsFor: 'accessing' stamp: 'jmd 6/4/2022 19:49:06'!
matchingTransfer
	^transfer incomingTransfer.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'portfolios accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'jmd 6/8/2022 19:52:25'!
initialize

	accounts := OrderedCollection new.
	portfolios := OrderedCollection new.
	parents := Set new! !


!Portfolio methodsFor: 'testing' stamp: 'jmd 6/8/2022 20:20:09'!
assertAccountsIntersectionIsEmptyWithPortfolio: aPortfolio
	accounts do: [ :aMemberAccount | aPortfolio assertPortfolioHierarchyDoesNotIncludeAccount: aMemberAccount ].
	portfolios do: [ :aMemberPortfolio | aMemberPortfolio assertAccountsIntersectionIsEmptyWithPortfolio: aPortfolio ].! !

!Portfolio methodsFor: 'testing' stamp: 'jmd 6/8/2022 20:17:52'!
assertPortfolioDoesNotIncludeAccount: anAccount

	( self includes: anAccount ) ifTrue: [self error: Portfolio ErrorDescriptionAccountAlreadyInPortfolioHierarchy].! !

!Portfolio methodsFor: 'testing' stamp: 'jmd 6/8/2022 20:18:42'!
assertPortfolioHierarchyDoesNotIncludeAccount: anAccount

	parents do: [ :aParent | aParent assertPortfolioHierarchyDoesNotIncludeAccount: anAccount ].
	parents isEmpty ifTrue: [ self assertPortfolioDoesNotIncludeAccount: anAccount ].! !

!Portfolio methodsFor: 'testing' stamp: 'jmd 6/8/2022 19:07:44'!
includes: anAccount
	
	portfolios do: [ :aMemberPortfolio | (aMemberPortfolio includes: anAccount) ifTrue: [^true] ].
	(accounts includes: anAccount) ifTrue: [^true].
	^false! !


!Portfolio methodsFor: 'adding' stamp: 'iv 6/9/2022 12:01:17'!
addAParentPortfolio: aParentPortfolio
	parents add: aParentPortfolio! !

!Portfolio methodsFor: 'adding' stamp: 'jmd 6/8/2022 20:18:42'!
addAccount: anAccount
	self assertPortfolioHierarchyDoesNotIncludeAccount: anAccount.
	accounts add: anAccount! !

!Portfolio methodsFor: 'adding' stamp: 'iv 6/9/2022 12:01:17'!
addPortfolio: aNewPortfolio
	self = aNewPortfolio ifTrue: [ self error: Portfolio ErrorDescriptionPortfolioCantContainItself ].
	aNewPortfolio assertAccountsIntersectionIsEmptyWithPortfolio: self.
	portfolios add: aNewPortfolio.
	aNewPortfolio addAParentPortfolio: self.
	! !


!Portfolio methodsFor: 'main protocol' stamp: 'jmd 6/8/2022 19:10:25'!
balance
	| subportfoliosBalance subaccountsBalance |
	
	subportfoliosBalance := portfolios sum: [ :aPortfolio | aPortfolio balance ] ifEmpty: 0.
	subaccountsBalance := accounts sum: [ :anAccount | anAccount balance ] ifEmpty: 0.
	^subportfoliosBalance + subaccountsBalance! !

!Portfolio methodsFor: 'main protocol' stamp: 'jmd 6/8/2022 19:08:35'!
hasRegistered: aTransaction

	portfolios do: [ :aPortfolio | (aPortfolio hasRegistered: aTransaction) ifTrue: [^true] ].
	accounts do: [ :anAccount | (anAccount hasRegistered: aTransaction) ifTrue: [^true] ].
	^false 
! !

!Portfolio methodsFor: 'main protocol' stamp: 'jmd 6/8/2022 19:07:21'!
transactionsOf: anAccount

	(self includes: anAccount ) ifTrue: [^anAccount transactions].
	self error: Portfolio ErrorDescriptionAccountNotFound! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'Error descriptions' stamp: 'jmd 6/8/2022 19:49:24'!
ErrorDescriptionAccountAlreadyInPortfolioHierarchy
	^'The account is already in the portfolio hierarchy'! !

!Portfolio class methodsFor: 'Error descriptions' stamp: 'jmd 6/6/2022 21:20:20'!
ErrorDescriptionAccountNotFound
	^'Account is not contained in portfolio'! !

!Portfolio class methodsFor: 'Error descriptions' stamp: 'jmd 6/8/2022 19:41:30'!
ErrorDescriptionPortfolioCantContainItself
	^'The portfolio cant include itself'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'jmd 6/8/2022 19:27:48'!
withAccount: anAccount

	^self new addAccount: anAccount! !

!Portfolio class methodsFor: 'instance creation' stamp: 'iv 6/9/2022 11:42:42'!
withPortfolio: aPortfolioToBeAdded

	^self new addPortfolio: aPortfolioToBeAdded! !


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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'jmd 6/8/2022 19:26:01'!
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
