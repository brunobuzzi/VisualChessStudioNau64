"Filed out from Dolphin Smallalk"!

SlidingPieceMovementEngine subclass: #BishopMovementEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
BishopMovementEngine guid: (GUID fromString: '{5b97ba32-8786-4fb7-86eb-b139f7091f12}')!
BishopMovementEngine comment: ''!
!BishopMovementEngine categoriesForClass!Kernel-Objects! !
!BishopMovementEngine methodsFor!

addTo: aCollection validNorthEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := -1.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift
				toRankShift: shift
				onSucessDo: 
					[:square |
					((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece])
							ifTrue: [oppositePieces := oppositePieces + 1].
					(((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece]) and: [oppositePieces >= anInteger])
						ifTrue: [aCollection add: square].
				]
				onErrorDo: [:ex | ^self]]!

addTo: aCollection validNorthWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := -1.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift negated
				toRankShift: shift
				onSucessDo: 
					[:square |
					((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece])
							ifTrue: [oppositePieces := oppositePieces + 1].
					(((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece]) and: [oppositePieces >= anInteger])
						ifTrue: [aCollection add: square].
				]
				onErrorDo: [:ex | ^self]]!

addTo: aCollection validSouthEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := -1.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift
				toRankShift: shift negated
				onSucessDo: 
					[:square |
					((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece])
							ifTrue: [oppositePieces := oppositePieces + 1].
					(((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece]) and: [oppositePieces >= anInteger])
						ifTrue: [aCollection add: square].
				]
				onErrorDo: [:ex | ^self]]!

addTo: aCollection validSouthWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := -1.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift negated
				toRankShift: shift negated
				onSucessDo: 
					[:square |
					((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece])
							ifTrue: [oppositePieces := oppositePieces + 1].
					(((aChessboard squareNotEmptyAtCoordinate: square coordinate)
						and: [(aChessboard pieceAt: square) isOppositeSideTo: piece]) and: [oppositePieces >= anInteger])
						ifTrue: [aCollection add: square].
				]
				onErrorDo: [:ex | ^self]]!

computeReachableSquaresOn: aChessboard from: aChessSquare
	self computeReachableNorthEastSquaresOn: aChessboard from: aChessSquare.
	self computeReachableNorthWestSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthEastSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthWestSquaresOn: aChessboard from: aChessSquare!

skeweredPieces: anInteger on: aChessboard from: aChessSquare
	| validSquares |
	validSquares := OrderedCollection new.
	self
		addTo: validSquares
		validNorthEastSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: validSquares
		validNorthWestSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: validSquares
		validSouthEastSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: validSquares
		validSouthWestSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	^validSquares!

skeweredPiecesOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock

	self skeweredPiecesAtNorthEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.
	self skeweredPiecesAtNorthWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.
	self skeweredPiecesAtSouthEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.
	self skeweredPiecesAtSouthWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.!

skewerPieceOn: aChessboard from: aChessSquare
	^self
		skeweredPieces: 1
		on: aChessboard
		from: aChessSquare! !
!BishopMovementEngine categoriesForMethods!
addTo:validNorthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validNorthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableSquaresOn:from:!public! !
skeweredPieces:on:from:!extended squares!public! !
skeweredPiecesOn:from:skewerCountLimit:do:!extended squares!public! !
skewerPieceOn:from:!extended squares!public! !
!

!BishopMovementEngine class methodsFor!

icon

	^Bishop icon! !
!BishopMovementEngine class categoriesForMethods!
icon!public! !
!

