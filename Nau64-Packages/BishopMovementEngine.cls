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

skewerPieceOn: aChessboard from: aChessSquare
	^self
		skeweredPieces: 1
		on: aChessboard
		from: aChessSquare!

slidingPieceAt: sourceChessSquare canReachSkippingOnePiece: targetChessSquare on: aChessboard
	| orientationVector reachedPieces |

	reachedPieces := 0.
	orientationVector := self orientationVectorFrom: sourceChessSquare to: targetChessSquare.

	orientationVector nextSquaresFrom: sourceChessSquare do: [:square | 
		(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [reachedPieces := reachedPieces + 1].
		(reachedPieces <= 1 and: [square = targetChessSquare]) ifTrue: [^true].
		reachedPieces > 1 ifTrue: [^false].
	].

	^false! !
!BishopMovementEngine categoriesForMethods!
addTo:validNorthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validNorthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
addTo:validSouthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableSquaresOn:from:!public! !
skeweredPieces:on:from:!extended squares!public! !
skewerPieceOn:from:!extended squares!public! !
slidingPieceAt:canReachSkippingOnePiece:on:!public! !
!

!BishopMovementEngine class methodsFor!

icon

	^Bishop icon! !
!BishopMovementEngine class categoriesForMethods!
icon!public! !
!

