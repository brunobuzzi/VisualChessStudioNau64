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
	
! !
!BishopMovementRuleTest categoriesForMethods!
testBishopScope!public! !
testPruneUnreachableSquares!public! !
!

