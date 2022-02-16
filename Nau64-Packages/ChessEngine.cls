"Filed out from Dolphin Smallalk"!

Object subclass: #ChessEngine
	instanceVariableNames: 'chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEngine guid: (GUID fromString: '{78c8982b-e8b5-4cee-9ede-5772373b4ae8}')!
ChessEngine comment: ''!
!ChessEngine categoriesForClass!Kernel-Objects! !
!ChessEngine methodsFor!

calculateNextMoveForBlack!

calculateNextMoveForWhite!

setChessboard: aChessboard

	chessboard := aChessboard! !
!ChessEngine categoriesForMethods!
calculateNextMoveForBlack!public! !
calculateNextMoveForWhite!public! !
setChessboard:!private! !
!

!ChessEngine class methodsFor!

icon

	^Icon fromId: 'SystemBrowserShell.ico'!

newOn: aChessboard

	^self new setChessboard: aChessboard! !
!ChessEngine class categoriesForMethods!
icon!public! !
newOn:!public! !
!

