!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'aaaMarsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:26:12'!
setUp
	aaaMarsRover := MarsRover inPosition: 1@2 facing: North! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:26:32'!
test01AnUnmovedMarsRoversPositionMatchesThePositionItWasIntializedIn
	self assert: aaaMarsRover position equals: 1@2.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:26:48'!
test02AnEmptyStringOfCommandsDoesntChangeTheMarsRoverPosition
	aaaMarsRover executeCommands: ''.
	self assert: aaaMarsRover position equals: 1@2.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:27:00'!
test03MarsRoverMovesForwardInTheRightDirection
	aaaMarsRover executeCommands: 'f'.
	self assert: aaaMarsRover position equals: 1@3.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:27:13'!
test04MarsRoverUnderstandsMultipleCommandsInOneString
	aaaMarsRover executeCommands: 'ff'.
	self assert: aaaMarsRover position equals: 1@4.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:27:23'!
test05MarsRoverMovesBackwardsInTheRightDirection
	aaaMarsRover executeCommands: 'b'.
	self assert: aaaMarsRover position equals: 1@1.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:27:33'!
test06InvalidCommandRaisesError
	self should: [aaaMarsRover executeCommands: 'x'] raise: Error description: MarsRover invalidCommandErrorDescription.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:27:41'!
test07MarsRoverProcessesAllCommandsPreviousToError
	self should: [aaaMarsRover executeCommands: 'fx'] raise: Error withExceptionDo: 
		[ :unusedError | self assert: aaaMarsRover position equals: 1@3]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:27:53'!
test08MarsRoverDoesntProcessCommandsAfterError
	self should: [aaaMarsRover executeCommands: 'fxf'] raise: Error withExceptionDo: 
		[:unusedError | self assert: aaaMarsRover position equals: 1@3]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:28:01'!
test09MarsRoverRotateLeftCorrectly
	aaaMarsRover executeCommands: 'l'.
	self assert: aaaMarsRover facingTowards = West! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:28:09'!
test10MarsRoverRotateRightCorrectly
	aaaMarsRover executeCommands: 'r'.
	self assert: aaaMarsRover facingTowards = East ! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:28:18'!
test11MarsRoverMovesForwardInTheRightDirectionAfterRotateToLeft
	aaaMarsRover executeCommands: 'l'.
	aaaMarsRover  executeCommands: 'f'.
	self assert: aaaMarsRover position = (0@2)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:28:29'!
test12MarsRoverMovesForwardInTheRightDirectionAfterRotateToRight
	aaaMarsRover executeCommands: 'r'.
	aaaMarsRover  executeCommands: 'f'.
	self assert: aaaMarsRover position = (2@2)! !


!classDefinition: #CardinalPoints category: 'MarsRover'!
Object subclass: #CardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoints class' category: 'MarsRover'!
CardinalPoints class
	instanceVariableNames: ''!

!CardinalPoints class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:57:38'!
leftCardinalPoint
	self subclassResponsibility ! !

!CardinalPoints class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:57:46'!
rightCardinalPoint
	self subclassResponsibility ! !

!CardinalPoints class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:17:40'!
stepForward
	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRover'!
CardinalPoints subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:58:59'!
leftCardinalPoint
	^North! !

!East class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:59:02'!
rightCardinalPoint
	^South! !

!East class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:18:12'!
stepForward
	^1@0
! !


!classDefinition: #North category: 'MarsRover'!
CardinalPoints subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:59:06'!
leftCardinalPoint
	^West! !

!North class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:59:11'!
rightCardinalPoint
	^East! !

!North class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:18:25'!
stepForward
	^0@1! !


!classDefinition: #South category: 'MarsRover'!
CardinalPoints subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:59:15'!
leftCardinalPoint
	^East! !

!South class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:59:20'!
rightCardinalPoint
	^West! !

!South class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:18:42'!
stepForward
	^0@-1! !


!classDefinition: #West category: 'MarsRover'!
CardinalPoints subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:59:23'!
leftCardinalPoint
	^South! !

!West class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:59:26'!
rightCardinalPoint
	^North! !

!West class methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:18:58'!
stepForward
	^-1@0! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position facingTowards'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'jmd 5/29/2022 13:50:08'!
initializeInPosition: initialPosition facing: aCardinalPoint 
	position := initialPosition.
	facingTowards := aCardinalPoint.! !


!MarsRover methodsFor: 'accessing' stamp: 'jmd 5/29/2022 13:50:45'!
position
	^position! !


!MarsRover methodsFor: 'Commands' stamp: 'jmd 5/29/2022 14:45:38'!
executeCommand: aCharacter 
	aCharacter = $f ifTrue: [ ^self moveForward ].
	aCharacter = $b ifTrue: [ ^self moveBackwards ].
	aCharacter = $r ifTrue: [ ^self turnRight ].
	aCharacter = $l ifTrue: [ ^self turnLeft ].
	self error: self class invalidCommandErrorDescription.! !

!MarsRover methodsFor: 'Commands' stamp: 'jmd 5/29/2022 14:37:13'!
executeCommands: aString 
	aString do: [ :aCharacter | self executeCommand: aCharacter ].! !

!MarsRover methodsFor: 'Commands' stamp: 'jmd 5/29/2022 14:43:34'!
moveBackwards
	position := position - self stepForward.! !

!MarsRover methodsFor: 'Commands' stamp: 'jmd 5/29/2022 14:41:50'!
moveForward
	position := position + self stepForward.! !

!MarsRover methodsFor: 'Commands' stamp: 'iv 5/29/2022 17:19:49'!
stepForward
	^facingTowards stepForward! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:43:41'!
facingTowards
	^facingTowards ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 16:55:53'!
turnLeft
	facingTowards := facingTowards leftCardinalPoint! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'iv 5/29/2022 17:09:15'!
turnRight
	facingTowards := facingTowards rightCardinalPoint ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'jmd 5/29/2022 13:48:39'!
inPosition: initialPosition facing: aCardinalPoint
	^self new initializeInPosition: initialPosition facing: aCardinalPoint ! !


!MarsRover class methodsFor: 'ErrorDescriptions' stamp: 'jmd 5/29/2022 14:44:42'!
invalidCommandErrorDescription
	^'Command not understood'.! !
