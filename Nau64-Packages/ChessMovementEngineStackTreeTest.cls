"Filed out from Dolphin Smallalk"!

ChessTest subclass: #ChessMovementEngineStackTreeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMovementEngineStackTreeTest guid: (GUID fromString: '{4d8e07f6-8b05-4ea0-b4e4-692080803b94}')!
ChessMovementEngineStackTreeTest comment: ''!
!ChessMovementEngineStackTreeTest categoriesForClass!Unclassified! !
!ChessMovementEngineStackTreeTest methodsFor!

testTreeBuilderForBishop
	| piece tree squaresAtLevel squaresNodeByOrientantion |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '8/8/3R4/2K5/3Q1p1b/5k2/8/8/ b - - 1 20')
		deployOn: chessboard.
	piece := chessboard pieceAt: (#h4 asChessSquareIn: systemRoot).

	tree := ChessEnginePieceStackTree
				newOn: piece
				from: (#h4 asChessSquareIn: systemRoot)
				on: chessboard.

	squaresAtLevel := #(#g5 #f6 #e7 #d8 #g3 #f2 #e1) collect: [:each | each asChessSquareIn: systemRoot].
	squaresNodeByOrientantion := tree squaresNodeByOrientationAtLevel: 2.
 	squaresNodeByOrientantion do: [:node | self assert: (squaresAtLevel includes: node square)].
	self assert: squaresAtLevel size equals: squaresNodeByOrientantion size.


	squaresAtLevel := #(#h6 #g7 #h8 #e5 #d4 #d6 #f8 #c7 #b6 #a5 #h2 #g1 #e3 #d4 #d2 #c3 #b4 #a5) collect: [:each | each asChessSquareIn: systemRoot].
	squaresNodeByOrientantion := tree squaresNodeByOrientationAtLevel: 3.
 	squaresNodeByOrientantion do: [:node | self assert: (squaresAtLevel includes: node square)].
	self assert: squaresAtLevel size equals: squaresNodeByOrientantion size.
	!

testTreeBuilderForRook
	| piece tree squaresAtLevel squaresNodeByOrientantion squarePath |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '8/8/3R4/2K5/3Q1p1b/5k2/8/8/ b - - 1 20')
		deployOn: chessboard.
	piece := chessboard pieceAt: (#d6 asChessSquareIn: systemRoot).

	tree := ChessEnginePieceStackTree
				newOn: piece
				from: (#d6 asChessSquareIn: systemRoot)
				on: chessboard.

	squaresAtLevel := #(#d7 #d8 #c6 #b6 #a6 #e6 #f6 #g6 #h6 #d5) collect: [:each | each asChessSquareIn: systemRoot].
	squaresNodeByOrientantion := tree squaresNodeByOrientationAtLevel: 2.
 	squaresNodeByOrientantion do: [:node | self assert: (squaresAtLevel includes: node square)].
	self assert: squaresAtLevel size equals: squaresNodeByOrientantion size.


	squaresAtLevel := (#(#c7 #b7 #a7 #e7 #f7 #g7 #h7 #c8 #b8 #a8 #e8 #f8 #g8 #h8 #e5 #f5 #g5 #h5 #c7 #c8 #b7 #b8 #a7 #a8 #e7 #e8 #f7 #f8 #g7 #g8 #h7 #h8 #a5 #a4 #a3 #a2 #a1 #b5 #b4 #b3 #b2 #b1 #e5 #e4 #e3 #e2 #e1 #f4 #g4 #g3 #g2 #g1 #h4 #h3 #h2 #h1) collect: [:each | each asChessSquareIn: systemRoot]).
	squaresNodeByOrientantion := tree squaresNodeByOrientationAtLevel: 3.
 	squaresNodeByOrientantion do: [:node | self assert: (squaresAtLevel includes: node square)].
	self assert: squaresAtLevel size equals: squaresNodeByOrientantion size.
	
	squarePath := tree squaresAtOrientationPath: (Array with: #north with: #west).
	squaresAtLevel := #(#c7 #b7 #a7 #c8 #b8 #a8) collect: [:each | each asChessSquareIn: systemRoot].
 	squarePath do: [:square | self assert: (squaresAtLevel includes: square)].
	self assert: squaresAtLevel size equals: squarePath size.

	squarePath := tree squaresAtOrientationPath: (Array with: #north with: #east).
	squaresAtLevel := #(#e7 #f7 #g7 #h7 #e8 #f8 #g8 #h8) collect: [:each | each asChessSquareIn: systemRoot].
 	squarePath do: [:square | self assert: (squaresAtLevel includes: square)].
	self assert: squaresAtLevel size equals: squarePath size.! !
!ChessMovementEngineStackTreeTest categoriesForMethods!
testTreeBuilderForBishop!public! !
testTreeBuilderForRook!public! !
!

