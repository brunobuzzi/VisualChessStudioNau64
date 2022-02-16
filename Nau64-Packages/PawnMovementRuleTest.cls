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

	self error: 'Not Implemented Yet'!

testPawnMovementsOnChessboard
	| vector rule blackPawn whitePawn |

	chessboard := Chessboard newWithAllPieces.
	blackPawn := chessboard pieceAtCoordinate: #a7.
	whitePawn := chessboard pieceAtCoordinate: #a2.

	vector := (#a2-> #a3) asChessVector.
	rule := whitePawn newRuleForVector: vector.
	self assert: (rule isValidOn: chessboard).

	vector := (#a2-> #a4) asChessVector.
	rule := whitePawn newRuleForVector: vector.
	self assert: (rule isValidOn: chessboard).

	vector := (#a2-> #a1) asChessVector. 
	rule := whitePawn newRuleForVector: vector.
	self deny: (rule isValidOn: chessboard).

	vector := (#a7-> #a6) asChessVector. 
	rule := blackPawn newRuleForVector: vector.
	self assert: (rule isValidOn: chessboard).

	vector := (#a7-> #a5) asChessVector. 
	rule := blackPawn newRuleForVector: vector.
	self assert: (rule isValidOn: chessboard).

	vector := (#a7-> #a8) asChessVector. 
	rule := blackPawn newRuleForVector: vector.
	self deny: (rule isValidOn: chessboard).
! !
!PawnMovementRuleTest categoriesForMethods!
testEnPassant!public! !
testPawnMovementsOnChessboard!public! !
!

