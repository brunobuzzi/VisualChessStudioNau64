"Filed out from Dolphin Smallalk"!

ChessMovementEngine subclass: #KingMovementEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
KingMovementEngine guid: (GUID fromString: '{6b9b2f13-096f-497f-a4a2-c90cbb73e48a}')!
KingMovementEngine comment: ''!
!KingMovementEngine categoriesForClass!Kernel-Objects! !
!KingMovementEngine methodsFor!

computeReachableEastSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: 1
		toRankShift: 0
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atEastAdd: square]]
		onErrorDo: [:ex | ]!

computeReachableNorthEastSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: 1
		toRankShift: 1
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atNorthEastAdd: square]]
		onErrorDo: [:ex | ]!

computeReachableNorthSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: 0
		toRankShift: 1
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atNorthAdd: square]]
		onErrorDo: [:ex | ]!

computeReachableNorthWestSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: -1
		toRankShift: 1
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atNorthWestAdd: square]]
		onErrorDo: [:ex | ]!

computeReachableSouthEastSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: 1
		toRankShift: -1
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atSouthEastAdd: square]]
		onErrorDo: [:ex | ]!

computeReachableSouthSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: 0
		toRankShift: -1
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atSouthAdd: square]]
		onErrorDo: [:ex | ]!

computeReachableSouthWestSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: -1
		toRankShift: -1
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atSouthWestAdd: square]]
		onErrorDo: [:ex | ]!

computeReachableSquaresOn: aChessboard from: aChessSquare
	self computeReachableEastSquaresOn: aChessboard from: aChessSquare.
	self computeReachableNorthEastSquaresOn: aChessboard from: aChessSquare.
	self computeReachableNorthSquaresOn: aChessboard from: aChessSquare.
	self computeReachableNorthWestSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthEastSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthSquaresOn: aChessboard from: aChessSquare.
	self computeReachableSouthWestSquaresOn: aChessboard from: aChessSquare.
	self computeReachableWestSquaresOn: aChessboard from: aChessSquare!

computeReachableWestSquaresOn: aChessboard from: aChessSquare
	self
		validSquaresFrom: aChessSquare
		toFileShift: -1
		toRankShift: 0
		onSucessDo: 
			[:square |
			(self canBeMovedToValidCoordinate: square coordinate on: aChessboard)
				ifTrue: [squaresDictionary atWestAdd: square]]
		onErrorDo: [:ex | ]!

computeValidSquaresOn: aChessboard from: aChessSquare
	| oppositeSide reachableSquaresBySlidingPiece |

	super computeValidSquaresOn: aChessboard from: aChessSquare.

	oppositeSide := aChessboard oppositeSideOf: piece.

	oppositeSide piecesDo: [:oppPiece | | pieceRule |
		pieceRule := oppPiece newRule.
		pieceRule computeReachableSquaresOn: aChessboard from: oppPiece currentChessSquare.
		pieceRule squaresDictionaryDo: [:sqDictionary | squaresDictionary := squaresDictionary difference: sqDictionary].
	].

	reachableSquaresBySlidingPiece := OrderedCollection new.
	squaresDictionary squaresDo: [:square |
		oppositeSide slidingPiecesDo: [:oppPiece | | pieceRule |
			pieceRule := oppPiece newRule.
			(pieceRule slidingPieceAt: oppPiece currentChessSquare canReachSkippingOnePiece: square on: aChessboard)
			ifTrue: [reachableSquaresBySlidingPiece add: square].
		].
	].

	reachableSquaresBySlidingPiece do: [:square | squaresDictionary remove: square].!

isCheckMatedOn: aChessboard

	self computeValidSquaresOn: aChessboard from: piece currentChessSquare.

	^squaresDictionary isEmpty!

pressedSquaresOn: aChessboard from: aChessSquare after: aChessSquare2 
		self halt.
	^#()! !
!KingMovementEngine categoriesForMethods!
computeReachableEastSquaresOn:from:!public! !
computeReachableNorthEastSquaresOn:from:!public! !
computeReachableNorthSquaresOn:from:!public! !
computeReachableNorthWestSquaresOn:from:!public! !
computeReachableSouthEastSquaresOn:from:!public! !
computeReachableSouthSquaresOn:from:!public! !
computeReachableSouthWestSquaresOn:from:!public! !
computeReachableSquaresOn:from:!public! !
computeReachableWestSquaresOn:from:!public! !
computeValidSquaresOn:from:!public! !
isCheckMatedOn:!public! !
pressedSquaresOn:from:after:!public! !
!

!KingMovementEngine class methodsFor!

icon

	^King icon! !
!KingMovementEngine class categoriesForMethods!
icon!public! !
!

