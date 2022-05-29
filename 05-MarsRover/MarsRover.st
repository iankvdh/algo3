!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:07:53'!
test01AnUnmovedMarsRoversPositionMatchesThePositionItWasIntializedIn
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	self assert: aMarsRover position equals: 1@2.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:09:18'!
test02AnEmptyStringOfCommandsDoesntChangeTheMarsRoverPosition
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	aMarsRover executeCommands: ''.
	self assert: aMarsRover position equals: 1@2.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:10:35'!
test03MarsRoverMovesForwardInTheRightDirection
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	aMarsRover executeCommands: 'f'.
	self assert: aMarsRover position equals: 1@3.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:11:22'!
test04MarsRoverUnderstandsMultipleCommandsInOneString
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	aMarsRover executeCommands: 'ff'.
	self assert: aMarsRover position equals: 1@4.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:12:19'!
test05MarsRoverMovesBackwardsInTheRightDirection
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	aMarsRover executeCommands: 'b'.
	self assert: aMarsRover position equals: 1@1.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:12:37'!
test06InvalidCommandRaisesError
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	self should: [aMarsRover executeCommands: 'x'] raise: Error description: MarsRover invalidCommandErrorDescription.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:46:58'!
test07MarsRoverProcessesAllCommandsPreviousToError
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	self should: [aMarsRover executeCommands: 'fx'] raise: Error withExceptionDo: 
		[ :unusedError | self assert: aMarsRover position equals: 1@3]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'jmd 5/29/2022 14:47:30'!
test08MarsRoverDoesntProcessCommandsAfterError
	| aMarsRover |
	aMarsRover := MarsRover inPosition: 1@2 facing: #North.
	self should: [aMarsRover executeCommands: 'fxf'] raise: Error withExceptionDo: 
		[:unusedError | self assert: aMarsRover position equals: 1@3]! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'initialPosition_CHANGE_ME cardinalPoint position facingTowards'
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

!MarsRover methodsFor: 'Commands' stamp: 'jmd 5/29/2022 14:42:58'!
stepForward
	facingTowards = #North ifTrue: [ ^0@1 ].
	facingTowards = #South ifTrue: [ ^0@-1 ].
	facingTowards = #East ifTrue: [ ^1@0 ].
	facingTowards = #West ifTrue: [ ^-1@0 ].! !

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
