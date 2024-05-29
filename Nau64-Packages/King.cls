"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #King
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
King guid: (GUID fromString: '{dd0a5697-2022-4ef0-859c-3eaf90c9e114}')!
King comment: ''!
!King categoriesForClass!Kernel-Objects! !
!King methodsFor!

fenString

	^self isBlack ifTrue: ['k'] ifFalse: ['K']!

isChecked
	| isAttacked |

	isAttacked := false.
	self oppositeSideDo: [:oppositeSide | 
		oppositeSide squaresToMoveDo: [:square | (square == self currentChessSquare) ifTrue: [isAttacked := true]]
	].

	^isAttacked!

isCheckMated
	| secureSquares isAttacked |

	isAttacked := false.
	self oppositeSideDo: [:oppositeSide | 
		oppositeSide squaresToMoveDo: [:square | (square == self currentChessSquare) ifTrue: [isAttacked := true]]
	].
	secureSquares := OrderedCollection new.
	self secureSquaresFrom: self currentChessSquare do: [:square | secureSquares add: square].
	^secureSquares isEmpty and: [isAttacked]!

isKing

	^true!

pgnString

	^'K'!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	aSquaresDictionary pruneUnreacheableSquaresFromKing!

secureSquaresFrom: aChessSquare do: aBlock
	| attackedSquares xRaySquares |

	xRaySquares := OrderedCollection new.
	attackedSquares := OrderedCollection new.
	self oppositeSideDo: [:oppositeSide | 
		oppositeSide piecesDo: [:oppositePiece |
			oppositePiece attackedSquaresDo: [:square | attackedSquares add: square].
			oppositePiece absoluteXRaySquaresDo: [:square | xRaySquares add: square].
		].
	].

	self validSquaresDictionaryFrom: aChessSquare do: [:squaresDictionary |
		attackedSquares do: [:square | squaresDictionary remove: square].
		xRaySquares do: [:square | squaresDictionary remove: square].
		squaresDictionary squaresDo: aBlock
	].
!

squaresOn: aChessOrientationVector from: aChessSquare do: aBlock
	| slidingSquares nextSquare |

	slidingSquares := OrderedCollection new.
	((aChessSquare fileNumber + aChessOrientationVector fileSign) isInChessRange and: [(aChessSquare rankNumber + aChessOrientationVector rankSign) isInChessRange])
	ifTrue: [ 
		nextSquare := aChessSquare next: aChessOrientationVector.
		slidingSquares add: nextSquare].

	slidingSquares do: aBlock!

squaresToMoveDo: aBlock

	self secureSquaresDo: aBlock!

squaresToMoveFrom: aChessSquare do: aBlock

	self secureSquaresFrom: aChessSquare do: aBlock! !
!King categoriesForMethods!
fenString!public! !
isChecked!new framework!public! !
isCheckMated!new framework!public! !
isKing!public!testing! !
pgnString!public! !
pruneUnreacheableSquaresFrom:!new framework!public! !
secureSquaresFrom:do:!new framework!public! !
squaresOn:from:do:!new framework!public! !
squaresToMoveDo:!new framework!public! !
squaresToMoveFrom:do:!new framework!public! !
!

!King class methodsFor!

blackCodePoint

	^9818
!

filePrefix
	" k - king "

	^'k'!

pieceCode
	^'k'!

whiteCodePoint

	^9812! !
!King class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

