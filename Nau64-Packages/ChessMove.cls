"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMove
	instanceVariableNames: 'from to'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMove guid: (GUID fromString: '{0c860303-9721-4ac4-a233-829e9b5e5348}')!
ChessMove comment: ''!
!ChessMove categoriesForClass!Kernel-Objects! !
!ChessMove methodsFor!

isBlackOn: aChessboard

	^(aChessboard pieceAtCoordinate: to) isBlack! !
!ChessMove categoriesForMethods!
isBlackOn:!public! !
!

!ChessMove class methodsFor!

icon

	^Icon fromId: 'ValueConverter.ico'! !
!ChessMove class categoriesForMethods!
icon!public! !
!

