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

testAttackedSquaresAfterKing
	| whiteKing blackRook squares |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'r7/8/K1k5/8/8/8/8/8/ w - - 1 20') deployOn: chessboard.
	whiteKing := chessboard pieceAt: (#a6 asChessSquareIn: systemRoot).
	blackRook := chessboard pieceAt: (#a8 asChessSquareIn: systemRoot).
	squares := OrderedCollection new.
	whiteKing secureSquaresDo: [:square | squares add: square].
	self assert: squares isEmpty!

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
	! !
!KingMovementRuleTest categoriesForMethods!
testAttackedSquaresAfterKing!public! !
testCheckMates!public! !
testKingScope!public! !
testPruneUnreachableSquares!public! !
!

