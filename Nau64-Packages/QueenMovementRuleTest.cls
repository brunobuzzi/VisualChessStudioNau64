"Filed out from Dolphin Smallalk"!

SlidingPieceMovementEngineTest subclass: #QueenMovementRuleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
QueenMovementRuleTest guid: (GUID fromString: '{1c001ed7-7cb7-4535-a56e-530722a5ab9b}')!
QueenMovementRuleTest comment: ''!
!QueenMovementRuleTest categoriesForClass!Unclassified! !
!QueenMovementRuleTest methodsFor!

testPruneUnreachableSquares
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1B2qr/pp3bp1/5p1p/8/2P5/2NP2n1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #e1.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#d1 #c1 #d2 #f2 #g3 #f1 #g1) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 7.

	piece := chessboard pieceAtCoordinate: #g8.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#f8 #e8 #d8 #h7) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 4.!

testQueenMoves1
	| queen |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'r1bqkbnr/pp2p1pp/2p5/3pPp2/P2n4/2P2P2/1P4PP/RNBQKBNR/ w - - 1 20') deployOn: chessboard.
	queen := chessboard pieceAt: (#d1 asChessSquareIn: systemRoot).
	self deny: (queen isValidMoveFromCoordinate: #d1 to: #a4).
	self assert: (queen isValidMoveFromCoordinate: #d1 to: #b3).
	self assert: (queen isValidMoveFromCoordinate: #d1 to: #c2).
	self assert: (queen isValidMoveFromCoordinate: #d1 to: #d2).
	self assert: (queen isValidMoveFromCoordinate: #d1 to: #d3).
	self assert: (queen isValidMoveFromCoordinate: #d1 to: #d4).
	self assert: (queen isValidMoveFromCoordinate: #d1 to: #e2).
	self deny: (queen isValidMoveFromCoordinate: #d1 to: #f3).
	self deny: (queen isValidMoveFromCoordinate: #d1 to: #g4).
	self deny: (queen isValidMoveFromCoordinate: #d1 to: #h5).
	self deny: (queen isValidMoveFromCoordinate: #d1 to: #e3).
	self deny: (queen isValidMoveFromCoordinate: #d1 to: #c3).
	queen := chessboard pieceAt: (#d8 asChessSquareIn: systemRoot).
	self deny: (queen isValidMoveFromCoordinate: #d8 to: #e7).
	self assert: (queen isValidMoveFromCoordinate: #d8 to: #c7).
	self assert: (queen isValidMoveFromCoordinate: #d8 to: #b6).
	self assert: (queen isValidMoveFromCoordinate: #d8 to: #a5).
	self assert: (queen isValidMoveFromCoordinate: #d8 to: #d7).
	self assert: (queen isValidMoveFromCoordinate: #d8 to: #d6).
	self deny: (queen isValidMoveFromCoordinate: #d8 to: #e7).
	self deny: (queen isValidMoveFromCoordinate: #d8 to: #f6).
	self deny: (queen isValidMoveFromCoordinate: #d8 to: #g5).
	self deny: (queen isValidMoveFromCoordinate: #d8 to: #e6).
	self deny: (queen isValidMoveFromCoordinate: #d8 to: #c6)!

testQueenScope
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #e1.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #south) equals: 0.
	self assert: (squaresDictionary sizeAt: #southEast) equals: 0.
	self assert: (squaresDictionary sizeAt: #southWest) equals: 0.
	#(#d1 #c1 #b1 #a1) do: [:each | self assert: (squaresDictionary includesAtWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #west) equals: 4.
	#(#f1 #g1 #h1) do: [:each | self assert: (squaresDictionary includesAtEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #east) equals: 3.
	#(#d2 #c3 #b4 #a5) do: [:each | self assert: (squaresDictionary includesAtNorthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #northWest) equals: 4.
	#(#f2 #g3 #h4) do: [:each | self assert: (squaresDictionary includesAtNorthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #northEast) equals: 3.

	piece := chessboard pieceAtCoordinate: #g8.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #north) equals: 0.
	self assert: (squaresDictionary sizeAt: #northEast) equals: 0.
	self assert: (squaresDictionary sizeAt: #northWest) equals: 0.
	#(#f8 #e8 #d8 #c8 #b8 #a8) do: [:each | self assert: (squaresDictionary includesAtWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #west) equals: 6.
	#(#h8) do: [:each | self assert: (squaresDictionary includesAtEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #east) equals: 1.
	#(#f7 #e6 #d5 #c4 #b3 #a2) do: [:each | self assert: (squaresDictionary includesAtSouthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southWest) equals: 6.
	#(#h7) do: [:each | self assert: (squaresDictionary includesAtSouthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southEast) equals: 1.! !
!QueenMovementRuleTest categoriesForMethods!
testPruneUnreachableSquares!public! !
testQueenMoves1!public! !
testQueenScope!public! !
!

