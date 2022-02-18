"Filed out from Dolphin Smallalk"!

ChessMovementEngine subclass: #SlidingPieceMovementEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SlidingPieceMovementEngine guid: (GUID fromString: '{4ea273cf-542c-4bcc-b620-da99f579f70e}')!
SlidingPieceMovementEngine comment: ''!
!SlidingPieceMovementEngine categoriesForClass!Unclassified! !
!SlidingPieceMovementEngine methodsFor!

computeReachableEastSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift
				toRankShift: 0
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atEastAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

computeReachableNorthEastSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift
				toRankShift: shift
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atNorthEastAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

computeReachableNorthEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
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
						ifTrue: [squaresDictionary atNorthEastAdd: square]]
				onErrorDo: [:ex | ^self]]!

computeReachableNorthSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: 0
				toRankShift: shift
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atNorthAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

computeReachableNorthWestSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift negated
				toRankShift: shift
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atNorthWestAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

computeReachableNorthWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
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
						ifTrue: [squaresDictionary atNorthWestAdd: square]]
				onErrorDo: [:ex | ^self]]!

computeReachableSouthEastSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift
				toRankShift: shift negated
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atSouthEastAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

computeReachableSouthEastSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
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
						ifTrue: [squaresDictionary atSouthEastAdd: square]]
				onErrorDo: [:ex | ^self]]!

computeReachableSouthSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: 0
				toRankShift: shift negated
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atSouthAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

computeReachableSouthWestSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift negated
				toRankShift: shift negated
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atSouthWestAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

computeReachableSouthWestSquaresOn: aChessboard from: aChessSquare skewerCountLimit: anInteger
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
						ifTrue: [squaresDictionary atSouthWestAdd: square]]
				onErrorDo: [:ex | ^self]]!

computeReachableWestSquaresOn: aChessboard from: aChessSquare
	1 to: 7
		do: 
			[:shift |
			self
				validSquaresFrom: aChessSquare
				toFileShift: shift negated
				toRankShift: 0
				onSucessDo: 
					[:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
						ifTrue: 
							[squaresDictionary atWestAdd: square.
							(aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [^self]]
						ifFalse: [^self]]
				onErrorDo: [:ex | ^self]]!

orientationVectorFrom: sourceChessSquare to: targetChessSquare
	| orientationVector |

	orientationVector := ChessOrientationVector newFor: piece.
	(sourceChessSquare isEqualTo: targetChessSquare) ifTrue: [^self error: 'An orientation vector for the same chess squares is useless' ].
	(sourceChessSquare rankIsGreaterThan: targetChessSquare) ifTrue: [orientationVector updateToSouth].
	(targetChessSquare rankIsGreaterThan: sourceChessSquare) ifTrue: [orientationVector updateToNorth].

	(sourceChessSquare fileIsGreaterThan: targetChessSquare) ifTrue: [orientationVector updateToWest].
	(targetChessSquare fileIsGreaterThan: sourceChessSquare) ifTrue: [orientationVector updateToEast].

	^orientationVector!

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
!SlidingPieceMovementEngine categoriesForMethods!
computeReachableEastSquaresOn:from:!normal squares!public! !
computeReachableNorthEastSquaresOn:from:!public! !
computeReachableNorthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableNorthSquaresOn:from:!normal squares!public! !
computeReachableNorthWestSquaresOn:from:!public! !
computeReachableNorthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableSouthEastSquaresOn:from:!public! !
computeReachableSouthEastSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableSouthSquaresOn:from:!normal squares!public! !
computeReachableSouthWestSquaresOn:from:!public! !
computeReachableSouthWestSquaresOn:from:skewerCountLimit:!extended squares!public! !
computeReachableWestSquaresOn:from:!normal squares!public! !
orientationVectorFrom:to:!public! !
slidingPieceAt:canReachSkippingOnePiece:on:!public! !
!

