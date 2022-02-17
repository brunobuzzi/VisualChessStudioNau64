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
!

testPawnTakePiece
	| blackPawn whitePawn |

	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'rnbqkb1r/1p1pp1p1/p6p/1Np2p2/3PP1n1/P6P/1PP2PP1/R1BQKBNR/') deployOn: chessboard.

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
	self deny: (blackPawn isValidMoveFromCoordinate: #f5 to: #g4).! !
!PawnMovementRuleTest categoriesForMethods!
testEnPassant!public! !
testPawnMovementsOnChessboard!public! !
testPawnTakePiece!public! !
!

