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

testBishopScope
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #g2.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary includesAtNorthEast: (#h3 asChessSquareIn: systemRoot)).
	self assert: (squaresDictionary sizeAt: #northEast) equals: 1.
	self assert: (squaresDictionary includesAtSouthEast: (#h1 asChessSquareIn: systemRoot)).
	self assert: (squaresDictionary sizeAt: #southEast) equals: 1.
	self assert: (squaresDictionary includesAtSouthWest: (#f1 asChessSquareIn: systemRoot)).
	self assert: (squaresDictionary sizeAt: #southWest) equals: 1.
	#(#f3 #e4 #d5 #c6 #b7 #a8) do: [:each | self assert: (squaresDictionary includesAtNorthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #northWest) equals: 6.

	piece := chessboard pieceAtCoordinate: #f7.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary includesAtNorthEast: (#g8 asChessSquareIn: systemRoot)).
	self assert: (squaresDictionary sizeAt: #northEast) equals: 1.
	self assert: (squaresDictionary includesAtNorthWest: (#e8 asChessSquareIn: systemRoot)).
	self assert: (squaresDictionary sizeAt: #northEast) equals: 1.
	#(#g6 #h5) do: [:each | self assert: (squaresDictionary includesAtSouthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southEast) equals: 2.
	#(#e6 #d5 #c4 #b3 #a2) do: [:each | self assert: (squaresDictionary includesAtSouthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southWest) equals: 5.!

testInvalidMoveDueToCheck
	| reacheableSquares |
	parser := ChessFenParser newOn: systemRoot
				fenString: 'rnbqkb1R/1p1pp3/8/1pP3p1/4P1P1/P7/1PP2PP1/R3KBN1/ b - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f8.
	reacheableSquares := piece newMovementEngine computeReachableSquaresOn: chessboard
				from: (#f8 asChessSquareIn: systemRoot).
	self deny: (piece newMovementEngine
				isValidOn: chessboard
				from: (#f8 asChessSquareIn: systemRoot)
				to: (#g7 asChessSquareIn: systemRoot)).
	self assert: (reacheableSquares includes: (#g7 asChessSquareIn: systemRoot))!

testPruneUnreachableSquares
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #g2.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#f3 #e4 #d5 #c6 #b7 #f1 #h3) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 

	self assert: (piece isInvalidMoveFrom: piece currentChessSquare to: (#a8 asChessSquareIn: systemRoot)).
	self assert: (piece isInvalidMoveFrom: piece currentChessSquare to: (#h1 asChessSquareIn: systemRoot)).

	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 7.
	
!

testSkewerPiece
	| validSquares |
	parser := ChessFenParser newOn: systemRoot fenString: '8/2K5/3R4/8/5bk1/8/3Q4/2N5/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	validSquares := piece newMovementEngine skewerPieceOn: chessboard from: (#f4 asChessSquareIn: systemRoot).
	(#(#c7 #c1) collect: [:each | each asChessSquareIn: systemRoot])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 2!

testSkewerPieces
	| validSquares |
	parser := ChessFenParser newOn: systemRoot fenString: '1K6/2R5/3R4/8/5bk1/4Q3/3N4/2N5/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	validSquares := piece newMovementEngine
				skeweredPieces: 2
				on: chessboard
				from: (#f4 asChessSquareIn: systemRoot).
	(#(#b8 #c1) collect: [:each | each asChessSquareIn: systemRoot])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 2!

testSkewerPiecesAll
	| validSquares |
	parser := ChessFenParser newOn: systemRoot fenString: '1K5B/6R1/5R2/8/3Q2k1/2N5/1N6/b7/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #a1.
	validSquares := piece newMovementEngine
				skeweredPieces: 2
				on: chessboard
				from: (#a1 asChessSquareIn: systemRoot).
	(#(#d4 #f6 #g7 #h8) collect: [:each | each asChessSquareIn: systemRoot])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 4!

testSkewerPieceWithSpacedSquare
	| validSquares |
	parser := ChessFenParser newOn: systemRoot fenString: '1K6/8/3R4/8/5bk1/4Q3/8/2N5/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	validSquares := piece newMovementEngine skewerPieceOn: chessboard from: (#f4 asChessSquareIn: systemRoot).
	(#(#b8 #c1) collect: [:each | each asChessSquareIn: systemRoot])
		do: [:square | self assert: (validSquares includes: square)].
	self assert: validSquares size equals: 2!

testValidSquares
	| validSquares rule |
	parser := ChessFenParser newOn: systemRoot fenString: '8/2K5/3R4/8/5bk1/8/3Q4/2N5/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #f4.
	rule := piece newMovementEngine.
	rule computeReachableSquaresOn: chessboard from: (#f4 asChessSquareIn: systemRoot).
	validSquares := #(#e5 #d6 #g5 #h6 #e3 #d2 #g3 #h2) collect: [:each | each asChessSquareIn: systemRoot].
	self assert: (rule includesAllSquares: validSquares).
	self assert: rule squaresSize equals: 8! !
!BishopMovementRuleTest categoriesForMethods!
testBishopScope!public! !
testInvalidMoveDueToCheck!public! !
testPruneUnreachableSquares!public! !
testSkewerPiece!public! !
testSkewerPieces!public! !
testSkewerPiecesAll!public! !
testSkewerPieceWithSpacedSquare!public! !
testValidSquares!public! !
!

