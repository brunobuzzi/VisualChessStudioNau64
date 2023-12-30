"Filed out from Dolphin Smallalk"!

ChessMovementRuleTest subclass: #KnightMovementRuleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
KnightMovementRuleTest guid: (GUID fromString: '{6be22118-9fb1-4e6d-a12f-2c1d5e147155}')!
KnightMovementRuleTest comment: ''!
!KnightMovementRuleTest categoriesForClass!Unclassified! !
!KnightMovementRuleTest methodsFor!

testAbsolutePin
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: '1k1b1R2/ppp5/8/4p3/3p4/P7/1PP5/2K5/ b - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #d8.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.!

testBothSidesMoves
	| knight |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '8/1k6/1pp1ppp1/1r3P2/3NP2n/1PPP1R2/2K5/8/ w - - 1 20') deployOn: chessboard.
	knight := chessboard pieceAt: (#d4 asChessSquareIn: systemRoot).
	self assert: (knight isValidMoveFromCoordinate: #d4 to: #c6).
	self assert: (knight isValidMoveFromCoordinate: #d4 to: #b5).
	self assert: (knight isValidMoveFromCoordinate: #d4 to: #e6).
	self deny: (knight isValidMoveFromCoordinate: #d4 to: #b3).
	self deny: (knight isValidMoveFromCoordinate: #d4 to: #f3).
	self deny: (knight isValidMoveFromCoordinate: #d4 to: #f5).
	knight := chessboard pieceAt: (#h4 asChessSquareIn: systemRoot).
	self assert: (knight isValidMoveFromCoordinate: #h4 to: #f5).
	self assert: (knight isValidMoveFromCoordinate: #h4 to: #f3).
	self assert: (knight isValidMoveFromCoordinate: #h4 to: #g2).
	self deny: (knight isValidMoveFromCoordinate: #h4 to: #g6)!

testKnightScope
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #c3.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	#(#b5 #a4) do: [:each | self assert: (squaresDictionary includesAtNorthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #northWest) equals: 2.
	#(#d5 #e4) do: [:each | self assert: (squaresDictionary includesAtNorthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #northEast) equals: 2.
	#(#a2 #b1) do: [:each | self assert: (squaresDictionary includesAtSouthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southWest) equals: 2.
	#(#d1 #e2) do: [:each | self assert: (squaresDictionary includesAtSouthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southEast) equals: 2.

	piece := chessboard pieceAtCoordinate: #d8.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #northWest) equals: 0.
	self assert: (squaresDictionary sizeAt: #northEast) equals: 0.
	#(#b7 #c6) do: [:each | self assert: (squaresDictionary includesAtSouthWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southWest) equals: 2.
	#(#e6 #f7) do: [:each | self assert: (squaresDictionary includesAtSouthEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #southEast) equals: 2.
!

testOpeningMoves
	| knight |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR/ w - - 1 20') deployOn: chessboard.
	knight := chessboard pieceAt: (#b1 asChessSquareIn: systemRoot).
	self assert: (knight isValidMoveFromCoordinate: #b1 to: #a3).
	self assert: (knight isValidMoveFromCoordinate: #b1 to: #c3).
	self deny: (knight isValidMoveFromCoordinate: #b1 to: #d2).
	knight := chessboard pieceAt: (#g1 asChessSquareIn: systemRoot).
	self assert: (knight isValidMoveFromCoordinate: #g1 to: #f3).
	self assert: (knight isValidMoveFromCoordinate: #g1 to: #h3).
	self deny: (knight isValidMoveFromCoordinate: #g1 to: #e2).
	knight := chessboard pieceAt: (#b8 asChessSquareIn: systemRoot).
	self assert: (knight isValidMoveFromCoordinate: #b8 to: #a6).
	self assert: (knight isValidMoveFromCoordinate: #b8 to: #c6).
	self deny: (knight isValidMoveFromCoordinate: #b8 to: #d7).
	knight := chessboard pieceAt: (#g8 asChessSquareIn: systemRoot).
	self assert: (knight isValidMoveFromCoordinate: #g8 to: #f6).
	self assert: (knight isValidMoveFromCoordinate: #g8 to: #h6).
	self deny: (knight isValidMoveFromCoordinate: #g8 to: #e7)!

testPawnsMoved
	| knight |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'rnbqkbnr/1p4p1/p1pppp1p/8/8/P1PPPP1P/1P4P1/RNBQKBNR/ w - - 1 20') deployOn: chessboard.
	knight := chessboard pieceAt: (#b1 asChessSquareIn: systemRoot).
	self deny: (knight isValidMoveFromCoordinate: #b1 to: #a3).
	self deny: (knight isValidMoveFromCoordinate: #b1 to: #c3).
	self assert: (knight isValidMoveFromCoordinate: #b1 to: #d2).
	knight := chessboard pieceAt: (#g1 asChessSquareIn: systemRoot).
	self deny: (knight isValidMoveFromCoordinate: #g1 to: #f3).
	self deny: (knight isValidMoveFromCoordinate: #g1 to: #h3).
	self assert: (knight isValidMoveFromCoordinate: #g1 to: #e2).
	knight := chessboard pieceAt: (#b8 asChessSquareIn: systemRoot).
	self deny: (knight isValidMoveFromCoordinate: #b8 to: #a6).
	self deny: (knight isValidMoveFromCoordinate: #b8 to: #c6).
	self assert: (knight isValidMoveFromCoordinate: #b8 to: #d7).
	knight := chessboard pieceAt: (#g8 asChessSquareIn: systemRoot).
	self deny: (knight isValidMoveFromCoordinate: #g8 to: #f6).
	self deny: (knight isValidMoveFromCoordinate: #g8 to: #h6).
	self assert: (knight isValidMoveFromCoordinate: #g8 to: #e7)!

testPruneUnreachableSquares
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #c3.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#a4 #a2 #d1 #e4 #d5 #b5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 

	self assert: (piece isInvalidMoveFrom: piece currentChessSquare to: (#b1 asChessSquareIn: systemRoot)).
	self assert: (piece isInvalidMoveFrom: piece currentChessSquare to: (#e2 asChessSquareIn: systemRoot)).

	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 6.
	! !
!KnightMovementRuleTest categoriesForMethods!
testAbsolutePin!public! !
testBothSidesMoves!public! !
testKnightScope!public! !
testOpeningMoves!public! !
testPawnsMoved!public! !
testPruneUnreachableSquares!public! !
!

