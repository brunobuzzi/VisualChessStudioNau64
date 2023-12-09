"Filed out from Dolphin Smallalk"!

SlidingPieceMovementEngine subclass: #RookMovementEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RookMovementEngine guid: (GUID fromString: '{a058c515-a69e-4450-a95e-f0313a38676b}')!
RookMovementEngine comment: ''!
!RookMovementEngine categoriesForClass!Kernel-Objects! !
!RookMovementEngine methodsFor!

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
	self computeReachableEastSquaresOn: aChessboard from: aChessSquare!

skeweredPieces: anInteger on: aChessboard from: aChessSquare
	| extendedValidSquares |
	extendedValidSquares := OrderedCollection new.
	self
		addTo: extendedValidSquares
		validNorthSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: extendedValidSquares
		validWestSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: extendedValidSquares
		validSouthSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	self
		addTo: extendedValidSquares
		validEastSquaresOn: aChessboard
		from: aChessSquare
		skewerCountLimit: anInteger.
	^extendedValidSquares!

skeweredPiecesOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock

	self skeweredPiecesAtNorthSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.
	self skeweredPiecesAtSouthSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.
	self skeweredPiecesAtWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.
	self skeweredPiecesAtEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger do: aBlock.!

skewerPieceOn: aChessboard from: aChessSquare
	^self
		skeweredPieces: 1
		on: aChessboard
		from: aChessSquare! !
!RookMovementEngine categoriesForMethods!
addTo:validEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validNorthSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableSquaresOn:from:!public! !
skeweredPieces:on:from:!extended squares!public! !
skeweredPiecesOn:from:skewerCountLimit:do:!public! !
skewerPieceOn:from:!extended squares!public! !
!

!RookMovementEngine class methodsFor!

icon
	^Rook icon! !
!RookMovementEngine class categoriesForMethods!
icon!public! !
!

