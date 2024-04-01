"Filed out from Dolphin Smallalk"!

SlidingPieceMovementEngineTest subclass: #RookMovementRuleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RookMovementRuleTest guid: (GUID fromString: '{08d9e0d5-91c2-4334-b892-cd9fae4fd7fd}')!
RookMovementRuleTest comment: ''!
!RookMovementRuleTest categoriesForClass!Unclassified! !
!RookMovementRuleTest methodsFor!

testRookScope
	| squaresDictionary |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	piece := chessboard pieceAtCoordinate: #a1.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #west) equals: 0.
	self assert: (squaresDictionary sizeAt: #south) equals: 0.
	#(#b1 #c1 #d1 #e1 #f1 #g1 #h1) do: [:each | self assert: (squaresDictionary includesAtEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #east) equals: 7.
	#(#a2 #a3 #a4 #a5 #a6 #a7 #a8) do: [:each | self assert: (squaresDictionary includesAtNorth: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #north) equals: 7.

	piece := chessboard pieceAtCoordinate: #h1.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #east) equals: 0.
	self assert: (squaresDictionary sizeAt: #south) equals: 0.
	#(#g1 #f1 #e1 #d1 #c1 #b1 #a1) do: [:each | self assert: (squaresDictionary includesAtWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #west) equals: 7.
	#(#h2 #h3 #h4 #h5 #h6 #h7 #h8) do: [:each | self assert: (squaresDictionary includesAtNorth: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #north) equals: 7.

	piece := chessboard pieceAtCoordinate: #a8.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #west) equals: 0.
	self assert: (squaresDictionary sizeAt: #north) equals: 0.
	#(#b8 #c8 #d8 #e8 #f8 #g8 #h8) do: [:each | self assert: (squaresDictionary includesAtEast: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #east) equals: 7.
	#(#a7 #a6 #a5 #a4 #a3 #a2 #a1) do: [:each | self assert: (squaresDictionary includesAtSouth: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #south) equals: 7.

	piece := chessboard pieceAtCoordinate: #h8.
	squaresDictionary := piece squaresScopeFrom: piece currentChessSquare.
	self assert: (squaresDictionary sizeAt: #east) equals: 0.
	self assert: (squaresDictionary sizeAt: #north) equals: 0.
	#(#g8 #f8 #e8 #d8 #c8 #b8 #a8) do: [:each | self assert: (squaresDictionary includesAtWest: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #west) equals: 7.
	#(#h7 #h6 #h5 #h4 #h3 #h2 #h1) do: [:each | self assert: (squaresDictionary includesAtSouth: (each asChessSquareIn: systemRoot))].
	self assert: (squaresDictionary sizeAt: #south) equals: 7.
! !
!RookMovementRuleTest categoriesForMethods!
testRookScope!public! !
!

