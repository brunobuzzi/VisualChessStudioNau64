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

isValidBlackEnPassantMoveFrom: originCoordinate to: targetCoordinate on: aChessGame 

	self oppositeSideDo: [:side | (side anyPawnAtEnPassantMoveFrom: originCoordinate) ifFalse: [^false]].

	^aChessGame lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate
	!

isValidWhiteEnPassantMoveFrom: originCoordinate to: targetCoordinate on: aChessGame 

	self oppositeSideDo: [:side | (side anyPawnAtEnPassantMoveFrom: originCoordinate) ifFalse: [^false]].

	^aChessGame lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate
	!

pieceCode
	^'p'! !
!Pawn categoriesForMethods!
canBeMovedToValidCoordinate:on:!public!testing! !
fenString!public! !
isPawn!public!testing! !
isValidBlackEnPassantMoveFrom:to:on:!public! !
isValidWhiteEnPassantMoveFrom:to:on:!public! !
pieceCode!public! !
!

!Pawn class methodsFor!

filePrefix
	" p - pawn "

	^'p'! !
!Pawn class categoriesForMethods!
filePrefix!public! !
!

