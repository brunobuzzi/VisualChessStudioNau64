"Filed out from Dolphin Smallalk"!

ChessMovementEngine subclass: #PawnMovementEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PawnMovementEngine guid: (GUID fromString: '{a910370c-fa80-4c9f-adb9-9df3b8d66b91}')!
PawnMovementEngine comment: ''!
!PawnMovementEngine categoriesForClass!Kernel-Objects! !
!PawnMovementEngine methodsFor!

computeAttackedSquaresForBlackOn: aChessboard from: aChessSquare

	aChessSquare
		nextFile: 1
		nextRank: -1
		onSuccessDo: [:square | 
			(aChessboard  pieceAt: square) ifNotNil: [:attackedPiece | attackedPiece isWhite ifTrue: [squaresDictionary atSouthEastAdd: square]]]
		onErrorDo: [:ex | ].

	aChessSquare
		nextFile: -1
		nextRank: -1
		onSuccessDo: [:square | 
			(aChessboard  pieceAt: square) ifNotNil: [:attackedPiece | attackedPiece isWhite ifTrue: [squaresDictionary atSouthWestAdd: square]]]
		onErrorDo: [:ex | ].!

computeAttackedSquaresForWhiteOn: aChessboard from: aChessSquare

	aChessSquare
		nextFile: 1
		nextRank: 1
		onSuccessDo: [:square | 
			(aChessboard  pieceAt: square) ifNotNil: [:attackedPiece | attackedPiece isBlack ifTrue: [squaresDictionary atNorthEastAdd: square]]]
		onErrorDo: [:ex | ].

	aChessSquare
		nextFile: -1
		nextRank: 1
		onSuccessDo: [:square | 
			(aChessboard  pieceAt: square) ifNotNil: [:attackedPiece | attackedPiece isBlack ifTrue: [squaresDictionary atNorthWestAdd: square]]]
		onErrorDo: [:ex | ].!

computeAttackedSquaresOn: aChessboard from: aChessSquare 
	piece isBlack 
	ifTrue: [self computeAttackedSquaresForBlackOn: aChessboard from: aChessSquare ] 
	ifFalse: [self computeAttackedSquaresForWhiteOn: aChessboard from: aChessSquare ]!

computeReachableSquaresForBlackOn: aChessboard from: aChessSquare 

	self computeAttackedSquaresForBlackOn: aChessboard from: aChessSquare.

	aChessSquare
		nextFile: 0
		nextRank: -1
		onSuccessDo: [:square | squaresDictionary atNorthAdd: square]
		onErrorDo: [:ex | ].

	(aChessSquare rankNumber = 7) ifFalse: [^self].

	aChessSquare
		nextFile: 0
		nextRank: -2
		onSuccessDo: [:square | squaresDictionary atNorthAdd: square]
		onErrorDo: [:ex | ].!

computeReachableSquaresForWhiteOn: aChessboard from: aChessSquare 

	self computeAttackedSquaresForWhiteOn: aChessboard from: aChessSquare.

	aChessSquare
		nextFile: 0
		nextRank: 1
		onSuccessDo: [:square | squaresDictionary atNorthAdd: square]
		onErrorDo: [:ex | ].

	(aChessSquare rankNumber = 2) ifFalse: [^self].

	aChessSquare
		nextFile: 0
		nextRank: 2
		onSuccessDo: [:square | squaresDictionary atNorthAdd: square]
		onErrorDo: [:ex | ].!

computeReachableSquaresOn: aChessboard from: aChessSquare 
	piece isBlack 
	ifTrue: [self computeReachableSquaresForBlackOn: aChessboard from: aChessSquare ] 
	ifFalse: [self computeReachableSquaresForWhiteOn: aChessboard from: aChessSquare ]! !
!PawnMovementEngine categoriesForMethods!
computeAttackedSquaresForBlackOn:from:!public! !
computeAttackedSquaresForWhiteOn:from:!public! !
computeAttackedSquaresOn:from:!public! !
computeReachableSquaresForBlackOn:from:!public! !
computeReachableSquaresForWhiteOn:from:!public! !
computeReachableSquaresOn:from:!public! !
!

!PawnMovementEngine class methodsFor!

icon
	^Pawn icon! !
!PawnMovementEngine class categoriesForMethods!
icon!public! !
!

