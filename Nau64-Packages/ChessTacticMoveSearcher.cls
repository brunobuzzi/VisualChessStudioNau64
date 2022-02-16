"Filed out from Dolphin Smallalk"!

Object subclass: #ChessTacticMoveSearcher
	instanceVariableNames: 'chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessTacticMoveSearcher guid: (GUID fromString: '{63075551-f80b-4541-aad6-e74f0a35d401}')!
ChessTacticMoveSearcher comment: ''!
!ChessTacticMoveSearcher categoriesForClass!Unclassified! !
!ChessTacticMoveSearcher methodsFor!

setChessboard: aChessboard

	chessboard := aChessboard! !
!ChessTacticMoveSearcher categoriesForMethods!
setChessboard:!private! !
!

!ChessTacticMoveSearcher class methodsFor!

icon

	^Icon fromId: 'VisualObjectFinder.ico'!

newOn: aChessboard

	^self new setChessboard: aChessboard! !
!ChessTacticMoveSearcher class categoriesForMethods!
icon!public! !
newOn:!public! !
!

