"Filed out from Dolphin Smallalk"!

ChessMovementEngine subclass: #KnightMovementEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
KnightMovementEngine guid: (GUID fromString: '{2ae8f012-2eea-4b5b-bd15-83a935c87567}')!
KnightMovementEngine comment: ''!
!KnightMovementEngine categoriesForClass!Kernel-Objects! !
!KnightMovementEngine methodsFor!

computeReachableNorthEastSquaresOn: aChessboard from: aChessSquare

	self
		validSquaresFrom: aChessSquare 
				toFileShift: 2
				toRankShift: 1
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atNorthEastAdd: square]
				] 
				onErrorDo: [:ex | ].

	self
		validSquaresFrom: aChessSquare 
				toFileShift: 1
				toRankShift: 2
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atNorthEastAdd: square]
				] 
				onErrorDo: [:ex | ].
!

computeReachableNorthWestSquaresOn: aChessboard from: aChessSquare

	self
		validSquaresFrom: aChessSquare 
				toFileShift: -2
				toRankShift: 1
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atNorthWestAdd: square]
				] 
				onErrorDo: [:ex | ].

	self
		validSquaresFrom: aChessSquare 
				toFileShift: -1
				toRankShift: 2
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atNorthWestAdd: square]
				] 
				onErrorDo: [:ex | ].
!

computeReachableSouthEastSquaresOn: aChessboard from: aChessSquare

	self
		validSquaresFrom: aChessSquare 
				toFileShift: 2
				toRankShift: -1
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atSouthEastAdd: square]
				] 
				onErrorDo: [:ex | ].

	self
		validSquaresFrom: aChessSquare 
				toFileShift: 1
				toRankShift: -2
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atSouthEastAdd: square]
				] 
				onErrorDo: [:ex | ].
!

computeReachableSouthWestSquaresOn: aChessboard from: aChessSquare

	self
		validSquaresFrom: aChessSquare 
				toFileShift: -2
				toRankShift: -1
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atSouthWestAdd: square]
				] 
				onErrorDo: [:ex | ].

	self
		validSquaresFrom: aChessSquare 
				toFileShift: -1
				toRankShift: -2
				onSucessDo: [:square |
					(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
					ifTrue: [squaresDictionary atSouthWestAdd: square]
				] 
				onErrorDo: [:ex | ].
!

computeReachableSquaresOn: aChessboard from: aChessSquare

	self computeReachableNorthEastSquaresOn: aChessboard from: aChessSquare.
	self computeReachableNorthWestSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthEastSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthWestSquaresOn: aChessboard from: aChessSquare!

skeweredPieces: anInteger on: aChessboard from: aChessSquare
	^#()! !
!KnightMovementEngine categoriesForMethods!
computeReachableNorthEastSquaresOn:from:!public! !
computeReachableNorthWestSquaresOn:from:!public! !
computeReachableSouthEastSquaresOn:from:!public! !
computeReachableSouthWestSquaresOn:from:!public! !
computeReachableSquaresOn:from:!public! !
skeweredPieces:on:from:!public! !
!

!KnightMovementEngine class methodsFor!

icon
	^Knight icon! !
!KnightMovementEngine class categoriesForMethods!
icon!public! !
!

