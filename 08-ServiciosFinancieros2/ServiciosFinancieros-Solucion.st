!classDefinition: #AccountReportsTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountReportsTest
	instanceVariableNames: 'anAccount anOtherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReportsTest methodsFor: 'transfer net test' stamp: 'jmd 6/15/2022 01:38:53'!
test10AccountTransferNetOfAnAccountThatDidNotInteractWithTransfersIsZero

	| accountTransferNet |

	Deposit register: 50 * peso on: anAccount.
	Withdraw register: 10 * peso on: anAccount.
	accountTransferNet := TransferBalanceReport for: anAccount transactions.
	
	self assert: accountTransferNet showReport equals: 0! !

!AccountReportsTest methodsFor: 'transfer net test' stamp: 'jmd 6/15/2022 01:38:53'!
test11AccountTransferNetOfAnAccountThatOnlyRecivesADepositByTranferIsTheValueOfTheDeposit

	| accountTransferNet|
	
	Transfer amount: 50 * peso from: ReceptiveAccount new to: anAccount.
	accountTransferNet := TransferBalanceReport for: anAccount transactions.

	self assert: 50 * peso equals: accountTransferNet showReport! !

!AccountReportsTest methodsFor: 'transfer net test' stamp: 'jmd 6/15/2022 01:38:54'!
test12AccountTransferNetOfAnAccountThatOnlyMadeATranferWithdrawalIsTheValueOfTheWithdrawalNegated
	| accountTransferNet |
	
	Transfer amount: 50 * peso from: anAccount to: ReceptiveAccount new.
	accountTransferNet := TransferBalanceReport for: anAccount transactions.

	self assert: -50 * peso equals: accountTransferNet showReport! !

!AccountReportsTest methodsFor: 'transfer net test' stamp: 'jmd 6/15/2022 01:38:53'!
test13AccountTransferNetOfAnAccountWithMoreThanOneTransferRestursThoseTransfersBalance
	| accountTransferNet |
	
	Transfer amount: 50 * peso from: ReceptiveAccount new to: anAccount .
	Transfer amount: 20 * peso from: anAccount to: ReceptiveAccount new.
	accountTransferNet := TransferBalanceReport for: anAccount transactions.

	self assert: 30 * peso equals: accountTransferNet showReport! !

!AccountReportsTest methodsFor: 'transfer net test' stamp: 'jmd 6/15/2022 01:38:53'!
test14AccountTransferNetOfAPortfolioThatDidNotInteractWithTransfersIsZero
	| portfolio portfolioTransferNet |
	
	portfolio := Portfolio with: anAccount with: anOtherAccount.
	Deposit register: 50 * peso on: anAccount.
	Withdraw register: 20 * peso on: anOtherAccount.
	portfolioTransferNet := TransferBalanceReport for: portfolio transactions.

	self assert: 0 * peso equals: portfolioTransferNet showReport! !

!AccountReportsTest methodsFor: 'transfer net test' stamp: 'jmd 6/15/2022 01:38:53'!
test15AccountTransferNetOfAPortfolioIsTheAccountsTransferNetBalance
	| portfolio anOtherPortfolio  anOtherPortfolioTransferNet |
	
	portfolio := Portfolio with: anAccount.
	anOtherPortfolio := Portfolio with: anOtherAccount with: portfolio.
	Transfer amount: 50 * peso from: anAccount to: ReceptiveAccount new.
	Transfer amount: 10 * peso from: ReceptiveAccount new to: anOtherAccount.

	anOtherPortfolioTransferNet := TransferBalanceReport for: anOtherPortfolio transactions.

	self assert: -40 * peso equals: anOtherPortfolioTransferNet showReport
	
	! !


!AccountReportsTest methodsFor: 'setUp' stamp: 'iv 6/14/2022 13:03:29'!
setUp
	anAccount := ReceptiveAccount new.
	anOtherAccount := ReceptiveAccount new.! !


!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test01AccountSummaryOfANewAccountReturnsZeroBalance

	| accountSummary |

	accountSummary := AccountSummaryReport for: anAccount transactions.
	
	self assert: accountSummary showReport equals: 'Balance = 0'.! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test02AccountSummaryOfAnAccountThatOnlyMadeADepositContainOnlyThatTransactionAndAccountBalance

	| accountSummary |
	
	Deposit register: 50 * peso on: anAccount.
	accountSummary := AccountSummaryReport for: anAccount transactions.

	self assert: accountSummary showReport equals: 
'Depósito por 50 * pesos
Balance = 50 * pesos'

! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test03AccountSummaryOfAnAccountThatOnlyMadeAWithdrawalContainOnlyThatTransactionAndAccountBalance

	| accountSummary |

	Withdraw register: 50 * peso on: anAccount.
	accountSummary := AccountSummaryReport for: anAccount transactions.



	self assert: accountSummary showReport equals: 
'Extracción por 50 * pesos
Balance = -50 * pesos'.! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test04AccountSummaryOfAnAccountThatOnlyRecivesADepositByTranferContainOnlyThatTransactionAndAccountBalance

	| accountSummary |
	
	Transfer amount: 50 * peso from: ReceptiveAccount new to: anAccount.

	accountSummary := AccountSummaryReport for: anAccount transactions.
	

	self assert: accountSummary showReport equals: 
'Entrada por transferencia de 50 * pesos
Balance = 50 * pesos'! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test05AccountSummaryOfAnAccountThatOnlyMadeATranferWithdrawalContainOnlyThatTransactionAndAccountBalance

	| accountSummary |
	
	Transfer amount: 50 * peso from: anAccount to: ReceptiveAccount new.
	accountSummary := AccountSummaryReport for: anAccount transactions .

	self assert: accountSummary showReport equals: 
'Salida por transferencia de 50 * pesos
Balance = -50 * pesos'.

! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test06AccountSummaryOfAnAccountWithMoreThanOneTransactionRestursThoseTransactionsAndAccountBalance
	| accountSummary |
	
	Transfer amount: 50 * peso from: ReceptiveAccount new to: anAccount.
	Withdraw register: 20 * peso on: anAccount.
	accountSummary := AccountSummaryReport for: anAccount transactions .
	
	
	self assert: accountSummary showReport equals: 
'Entrada por transferencia de 50 * pesos
Extracción por 20 * pesos
Balance = 30 * pesos'.
! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:54'!
test07AccountSummaryOfAPortfolioWithMultiplesEmptyPortfoliosReturnsZeroBalance

	| portfolio  anOtherPortfolio anOtherPortfolioSummary |
	

	portfolio := Portfolio new.
	anOtherPortfolio := Portfolio with: portfolio.
	
	anOtherPortfolioSummary := AccountSummaryReport for: anOtherPortfolio transactions .
	


	self assert: anOtherPortfolioSummary showReport equals: 'Balance = 0'.! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test08AccountSummaryOfAPortfolioWithMultiplesAccountsReturnsAccountsTransactionsAndThePortfolioBalance

	| portfolio portfolioSummary |
	

	portfolio := Portfolio with: anAccount with: anOtherAccount.
	
	Deposit register: 50 * peso on: anAccount.
	Withdraw register: 20 * peso on: anOtherAccount.
	
	portfolioSummary := AccountSummaryReport for: portfolio transactions .


	self assert: portfolioSummary showReport equals: 
'Depósito por 50 * pesos
Extracción por 20 * pesos
Balance = 30 * pesos'.
! !

!AccountReportsTest methodsFor: 'summary test' stamp: 'jmd 6/15/2022 01:38:53'!
test09AccountSummaryOfAPortfolioWithMultiplesPortfoliosReturnsAccountsTransactionsAndThePortfolioBalance

	| portfolio anOtherPortfolio anOtherPortfolioSummary |
	
	portfolio := Portfolio with: anAccount.
	anOtherPortfolio := Portfolio with: anOtherAccount with: portfolio.
	
	Deposit register: 50 * peso on: anAccount.
	Withdraw register: 20 * peso on: anOtherAccount.
	
	anOtherPortfolioSummary := AccountSummaryReport for: anOtherPortfolio transactions.


	self assert: anOtherPortfolioSummary showReport equals: 
'Extracción por 20 * pesos
Depósito por 50 * pesos
Balance = 30 * pesos'.
! !


!classDefinition: #AccountTreeReportsTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountTreeReportsTest
	instanceVariableNames: 'myAccount juanAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTreeReportsTest methodsFor: 'portfolio tree printer test' stamp: 'iv 6/16/2022 11:52:34'!
test01PortfolioTreePrinterForAnAccountPrintsTheAccountName
	
	| portfolioTreePrinter |
	
	portfolioTreePrinter := PortfolioTreePrinter for: myAccount.
	
	self assert: portfolioTreePrinter showReport equals: 'Cuenta mia'.
! !

!AccountTreeReportsTest methodsFor: 'portfolio tree printer test' stamp: 'iv 6/16/2022 11:53:31'!
test02PortfolioTreePrinterForAPortfolioPrintsThePortfolioName
	
	| myPortfolio portfolioTreePrinter |
	
	myPortfolio := Portfolio named: 'Portafolio mio'.
	portfolioTreePrinter := PortfolioTreePrinter for: myPortfolio.
	
	self assert: portfolioTreePrinter showReport equals: 'Portafolio mio'.
! !

!AccountTreeReportsTest methodsFor: 'portfolio tree printer test' stamp: 'iv 6/16/2022 11:58:23'!
test03PortfolioTreePrinterShowsContainedAccountsWithIndentation
	
	| myPortfolio portfolioTreePrinter |

	myPortfolio := Portfolio named: 'Portafolio mio' with: myAccount.
	portfolioTreePrinter := PortfolioTreePrinter for: myPortfolio.
	
	self assert: portfolioTreePrinter showReport equals: 
'Portafolio mio
	Cuenta mia'.
! !

!AccountTreeReportsTest methodsFor: 'portfolio tree printer test' stamp: 'iv 6/16/2022 11:54:43'!
test04PortfolioTreePrinterForPortfolioWithManyAccountsShowsAllOfThem
	
	| myPortfolio portfolioTreePrinter|

	myPortfolio := Portfolio named: 'Portafolio mio' with: myAccount with: juanAccount.
	portfolioTreePrinter := PortfolioTreePrinter for: myPortfolio.
	
	self assert: portfolioTreePrinter showReport equals: 
'Portafolio mio
	Cuenta mia
	Cuenta de Juan'.
! !

!AccountTreeReportsTest methodsFor: 'portfolio tree printer test' stamp: 'iv 6/16/2022 11:55:11'!
test05PortfolioTreePrinterForPortfolioWithSubportfolioShowsSubportfolio
	
	| myPortfolio portfolioTreePrinter sonsPortfolio |

	sonsPortfolio := Portfolio named: 'Portfolio de hijos'.
	myPortfolio := Portfolio named: 'Portafolio mio' with: sonsPortfolio.
	portfolioTreePrinter := PortfolioTreePrinter for: myPortfolio.
	
	self assert: portfolioTreePrinter showReport equals: 
'Portafolio mio
	Portfolio de hijos'.
! !

!AccountTreeReportsTest methodsFor: 'portfolio tree printer test' stamp: 'iv 6/16/2022 11:58:16'!
test06PortfolioTreePrinterForPortfolioShowsAccountsOfSubportfolio
	
	| myPortfolio portfolioTreePrinter sonsPortfolio |

	sonsPortfolio := Portfolio named: 'Portfolio de hijos' with: juanAccount.
	myPortfolio := Portfolio named: 'Portafolio mio' with: sonsPortfolio.
	portfolioTreePrinter := PortfolioTreePrinter for: myPortfolio.

	self assert: portfolioTreePrinter showReport equals: 
'Portafolio mio
	Portfolio de hijos
		Cuenta de Juan'.
! !

!AccountTreeReportsTest methodsFor: 'portfolio tree printer test' stamp: 'iv 6/16/2022 11:58:12'!
test07PortfolioTreePrinterUnindentsCorrectlyAfterShowingSubportfolio
	
	| myPortfolio portfolioTreePrinter sonsPortfolio |
	
	sonsPortfolio := Portfolio named: 'Portfolio de hijos' with: juanAccount.
	myPortfolio := Portfolio named: 'Portafolio mio' with: sonsPortfolio with: myAccount.
	portfolioTreePrinter := PortfolioTreePrinter for: myPortfolio.

	self assert: portfolioTreePrinter showReport equals: 
'Portafolio mio
	Portfolio de hijos
		Cuenta de Juan
	Cuenta mia'.
! !


!AccountTreeReportsTest methodsFor: 'setUp' stamp: 'iv 6/16/2022 11:52:19'!
setUp
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	juanAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	! !


!AccountTreeReportsTest methodsFor: 'portfolio detailed tree printer test' stamp: 'iv 6/16/2022 11:57:57'!
test08PortfolioTreePrinterForAnAccountWithoutTransactionsShows0Balance
	
	| portfolioTreePrinter |

	portfolioTreePrinter := PortfolioDetailedTreePrinter for: myAccount.
	
	self assert: portfolioTreePrinter showReport equals: 
'Cuenta mia
	Balance = 0'.
! !

!AccountTreeReportsTest methodsFor: 'portfolio detailed tree printer test' stamp: 'iv 6/16/2022 11:57:52'!
test09PortfolioTreePrinterForAPortfolioShowsTransactionsByAccount
	
	| portfolioDetailedTreePrinter myPortfolio sonsPortfolio |
	
	Transfer amount: 2 * peso from: juanAccount to: myAccount.
	
	sonsPortfolio := Portfolio named: 'Portfolio de hijos' with: juanAccount.
	myPortfolio := Portfolio named: 'Portafolio mio' with: sonsPortfolio with: myAccount.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: myPortfolio.

	self assert: portfolioDetailedTreePrinter showReport equals: 
'Portafolio mio
	Portfolio de hijos
		Cuenta de Juan
			Salida por transferencia de 2 * pesos
			Balance = -2 * pesos
	Cuenta mia
		Entrada por transferencia de 2 * pesos
		Balance = 2 * pesos'.
! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jmd 6/15/2022 01:30:49'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'jmd 6/15/2022 01:30:49'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'iv 6/14/2022 13:44:58'!
name
	^name copy! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'extra' stamp: 'jmd 6/16/2022 00:16:30'!
updateReport: aReport
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'extra' stamp: 'iv 6/14/2022 13:39:20'!
named: aName
	^self new initializeWithName: aName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'iv 6/14/2022 13:38:39'!
initializeWithName: aName

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aName ! !


!Portfolio methodsFor: 'main protocol' stamp: 'iv 6/13/2022 11:32:02'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'iv 6/14/2022 14:07:48'!
accounts
	^accounts copy! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'visiting' stamp: 'jmd 6/16/2022 00:20:09'!
updateReport: anAccountsReport

	^anAccountsReport addPortfolio: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'extra' stamp: 'iv 6/14/2022 13:43:58'!
named: aName with: anAccount

	^(self new initializeWithName: aName) add: anAccount! !

!Portfolio class methodsFor: 'extra' stamp: 'iv 6/14/2022 13:48:13'!
named: aName with: anAccount with: anotherAccount

	^(self new initializeWithName: aName)
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'iv 6/14/2022 13:40:25'!
initializeWithName: aName

	super initialize.
	transactions := OrderedCollection new.
	name := aName ! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'iterating' stamp: 'jmd 6/16/2022 00:19:58'!
updateReport: anAccountsReport

	^anAccountsReport addAccount: self! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: 'reportText'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReport methodsFor: 'private' stamp: 'jmd 6/15/2022 01:17:10'!
generateReport

	self subclassResponsibility ! !


!AccountReport methodsFor: 'initialization' stamp: 'jmd 6/15/2022 01:18:18'!
initializeFor: anAccountTransactions
	
	self subclassResponsibility ! !


!AccountReport methodsFor: 'accessing' stamp: 'jmd 6/15/2022 01:44:32'!
showReport

	^reportText! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'ServiciosFinancieros-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'initialization' stamp: 'jmd 6/15/2022 01:24:51'!
for: somethingToReport

	^(self new initializeFor: somethingToReport) generateReport! !


!classDefinition: #AccountSummaryReport category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #AccountSummaryReport
	instanceVariableNames: 'accountTransactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryReport methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:19:19'!
addDeposit: aDeposit

	^'Depósito por ' append: (aDeposit value asString)
! !

!AccountSummaryReport methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:19:28'!
addTransferDepositLeg: aTransferDepositLeg

	^'Entrada por transferencia de ' append: aTransferDepositLeg value asString
	! !

!AccountSummaryReport methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:19:35'!
addTransferWithdrawLeg: aTransferWithdrawLeg

	^'Salida por transferencia de ' append: aTransferWithdrawLeg value asString
	! !

!AccountSummaryReport methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:19:43'!
addWithdraw: aWithdraw

	^'Extracción por ' append: aWithdraw value asString
	! !


!AccountSummaryReport methodsFor: 'initialization' stamp: 'jmd 6/16/2022 00:31:38'!
initializeFor: anAccountTransactions
	
	accountTransactions := anAccountTransactions.
	reportText := ''.! !


!AccountSummaryReport methodsFor: 'main protocol' stamp: 'jmd 6/16/2022 00:29:15'!
generateReport
	
	accountTransactions do: [ :accountTransaction | 
		reportText := reportText append: (accountTransaction updateReport: self).
		reportText := reportText append:  Character newLineCharacter asString
	].
	
	 reportText := reportText append: ('Balance = ' append: self balance asString).
! !


!AccountSummaryReport methodsFor: 'private' stamp: 'jmd 6/16/2022 00:31:54'!
balance

	^accountTransactions inject: 0 into: [ :transferBalance :aTransferTransaction | aTransferTransaction affectBalance: transferBalance ].! !


!classDefinition: #AccountTreeReport category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #AccountTreeReport
	instanceVariableNames: 'indentationSize account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTreeReport methodsFor: 'initialization' stamp: 'jmd 6/15/2022 21:52:26'!
initializeFor: anAccount

	account := anAccount.
	reportText := ''.
	indentationSize := 0.! !


!AccountTreeReport methodsFor: 'private' stamp: 'jmd 6/15/2022 21:48:44'!
addNewLine
 
	reportText := reportText append: Character newLineCharacter asString.
	indentationSize timesRepeat: [reportText := reportText append: '	']. "adds as many tabs as indentationSize"

! !


!AccountTreeReport methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:19:58'!
addAccount: anAccount

	self subclassResponsibility ! !

!AccountTreeReport methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:20:09'!
addPortfolio: aPortfolio

	self print: [ :accounts | accounts do: [:aPortfolioAccount | self addNewLine. aPortfolioAccount updateReport: self] ]
	withTree: aPortfolio
	getBranches: [ :aPortfolioWithAccounts | aPortfolioWithAccounts accounts ]
! !

!AccountTreeReport methodsFor: 'printing' stamp: 'jmd 6/15/2022 21:54:00'!
print: printInstructions withTree: aTreeRoot getBranches: closureToGetBranches
	| treeBranches |

	reportText := reportText append: aTreeRoot name.
	indentationSize := indentationSize + 1.
	treeBranches := closureToGetBranches value: aTreeRoot.
	printInstructions value: treeBranches.
	indentationSize := indentationSize - 1.

! !


!AccountTreeReport methodsFor: 'main protocol' stamp: 'jmd 6/16/2022 00:16:30'!
generateReport
	
	account updateReport: self.
	! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
AccountTreeReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:19:58'!
addAccount: anAccount

	self print: [ :aSummaryReport | aSummaryReport linesDo: [:transactionLine | self addNewLine. reportText := reportText append: transactionLine] ]
	withTree: anAccount
	getBranches: [ :anAccountWithTransactions | (AccountSummaryReport for: anAccountWithTransactions transactions) showReport ] .
! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
AccountTreeReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:19:58'!
addAccount: anAccount

	reportText := reportText append: anAccount name

	! !


!classDefinition: #TransferBalanceReport category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #TransferBalanceReport
	instanceVariableNames: 'accountTransactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferBalanceReport methodsFor: 'private' stamp: 'jmd 6/16/2022 00:32:06'!
balance

	^accountTransactions inject: 0 into: [ :transferBalance :aTransferTransaction | aTransferTransaction affectBalance: transferBalance ].! !

!TransferBalanceReport methodsFor: 'private' stamp: 'jmd 6/15/2022 00:49:18'!
selectTransferTransactions: transactions
	
	^transactions select: [:aTransaction | TransferLeg subclasses includes: aTransaction class ]! !


!TransferBalanceReport methodsFor: 'initialization' stamp: 'jmd 6/16/2022 00:26:45'!
initializeFor: anAccountTransactions
	
	accountTransactions := self selectTransferTransactions: anAccountTransactions.
	reportText := ''.! !


!TransferBalanceReport methodsFor: 'main protocol' stamp: 'jmd 6/15/2022 01:38:24'!
generateReport

	reportText := self balance! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'jmd 6/15/2022 01:30:49'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'printing' stamp: 'jmd 6/16/2022 00:16:30'!
updateReport: aReport
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'jmd 6/15/2022 01:30:49'!
value

	^ value! !


!Deposit methodsFor: 'iterating' stamp: 'jmd 6/16/2022 00:19:19'!
updateReport: aTransactionsReport

	^aTransactionsReport addDeposit: self! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'jmd 6/15/2022 01:30:49'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'jmd 6/15/2022 01:19:16'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'jmd 6/15/2022 01:19:16'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'jmd 6/15/2022 01:30:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'iterating' stamp: 'jmd 6/16/2022 00:19:28'!
updateReport: aTransactionsReport

	^aTransactionsReport addTransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'iterating' stamp: 'jmd 6/16/2022 00:19:35'!
updateReport: aTransactionsReport

	^aTransactionsReport addTransferWithdrawLeg: self! !


!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'jmd 6/15/2022 01:30:49'!
affectBalance: aBalance

	^aBalance + (self value negated)! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'jmd 6/15/2022 01:30:49'!
value

	^ value! !


!Withdraw methodsFor: 'iterating' stamp: 'jmd 6/16/2022 00:19:43'!
updateReport: aTransactionsReport

	^aTransactionsReport addWithdraw: self! !


!Withdraw methodsFor: 'balance' stamp: 'iv 6/13/2022 11:59:53'!
affectBalance: aBalance

	^aBalance + (value negated)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'jmd 6/15/2022 01:30:49'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
