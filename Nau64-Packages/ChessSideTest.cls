﻿"Filed out from Dolphin Smallalk"!

ChessTest subclass: #ChessSideTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSideTest guid: (GUID fromString: '{1d431039-ad1a-4c7a-af2a-010807a7f1ad}')!
ChessSideTest comment: ''!
!ChessSideTest categoriesForClass!Unclassified! !
!ChessSideTest methodsFor!

testCastleSquaresUnderAttack
	| whiteKing blackKing game |

	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: 'r3k2r/b3ppp1/p6p/8/6B1/P4P2/4P1PP/R3K2R/ w - - 1 20') deployOn: chessboard.
	game := ChessGame newOn: systemRoot whitePlayer: nil blackPlayer: nil fenString: 'r3k2r/b3ppp1/p6p/8/6B1/P4P2/4P1PP/R3K2R/ w - - 1 20'.
	whiteKing := chessboard pieceAt: (#e1 asChessSquareIn: systemRoot).
	blackKing := chessboard pieceAt: (#e8 asChessSquareIn: systemRoot).
	
	self assert: (whiteKing isValidCastleMoveFrom: #e1 to: #c1 on: chessboard on: game).
	self assert: (blackKing isValidCastleMoveFrom: #e8 to: #g8 on: chessboard on: game).

	self deny: (whiteKing isValidCastleMoveFrom: #e1 to: #g1 on: chessboard on: game).
	self deny: (blackKing isValidCastleMoveFrom: #e8 to: #c8 on: chessboard on: game).
!

testIsStaleMated1
	| blackKing |

	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '1k6/7Q/8/8/8/8/8/R1RK4/ w - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#b8 asChessSquareIn: systemRoot).
	self deny: (blackKing isCheckMatedOn: chessboard).
	chessboard blackSideDo: [:side | self assert: side isStaledMated].!

testIsStaleMated2
	| blackKing |

	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '7Q/k7/p7/Bp6/1N6/8/8/1K5B/ w - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#a7 asChessSquareIn: systemRoot).
	self deny: (blackKing isCheckMatedOn: chessboard).
	chessboard blackSideDo: [:side | self assert: side isStaledMated].!

testKingSideBlackCastle!

testKingSideWhiteCastle!

testQueenSideBlackCastle!

testQuenSideWhiteCastle! !
!ChessSideTest categoriesForMethods!
testCastleSquaresUnderAttack!public! !
testIsStaleMated1!public! !
testIsStaleMated2!public! !
testKingSideBlackCastle!public! !
testKingSideWhiteCastle!public! !
testQueenSideBlackCastle!public! !
testQuenSideWhiteCastle!public! !
!
