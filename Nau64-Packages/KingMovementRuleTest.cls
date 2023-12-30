"Filed out from Dolphin Smallalk"!

ChessMovementRuleTest subclass: #KingMovementRuleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
KingMovementRuleTest guid: (GUID fromString: '{951355f1-70c1-4ab7-85e6-e2b32148813d}')!
KingMovementRuleTest comment: ''!
!KingMovementRuleTest categoriesForClass!Unclassified! !
!KingMovementRuleTest methodsFor!

testAnyOppositePieceIsXrayTheKingByOne
	| blackTower blackKnight |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '8/8/2kr3R/2n5/8/8/8/7K/ b - - 1 20')
		deployOn: chessboard.
	blackKnight := chessboard pieceAt: (#c5 asChessSquareIn: systemRoot).
	blackTower := chessboard pieceAt: (#d6 asChessSquareIn: systemRoot).
	self assert: (blackKnight isValidMoveFromCoordinate: #c5 to: #e4).
	self assert: (blackKnight isValidMoveFromCoordinate: #c5 to: #d3).
	self deny: (blackTower isValidMoveFromCoordinate: #d6 to: #d7).
	self deny: (blackTower isValidMoveFromCoordinate: #d6 to: #d5).
	self deny: (blackTower isValidMoveFromCoordinate: #d6 to: #d4).
	self deny: (blackTower isValidMoveFromCoordinate: #d6 to: #d1).
	self assert: (blackTower isValidMoveFromCoordinate: #d6 to: #e6).
	self assert: (blackTower isValidMoveFromCoordinate: #d6 to: #f6).
	self assert: (blackTower isValidMoveFromCoordinate: #d6 to: #g6)!

testBugKingMoveToAttackedPawnSquare
	| blackKing whitePawn pawnEngine |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot
		fenString: 'r2r4/p3qpk1/1pp5/2n1PpPp/P1PP2P1/5N1P/3Q4/R1R3K1/ b - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#g7 asChessSquareIn: systemRoot).
	whitePawn := chessboard pieceAt: (#g5 asChessSquareIn: systemRoot).
	pawnEngine := whitePawn newMovementEngine.
	pawnEngine computeAttackedSquaresOn: chessboard from: (#g5 asChessSquareIn: systemRoot).
	self assert: (pawnEngine includesAllSquares: (OrderedCollection with: (#f6 asChessSquareIn: systemRoot) with: (#h6 asChessSquareIn: systemRoot))).
	self deny: (blackKing isValidMoveFromCoordinate: #g7 to: #f6)!

testBugKingMoveToInvalidSquareOnChessboard
	| whiteKing |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'r7/8/K1k5/8/8/8/8/8/ w - - 1 20') deployOn: chessboard.
	whiteKing := chessboard pieceAt: (#a6 asChessSquareIn: systemRoot).
	self deny: (whiteKing isValidMoveFromCoordinate: #a6 to: #a5)!

testBugKingMoveToValidSquare
	| whiteKing |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '8/8/3Q4/2K5/6kb/4R3/8/2N5/ w KQ - 1 20') deployOn: chessboard.
	whiteKing := chessboard pieceAt: (#c5 asChessSquareIn: systemRoot).
	self assert: (whiteKing isValidMoveFromCoordinate: #c5 to: #c4).
	self assert: (whiteKing isValidMoveFromCoordinate: #c5 to: #d4)!

testCheckMates
	| checkMatedKing otherKing |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'r7/8/K1k5/8/8/8/8/8/ w - - 1 20') deployOn: chessboard.
	checkMatedKing := chessboard pieceAt: (#a6 asChessSquareIn: systemRoot).
	self assert: (checkMatedKing isCheckMatedOn: chessboard).
	otherKing := chessboard pieceAt: (#c6 asChessSquareIn: systemRoot).
	self deny: (otherKing isCheckMatedOn: chessboard).
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'B7/4R3/5Q2/1K6/4k3/R7/8/8/ w - - 1 20') deployOn: chessboard.
	checkMatedKing := chessboard pieceAt: (#e4 asChessSquareIn: systemRoot).
	self assert: (checkMatedKing isCheckMatedOn: chessboard).
	otherKing := chessboard pieceAt: (#b5 asChessSquareIn: systemRoot).
	self deny: (otherKing isCheckMatedOn: chessboard).
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'B7/4RQ2/8/1K6/4k3/R7/8/8/ w - - 1 20') deployOn: chessboard.
	checkMatedKing := chessboard pieceAt: (#e4 asChessSquareIn: systemRoot).
	self deny: (checkMatedKing isCheckMatedOn: chessboard).
	chessboard movePieceFromCoordiante: #f7 to: #f6.
	self assert: (checkMatedKing isCheckMatedOn: chessboard)!

testKingScope
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #b1.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #south) equals: 0.
	self assert: (squaresDictionary sizeAt: #southEast) equals: 0.
	self assert: (squaresDictionary sizeAt: #southWest) equals: 0.
	#(#a1) do: [:each | self assert: (squaresDictionary includesAtWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #west) equals: 1.
	#(#c1) do: [:each | self assert: (squaresDictionary includesAtEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #east) equals: 1.
	#(#b2) do: [:each | self assert: (squaresDictionary includesAtNorth: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #north) equals: 1.
	#(#a2) do: [:each | self assert: (squaresDictionary includesAtNorthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #northWest) equals: 1.
	#(#c2) do: [:each | self assert: (squaresDictionary includesAtNorthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #northEast) equals: 1.

	piece := chessboard pieceAtCoordinate: #b8.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #north) equals: 0.
	self assert: (squaresDictionary sizeAt: #northEast) equals: 0.
	self assert: (squaresDictionary sizeAt: #northWest) equals: 0.
	#(#a8) do: [:each | self assert: (squaresDictionary includesAtWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #west) equals: 1.
	#(#c8) do: [:each | self assert: (squaresDictionary includesAtEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #east) equals: 1.
	#(#b7) do: [:each | self assert: (squaresDictionary includesAtSouth: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #south) equals: 1.
	#(#a7) do: [:each | self assert: (squaresDictionary includesAtSouthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southWest) equals: 1.
	#(#c7) do: [:each | self assert: (squaresDictionary includesAtSouthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southEast) equals: 1.!

testPruneUnreachableSquares
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #b1.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#a2 #c2 #c1) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 

	self assert: (piece isInvalidMoveFrom: piece currentChessSquare to: (#a1 asChessSquareIn: systemRoot)).
	self assert: (piece isInvalidMoveFrom: piece currentChessSquare to: (#b2 asChessSquareIn: systemRoot)).

	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 3.
	!

testSlidingPieceAttackSquare
	| blackKing |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'B7/4R3/8/1K6/4k3/8/8/8/ w - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#e4 asChessSquareIn: systemRoot).
	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #d5).
	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #f3).
	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #e5).
	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #e3).
	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #d4).
	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #d3).
	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #f4).
	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #f5)!

testSlidingPieceSameSquareBug
	| blackKing |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '8/8/3R4/2K5/5p2/5k2/5Q2/8/ b - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#f3 asChessSquareIn: systemRoot).
	
	self assert: (blackKing isValidMoveFromCoordinate: #f3 to: #f2)!

testStackoverflowBug
	| blackKing |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'k1K5/8/8/8/8/8/8/8/ w - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#a8 asChessSquareIn: systemRoot).
	self assert: (blackKing isValidMoveFromCoordinate: #a8 to: #a7).
	self deny: (blackKing isValidMoveFromCoordinate: #a8 to: #b8)! !
!KingMovementRuleTest categoriesForMethods!
testAnyOppositePieceIsXrayTheKingByOne!public! !
testBugKingMoveToAttackedPawnSquare!public! !
testBugKingMoveToInvalidSquareOnChessboard!public! !
testBugKingMoveToValidSquare!public! !
testCheckMates!public! !
testKingScope!public! !
testPruneUnreachableSquares!public! !
testSlidingPieceAttackSquare!public! !
testSlidingPieceSameSquareBug!public! !
testStackoverflowBug!public! !
!

