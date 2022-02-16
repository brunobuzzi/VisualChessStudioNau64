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

testQueenMoves1
	| queen |

	chessboard := Chessboard newEmpty.
	(ChessFenParser on: 'r1bqkbnr/pp2p1pp/2p5/3pPp2/P2n4/2P2P2/1P4PP/RNBQKBNR/') deployOn: chessboard.

	queen := chessboard pieceAt: #d1 asChessSquare.
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

	queen := chessboard pieceAt: #d8 asChessSquare.
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
	self deny: (queen isValidMoveFromCoordinate: #d8 to: #c6).! !
!QueenMovementRuleTest categoriesForMethods!
testQueenMoves1!public! !
!

