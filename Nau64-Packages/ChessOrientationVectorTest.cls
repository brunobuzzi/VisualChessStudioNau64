"Filed out from Dolphin Smallalk"!

ChessVectorTest subclass: #ChessOrientationVectorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessOrientationVectorTest guid: (GUID fromString: '{f83f64ae-c949-4990-a51f-ea6c72826652}')!
ChessOrientationVectorTest comment: ''!
!ChessOrientationVectorTest categoriesForClass!Unclassified! !
!ChessOrientationVectorTest methodsFor!

testBugIncompatibleBishopMovement
	| bishop vector |

	parser := ChessFenParser newOn: systemRoot fenString: '8/8/8/8/3b4/8/8/8/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	bishop := chessboard pieceAtCoordinate: #d4.

	vector := ChessOrientationVector newFor: bishop.
	vector updateToWest.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot) do: [:square | 
		(square = (#c4 asChessSquareIn: systemRoot)) ifTrue: [self assert: false].
	].
	self assert: true.

	vector := ChessOrientationVector newFor: bishop.
	vector updateToEast.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot) do: [:square | 
		(square = (#e4 asChessSquareIn: systemRoot)) ifTrue: [self assert: false].
	].
	self assert: true.

	vector := ChessOrientationVector newFor: bishop.
	vector updateToNorth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot) do: [:square | 
		(square = (#d5 asChessSquareIn: systemRoot)) ifTrue: [self assert: false].
	].
	self assert: true.

	vector := ChessOrientationVector newFor: bishop.
	vector updateToSouth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot) do: [:square | 
		(square = (#d3 asChessSquareIn: systemRoot)) ifTrue: [self assert: false].
	].
	self assert: true.!

testBugIncompatibleQuenMovementAsBishop
	| queen vector validSquares |
	parser := ChessFenParser newOn: systemRoot fenString: '8/8/8/8/3q4/8/8/8/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	queen := chessboard pieceAtCoordinate: #d4.
	
	validSquares := #(#c3 b2 #a1).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToWest;
		updateToSouth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].

	validSquares := #(#c5 #b6 #a7).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToWest;
		updateToNorth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].

	validSquares := #(#e5 f6 #g7 #h8).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToEast;
		updateToNorth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].

	validSquares := #(#e3 #f2 #g1).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToEast;
		updateToSouth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].!

testBugIncompatibleQuenMovementAsRook
	| queen vector validSquares |
	parser := ChessFenParser newOn: systemRoot fenString: '8/8/8/8/3q4/8/8/8/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	queen := chessboard pieceAtCoordinate: #d4.
	
	validSquares := #(#d3 d2 #d1).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToSouth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].

	validSquares := #(#d5 d6 #d7 #d8).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToNorth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].

	validSquares := #(#e4 #f4 #g4 #h4).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToEast.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].

	validSquares := #(#c4 #b4 #a4).
	vector := ChessOrientationVector newFor: queen.
	vector
		updateToWest.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: 
			[:square |
			(validSquares includes: square coordinate) ifTrue: [self assert: true] ifFalse: [self assert: false]].!

testBugIncompatibleRookMovement
	| rook vector |
	parser := ChessFenParser newOn: systemRoot fenString: '8/8/8/8/3r4/8/8/8/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	rook := chessboard pieceAtCoordinate: #d4.
	vector := ChessOrientationVector newFor: rook.
	vector
		updateToWest;
		updateToSouth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: [:square | square = (#c3 asChessSquareIn: systemRoot) ifTrue: [self assert: false]].
	self assert: true.
	vector := ChessOrientationVector newFor: rook.
	vector
		updateToWest;
		updateToNorth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: [:square | square = (#c5 asChessSquareIn: systemRoot) ifTrue: [self assert: false]].
	self assert: true.
	vector := ChessOrientationVector newFor: rook.
	vector
		updateToEast;
		updateToNorth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: [:square | square = (#d5 asChessSquareIn: systemRoot) ifTrue: [self assert: false]].
	self assert: true.
	vector := ChessOrientationVector newFor: rook.
	vector
		updateToEast;
		updateToSouth.
	vector nextSquaresFrom: (#d4 asChessSquareIn: systemRoot)
		do: [:square | square = (#e3 asChessSquareIn: systemRoot) ifTrue: [self assert: false]].
	self assert: true! !
!ChessOrientationVectorTest categoriesForMethods!
testBugIncompatibleBishopMovement!public! !
testBugIncompatibleQuenMovementAsBishop!public! !
testBugIncompatibleQuenMovementAsRook!public! !
testBugIncompatibleRookMovement!public! !
!

