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
! !
!PawnMovementRuleTest categoriesForMethods!
testEnPassant!public! !
testPawnMovementsOnChessboard!public! !
!

