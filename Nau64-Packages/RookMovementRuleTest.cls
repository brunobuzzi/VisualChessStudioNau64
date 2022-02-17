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

testRookMoves1
	| rook |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '2kr4/1p6/p1pp1R2/2r5/8/PR6/1PP5/3K4/') deployOn: chessboard.
	rook := chessboard pieceAt: (#b3 asChessSquareIn: systemRoot).
	self deny: (rook isValidMoveFromCoordinate: #b3 to: #a4).
	self deny: (rook isValidMoveFromCoordinate: #b3 to: #c4).
	self deny: (rook isValidMoveFromCoordinate: #b3 to: #b2).
	self deny: (rook isValidMoveFromCoordinate: #b3 to: #a3).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #c3).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #d3).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #e3).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #f3).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #g3).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #h3).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #b4).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #b5).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #b6).
	self assert: (rook isValidMoveFromCoordinate: #b3 to: #b7).
	self deny: (rook isValidMoveFromCoordinate: #b3 to: #b8).
	rook := chessboard pieceAt: (#f6 asChessSquareIn: systemRoot).
	self deny: (rook isValidMoveFromCoordinate: #f6 to: #c6).
	self deny: (rook isValidMoveFromCoordinate: #f6 to: #e7).
	self deny: (rook isValidMoveFromCoordinate: #f6 to: #g7).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #e6).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #d6).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #g6).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #f7).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #f8).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #f5).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #f4).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #f3).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #f2).
	self assert: (rook isValidMoveFromCoordinate: #f6 to: #f1).
	self deny: (rook isValidMoveFromCoordinate: #f6 to: #g5).
	rook := chessboard pieceAt: (#d8 asChessSquareIn: systemRoot).
	self deny: (rook isValidMoveFromCoordinate: #d8 to: #c8).
	self deny: (rook isValidMoveFromCoordinate: #d8 to: #c7).
	self deny: (rook isValidMoveFromCoordinate: #d8 to: #e7).
	self assert: (rook isValidMoveFromCoordinate: #d8 to: #d7).
	self assert: (rook isValidMoveFromCoordinate: #d8 to: #e8).
	self assert: (rook isValidMoveFromCoordinate: #d8 to: #f8).
	self assert: (rook isValidMoveFromCoordinate: #d8 to: #g8).
	self assert: (rook isValidMoveFromCoordinate: #d8 to: #h8).
	self deny: (rook isValidMoveFromCoordinate: #d8 to: #b8).
	self deny: (rook isValidMoveFromCoordinate: #d8 to: #d6).
	rook := chessboard pieceAt: (#c5 asChessSquareIn: systemRoot).
	self deny: (rook isValidMoveFromCoordinate: #c5 to: #c6).
	self deny: (rook isValidMoveFromCoordinate: #c5 to: #d6).
	self deny: (rook isValidMoveFromCoordinate: #c5 to: #c1).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #b5).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #a5).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #d5).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #e5).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #f5).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #g5).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #h5).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #c4).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #c3).
	self assert: (rook isValidMoveFromCoordinate: #c5 to: #c2).
	self deny: (rook isValidMoveFromCoordinate: #c5 to: #c1).
	self deny: (rook isValidMoveFromCoordinate: #c5 to: #b4).
	self deny: (rook isValidMoveFromCoordinate: #c5 to: #d4)! !
!RookMovementRuleTest categoriesForMethods!
testRookMoves1!public! !
!

