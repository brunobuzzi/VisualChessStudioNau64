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

testBugKingMoveToInvalidSquareOnChessboard
	| whiteKing |

	chessboard := Chessboard newEmpty.
	(ChessFenParser on: 'r7/8/K1k5/8/8/8/8/8/') deployOn: chessboard.
	whiteKing := chessboard pieceAt: #a6 asChessSquare.
	self deny: (whiteKing isValidMoveFromCoordinate: #a6 to: #a5).!

testCheckMates
	| checkMatedKing otherKing |

	chessboard := Chessboard newEmpty.
	(ChessFenParser on: 'r7/8/K1k5/8/8/8/8/8/') deployOn: chessboard.
	checkMatedKing := chessboard pieceAt: #a6 asChessSquare.
	self assert: (checkMatedKing isCheckMatedOn: chessboard).
	otherKing := chessboard pieceAt: #c6 asChessSquare.
	self deny: (otherKing isCheckMatedOn: chessboard).

	chessboard := Chessboard newEmpty.
	(ChessFenParser on: 'B7/4R3/5Q2/1K6/4k3/R7/8/8/') deployOn: chessboard.
	checkMatedKing := chessboard pieceAt: #e4 asChessSquare.
	self assert: (checkMatedKing isCheckMatedOn: chessboard).
	otherKing := chessboard pieceAt: #b5 asChessSquare.
	self deny: (otherKing isCheckMatedOn: chessboard).

	chessboard := Chessboard newEmpty.
	(ChessFenParser on: 'B7/4RQ2/8/1K6/4k3/R7/8/8/') deployOn: chessboard.
	checkMatedKing := chessboard pieceAt: #e4 asChessSquare.
	self deny: (checkMatedKing isCheckMatedOn: chessboard).
	chessboard movePieceFromCoordiante: #f7 to: #f6.
	self assert: (checkMatedKing isCheckMatedOn: chessboard).!

testSlidingPieceAttackSquare
	| blackKing |

	chessboard := Chessboard newEmpty.
	(ChessFenParser on: 'B7/4R3/8/1K6/4k3/8/8/8/') deployOn: chessboard.
	blackKing := chessboard pieceAt: #e4 asChessSquare.

	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #d5).
	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #f3).
	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #e5).
	self deny: (blackKing isValidMoveFromCoordinate: #e4 to: #e3).

	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #d4).
	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #d3).
	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #f4).
	self assert: (blackKing isValidMoveFromCoordinate: #e4 to: #f5).



!

testStackoverflowBug
	| blackKing |

	chessboard := Chessboard newEmpty.
	(ChessFenParser on: 'k1K5/8/8/8/8/8/8/8/') deployOn: chessboard.
	blackKing := chessboard pieceAt: #a8 asChessSquare.
	self assert: (blackKing isValidMoveFromCoordinate: #a8 to: #a7).
	self deny: (blackKing isValidMoveFromCoordinate: #a8 to: #b8).
! !
!KingMovementRuleTest categoriesForMethods!
testBugKingMoveToInvalidSquareOnChessboard!public! !
testCheckMates!public! !
testSlidingPieceAttackSquare!public! !
testStackoverflowBug!public! !
!

