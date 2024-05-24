"Filed out from Dolphin Smallalk"!

Object subclass: #ChessEngine
	instanceVariableNames: 'game gameExecutors sideName enterThinkingLoop'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEngine guid: (GUID fromString: '{78c8982b-e8b5-4cee-9ede-5772373b4ae8}')!
ChessEngine comment: ''!
!ChessEngine categoriesForClass!Kernel-Objects! !
!ChessEngine methodsFor!

calculateNextMoveForBlack

	game currentPhase calculateNextMoveForBlack!

calculateNextMoveForBlackInEndGame!

calculateNextMoveForBlackInMiddleGame!

calculateNextMoveForBlackInOpenningGame!

calculateNextMoveForWhite

	game currentPhase calculateNextMoveForWhite!

calculateNextMoveForWhiteInEndGame!

calculateNextMoveForWhiteInMiddleGame!

calculateNextMoveForWhiteInOpenningGame!

resumeThinking

	enterThinkingLoop := true

	!

setBlackGame: aChessGame

	self setGame: aChessGame.

	sideName := #black!

setGame: aChessGame

	enterThinkingLoop := true.
	gameExecutors := OrderedCollection new.
	game := aChessGame.!

setWhiteGame: aChessGame

	self setGame: aChessGame.

	sideName := #white!

stopThinking

	enterThinkingLoop := false

	!

thinkingLoop

	[enterThinkingLoop] whileTrue: [


	].! !
!ChessEngine categoriesForMethods!
calculateNextMoveForBlack!position evalaution!public! !
calculateNextMoveForBlackInEndGame!position evalaution!public! !
calculateNextMoveForBlackInMiddleGame!position evalaution!public! !
calculateNextMoveForBlackInOpenningGame!position evalaution!public! !
calculateNextMoveForWhite!position evalaution!public! !
calculateNextMoveForWhiteInEndGame!position evalaution!public! !
calculateNextMoveForWhiteInMiddleGame!position evalaution!public! !
calculateNextMoveForWhiteInOpenningGame!position evalaution!public! !
resumeThinking!loop!public! !
setBlackGame:!private! !
setGame:!private! !
setWhiteGame:!private! !
stopThinking!loop!public! !
thinkingLoop!loop!public! !
!

!ChessEngine class methodsFor!

icon

	^Icon fromId: 'SystemBrowserShell.ico'!

newBlackOn: aChessGame

	^self new setBlackGame: aChessGame!

newWhiteOn: aChessGame

	^self new setWhiteGame: aChessGame! !
!ChessEngine class categoriesForMethods!
icon!public! !
newBlackOn:!public! !
newWhiteOn:!public! !
!

