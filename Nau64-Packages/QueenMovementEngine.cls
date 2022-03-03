"Filed out from Dolphin Smallalk"!

SlidingPieceMovementEngine subclass: #QueenMovementEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
QueenMovementEngine guid: (GUID fromString: '{9753ce39-170b-4e6b-8ae3-0ec07b800006}')!
QueenMovementEngine comment: ''!
!QueenMovementEngine categoriesForClass!Kernel-Objects! !
!QueenMovementEngine methodsFor!

addTo: aCollection validEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := 0.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift negated
				toRankShift: 0
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

addTo: aCollection validNorthSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := 0.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: 0
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

addTo: aCollection validSouthSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := 0.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: 0
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

addTo: aCollection validWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
	| oppositePieces |
	oppositePieces := 0.
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift
				toRankShift: 0
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
	self computeReachableNorthSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthSquaresOn: aChessboard from: aChessSquare.
	self computeReachableWestSquaresOn: aChessboard from: aChessSquare.
	self computeReachableEastSquaresOn: aChessboard from: aChessSquare.
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
	self
		addTo: validSquares
		validNorthSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: validSquares
		validWestSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: validSquares
		validSouthSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: validSquares
		validEastSquaresOn: aChessboard
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
		from: aChessSquare!

skewerPieceOn: aChessboard from: aChessSquare do: aBlock
	^self
		skeweredPieces: 1
		on: aChessboard
		from: aChessSquare
		do: aBlock! !
!QueenMovementEngine categoriesForMethods!
addTo:validEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validNorthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validNorthSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validNorthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableSquaresOn:from:!public! !
skeweredPieces:on:from:!extended squares!public! !
skeweredPiecesOn:from:skewerCountLimit:do:!extended squares!public! !
skewerPieceOn:from:!extended squares!public! !
skewerPieceOn:from:do:!extended squares!public! !
!

!QueenMovementEngine class methodsFor!

icon
	^Queen icon
! !
!QueenMovementEngine class categoriesForMethods!
icon!public! !
!

