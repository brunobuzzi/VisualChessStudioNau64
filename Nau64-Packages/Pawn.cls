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

attackedSquaresDo: aBlock
	| attackedSquares currentSquare |

	attackedSquares := OrderedCollection new.
	currentSquare := self currentChessSquare.
	self squaresScopeDo: [:squaresDictionary | 
		squaresDictionary squaresDo: [:square | (square fileIsEqualTo: currentSquare) ifFalse: [attackedSquares add: square]].
	].

	attackedSquares do: aBlock!

canBeMovedToValidCoordinate: symbolCoordinate on: aChessboard

	^(aChessboard squareNotEmptyAtCoordinate: symbolCoordinate) and: [self isOppositeSideTo: (aChessboard pieceAtCoordinate: symbolCoordinate)]!

fenString

	^self isBlack ifTrue: ['p'] ifFalse: ['P']!

isPawn

	^true!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	self isBlack 
	ifFalse: [aSquaresDictionary pruneUnreacheableSquaresFromWhitePawn] 
	ifTrue: [aSquaresDictionary pruneUnreacheableSquaresFromBlackPawn]
	!

validPromotionClasses

	^Array with: Queen with: Rook with: Bishop with: Knight! !
!Pawn categoriesForMethods!
attackedSquaresDo:!new framework!public! !
canBeMovedToValidCoordinate:on:!public!testing! !
fenString!public! !
isPawn!public!testing! !
pruneUnreacheableSquaresFrom:!new framework!public! !
validPromotionClasses!new framework!public! !
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

