"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #Pawn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Pawn guid: (GUID fromString: '{3d2f28ad-ac25-4301-a230-562b26aca416}')!
Pawn comment: ''!
!Pawn categoriesForClass!Kernel-Objects! !
!Pawn methodsFor!

canBeMovedToValidCoordinate: symbolCoordinate on: aChessboard

	^(aChessboard squareNotEmptyAtCoordinate: symbolCoordinate) and: [self isOppositeSideTo: (aChessboard pieceAtCoordinate: symbolCoordinate)]!

fenString

	^self isBlack ifTrue: ['p'] ifFalse: ['P']!

isPawn

	^true!

pieceCode
	^'p'! !
!Pawn categoriesForMethods!
canBeMovedToValidCoordinate:on:!public!testing! !
fenString!public! !
isPawn!public!testing! !
pieceCode!public! !
!

!Pawn class methodsFor!

filePrefix
	" p - pawn "

	^'p'! !
!Pawn class categoriesForMethods!
filePrefix!public! !
!

