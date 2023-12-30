"Filed out from Dolphin Smallalk"!

ChessMovementRuleTest subclass: #PawnMovementRuleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PawnMovementRuleTest guid: (GUID fromString: '{27878dde-7ba2-4944-9c37-52616d80d94e}')!
PawnMovementRuleTest comment: ''!
!PawnMovementRuleTest categoriesForClass!Unclassified! !
!PawnMovementRuleTest methodsFor!

testEnPassant
	| chessGame |

	chessGame := ChessGame newOn: systemRoot whitePlayer: nil blackPlayer: nil.
	chessboard := Chessboard newWithAllPiecesOn: systemRoot.
	chessGame 
		annotateAndMovePieceFrom: #e2 to: #e4 on: chessboard;
		annotateAndMovePieceFrom: #e7 to: #e5 on: chessboard;
		annotateAndMovePieceFrom: #d2 to: #d4 on: chessboard;
		annotateAndMovePieceFrom: #g8 to: #f6 on: chessboard;
		annotateAndMovePieceFrom: #d4 to: #d5 on: chessboard;
		annotateAndMovePieceFrom: #c7 to: #c5 on: chessboard;
		annotateAndMovePieceFrom: #d5 to: #c6 on: chessboard.



!

testPawnMovementsOnChessboard
	| blackPawn whitePawn |

	chessboard := Chessboard newWithAllPiecesOn: systemRoot.
	blackPawn := chessboard pieceAtCoordinate: #a7.
	whitePawn := chessboard pieceAtCoordinate: #a2.

	self assert: (whitePawn isValidMoveFromCoordinate: #a2 to: #a3).
	self assert: (whitePawn isValidMoveFromCoordinate: #a2 to: #a4).
	self deny: (whitePawn isValidMoveFromCoordinate: #a2 to: #a1).

	self assert: (blackPawn isValidMoveFromCoordinate: #a7 to: #a6).
	self assert: (blackPawn isValidMoveFromCoordinate: #a7 to: #a5).
	self deny: (blackPawn isValidMoveFromCoordinate: #a7 to: #a8).
!

testPawnScope
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #b2.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #south) equals: 0.
	self assert: (squaresDictionary sizeAt: #east) equals: 0.
	self assert: (squaresDictionary sizeAt: #west) equals: 0.
	#(#b3 b4) do: [:each | self assert: (squaresDictionary includesAtNorth: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #north) equals: 2.
	self assert: (squaresDictionary includesAtNorthWest: (#a3 asChessSquareIn: systemRoot)).
	self assert: (squaresDictionary sizeAt: #northWest) equals: 1.
	self assert: (squaresDictionary includesAtNorthEast: (#c3 asChessSquareIn: systemRoot)).
	self assert: (squaresDictionary sizeAt: #northEast) equals: 1.
!

testPawnTakePiece
	| blackPawn whitePawn |

	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'rnbqkb1r/1p1pp1p1/p6p/1Np2p2/3PP1n1/P6P/1PP2PP1/R1BQKBNR/ w - - 1 20') deployOn: chessboard.

	whitePawn := chessboard pieceAt: (#a3 asChessSquareIn: systemRoot).
	self assert: (whitePawn isValidMoveFromCoordinate: #a3 to: #a4).
	self deny: (whitePawn isValidMoveFromCoordinate: #a3 to: #b4).

	whitePawn := chessboard pieceAt: (#d4 asChessSquareIn: systemRoot).
	self assert: (whitePawn isValidMoveFromCoordinate: #d4 to: #c5).
	self assert: (whitePawn isValidMoveFromCoordinate: #d4 to: #d5).
	self deny: (whitePawn isValidMoveFromCoordinate: #d4 to: #e5).

	whitePawn := chessboard pieceAt: (#e4 asChessSquareIn: systemRoot).
	self assert: (whitePawn isValidMoveFromCoordinate: #e4 to: #e5).
	self assert: (whitePawn isValidMoveFromCoordinate: #e4 to: #f5).
	self deny: (whitePawn isValidMoveFromCoordinate: #e4 to: #d5).

	blackPawn := chessboard pieceAt: (#a6 asChessSquareIn: systemRoot).
	self assert: (blackPawn isValidMoveFromCoordinate: #a6 to: #a5).
	self assert: (blackPawn isValidMoveFromCoordinate: #a6 to: #b5).

	blackPawn := chessboard pieceAt: (#h6 asChessSquareIn: systemRoot).
	self assert: (blackPawn isValidMoveFromCoordinate: #h6 to: #h5).
	self deny: (blackPawn isValidMoveFromCoordinate: #h6 to: #g5).

	blackPawn := chessboard pieceAt: (#c5 asChessSquareIn: systemRoot).
	self assert: (blackPawn isValidMoveFromCoordinate: #c5 to: #d4).
	self assert: (blackPawn isValidMoveFromCoordinate: #c5 to: #c4).
	self deny: (blackPawn isValidMoveFromCoordinate: #c5 to: #b4).

	blackPawn := chessboard pieceAt: (#f5 asChessSquareIn: systemRoot).
	self assert: (blackPawn isValidMoveFromCoordinate: #f5 to: #e4).
	self assert: (blackPawn isValidMoveFromCoordinate: #f5 to: #f4).
	self deny: (blackPawn isValidMoveFromCoordinate: #f5 to: #g4).!

testPruneUnreachableSquares
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rnbqk1nr/1p1p2p1/2p5/p1b1pp1p/PP1PPB2/5P1P/2P3P1/RN1QKBNR/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #a4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 0.

	piece := chessboard pieceAtCoordinate: #b4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#a5 #b5 #c5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 3.

	piece := chessboard pieceAtCoordinate: #c2.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#c3 #c4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #d4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#c5 #d5 #e5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 3.

	piece := chessboard pieceAtCoordinate: #e4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#f5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 1.

	piece := chessboard pieceAtCoordinate: #f3.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 0.

	piece := chessboard pieceAtCoordinate: #g2.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#g3 #g4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #h3.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#h4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 1.

!

testPruneUnreachableSquaresForBlackPawn
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rnbqk1nr/1p1p2p1/2p5/p1b1pp1p/PP1PPB2/5P1P/2P3P1/RN1QKBNR/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #a5.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#b4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 1.

	piece := chessboard pieceAtCoordinate: #b7.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#b6 #b5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #c6.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 0.

	piece := chessboard pieceAtCoordinate: #d7.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#d6 #d5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #e5.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#d4 #f4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #f5.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#e4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 1.

	piece := chessboard pieceAtCoordinate: #g7.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#g6 #g5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #h5.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#h4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 1.!

testPruneUnreachableSquaresForWhitePawn
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rnbqk1nr/1p1p2p1/2p5/p1b1pp1p/PP1PPB2/5P1P/2P3P1/RN1QKBNR/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #a4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 0.

	piece := chessboard pieceAtCoordinate: #b4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#a5 #b5 #c5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 3.

	piece := chessboard pieceAtCoordinate: #c2.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#c3 #c4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #d4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#c5 #d5 #e5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 3.

	piece := chessboard pieceAtCoordinate: #e4.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#f5) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 1.

	piece := chessboard pieceAtCoordinate: #f3.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 0.

	piece := chessboard pieceAtCoordinate: #g2.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#g3 #g4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 2.

	piece := chessboard pieceAtCoordinate: #h3.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	squaresDictionary pruneUnreachableSquares.
	(#(#h4) collect: [:each | each asChessSquareIn: systemRoot]) do: [:targetSquare | self assert: (piece isValidMoveFrom: piece currentChessSquare to: targetSquare)]. 
	self assert: (piece validSquaresSizeFrom: piece currentChessSquare) equals: 1.

! !
!PawnMovementRuleTest categoriesForMethods!
testEnPassant!public! !
testPawnMovementsOnChessboard!public! !
testPawnScope!public! !
testPawnTakePiece!public! !
testPruneUnreachableSquares!public! !
testPruneUnreachableSquaresForBlackPawn!public! !
testPruneUnreachableSquaresForWhitePawn!public! !
!

