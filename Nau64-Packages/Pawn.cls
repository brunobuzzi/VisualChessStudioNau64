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

blackPawnSquaresOn: aChessOrientationVector from: aChessSquare do: aBlock
	| slidingSquares |

	slidingSquares := OrderedCollection new.
	((aChessSquare fileNumber + aChessOrientationVector fileSign) isInChessRange and: [(aChessSquare rankNumber + aChessOrientationVector rankSign) isInChessRange])
	ifTrue: [ 
		aChessOrientationVector isSouth
		ifTrue: [aChessSquare isRankSeven
			ifTrue: [
				slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 1)).
				slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 2)).
			]
			ifFalse: [
				slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 1)).
			]
		]
		ifFalse: [
			slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 1)).
		].
	].

	slidingSquares do: aBlock!

canBeMovedToValidCoordinate: symbolCoordinate on: aChessboard

	^(aChessboard squareNotEmptyAtCoordinate: symbolCoordinate) and: [self isOppositeSideTo: (aChessboard pieceAtCoordinate: symbolCoordinate)]!

fenString

	^self isBlack ifTrue: ['p'] ifFalse: ['P']!

isPawn

	^true!

pgnString

	^'P'!

pgnStringForNotation

	^''!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	self isBlack 
	ifFalse: [aSquaresDictionary pruneUnreacheableSquaresFromWhitePawn] 
	ifTrue: [aSquaresDictionary pruneUnreacheableSquaresFromBlackPawn]
	!

squaresOn: aChessOrientationVector from: aChessSquare do: aBlock

	chessSide isWhite
	ifTrue: [self whitePawnSquaresOn: aChessOrientationVector from: aChessSquare do: aBlock]
	ifFalse: [self blackPawnSquaresOn: aChessOrientationVector from: aChessSquare do: aBlock]!

validPromotionClasses

	^self class validPromotionClasses!

whitePawnSquaresOn: aChessOrientationVector from: aChessSquare do: aBlock
	| slidingSquares |

	slidingSquares := OrderedCollection new.
	((aChessSquare fileNumber + aChessOrientationVector fileSign) isInChessRange and: [(aChessSquare rankNumber + aChessOrientationVector rankSign) isInChessRange])
	ifTrue: [ 
		aChessOrientationVector isNorth
		ifTrue: [aChessSquare isRankTwo
			ifTrue: [
				slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 1)).
				slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 2)).
			]
			ifFalse: [
				slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 1)).
			]
		]
		ifFalse: [
			slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 1)).
		].
	].

	slidingSquares do: aBlock! !
!Pawn categoriesForMethods!
attackedSquaresDo:!new framework!public! !
blackPawnSquaresOn:from:do:!new framework!public! !
canBeMovedToValidCoordinate:on:!public!testing! !
fenString!public! !
isPawn!public!testing! !
pgnString!public! !
pgnStringForNotation!public! !
pruneUnreacheableSquaresFrom:!new framework!public! !
squaresOn:from:do:!new framework!public! !
validPromotionClasses!new framework!public! !
whitePawnSquaresOn:from:do:!new framework!public! !
!

!Pawn class methodsFor!

blackCodePoint

	^9823!

filePrefix
	" p - pawn "

	^'p'!

pieceCode
	^'p'!

validPromotionClasses

	^Array with: Queen with: Rook with: Bishop with: Knight!

whiteCodePoint

	^9817! !
!Pawn class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
validPromotionClasses!new framework!public! !
whiteCodePoint!public!unicode! !
!

