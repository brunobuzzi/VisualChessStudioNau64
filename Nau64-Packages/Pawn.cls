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

generateSquaresScopeFrom: aChessSquareScope

	^aChessSquareScope generatePawnSquaresScope!

isPawn

	^true! !
!Pawn categoriesForMethods!
canBeMovedToValidCoordinate:on:!public!testing! !
fenString!public! !
generateSquaresScopeFrom:!new framework!public! !
isPawn!public!testing! !
!

!Pawn class methodsFor!

blackCodePoint

	^9823!

filePrefix
	" p - pawn "

	^'p'!

pieceCode
	^'p'!

whiteCodePoint

	^9817! !
!Pawn class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

