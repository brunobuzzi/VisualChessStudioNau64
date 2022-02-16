"Filed out from Dolphin Smallalk"!

SlidingPieceMovementEngineTest subclass: #BishopMovementRuleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
BishopMovementRuleTest guid: (GUID fromString: '{129cf9fa-e089-427b-b9ec-4f9ec866ac28}')!
BishopMovementRuleTest comment: ''!
!BishopMovementRuleTest categoriesForClass!Unclassified! !
!BishopMovementRuleTest methodsFor!

testSkewerPiece
	| validSquares |
	parser := ChessFenParser on: '8/2K5/3R4/8/5bk1/8/3Q4/2N5/'.
	chessboard := Chessboard newEmpty.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	validSquares := piece newMovementEngine skewerPieceOn: chessboard from: #f4 asChessSquare.
	(#(#c7 #c1) collect: [:each | each asChessSquare])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 2!

testSkewerPieces
	| validSquares |
	parser := ChessFenParser on: '1K6/2R5/3R4/8/5bk1/4Q3/3N4/2N5/'.
	chessboard := Chessboard newEmpty.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	validSquares := piece newMovementEngine
				skeweredPieces: 2
				on: chessboard
				from: #f4 asChessSquare.
	(#(#b8 #c1) collect: [:each | each asChessSquare])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 2!

testSkewerPiecesAll
	| validSquares |
	parser := ChessFenParser on: '1K5B/6R1/5R2/8/3Q2k1/2N5/1N6/b7/'.
	chessboard := Chessboard newEmpty.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #a1.
	validSquares := piece newMovementEngine
				skeweredPieces: 2
				on: chessboard
				from: #a1 asChessSquare.
	(#(#d4 #f6 #g7 #h8) collect: [:each | each asChessSquare])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 4!

testSkewerPieceWithSpacedSquare
	| validSquares |
	parser := ChessFenParser on: '1K6/8/3R4/8/5bk1/4Q3/8/2N5/'.
	chessboard := Chessboard newEmpty.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	validSquares := piece newMovementEngine skewerPieceOn: chessboard from: #f4 asChessSquare.
	(#(#b8 #c1) collect: [:each | each asChessSquare])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 2!

testValidSquares
	| validSquares rule |
	parser := ChessFenParser on: '8/2K5/3R4/8/5bk1/8/3Q4/2N5/'.
	chessboard := Chessboard newEmpty.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	rule := piece newMovementEngine.
	rule computeReachableSquaresOn: chessboard from: #f4 asChessSquare.
	validSquares := #(#e5 #d6 #g5 #h6 #e3 #d2 #g3 #h2) collect: [:each | each asChessSquare].
	self assert: (rule includesAllSquares: validSquares).
	self assert: rule squaresSize equals: 8! !
!BishopMovementRuleTest categoriesForMethods!
testSkewerPiece!public! !
testSkewerPieces!public! !
testSkewerPiecesAll!public! !
testSkewerPieceWithSpacedSquare!public! !
testValidSquares!public! !
!

