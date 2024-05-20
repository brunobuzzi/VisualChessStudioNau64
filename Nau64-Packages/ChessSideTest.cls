"Filed out from Dolphin Smallalk"!

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
	| whiteKing blackKing game fenString gameExecutor |
	fenString := 'r3k2r/b3ppp1/p6p/8/6B1/P4P2/4P1PP/R3K2R/ w KQkq - 1 20'.
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: fenString.
	chessboard := game newInitialChessboard.
	gameExecutor := game newFenExecutorOn: chessboard.
	whiteKing := chessboard pieceAt: (#e1 asChessSquareIn: systemRoot).
	blackKing := chessboard pieceAt: (#e8 asChessSquareIn: systemRoot).
	self assert: (whiteKing
				isValidCastleMoveFrom: #e1
				to: #c1
				on: chessboard
				on: gameExecutor).
	self assert: (blackKing
				isValidCastleMoveFrom: #e8
				to: #g8
				on: chessboard
				on: gameExecutor).
	self deny: (whiteKing
				isValidCastleMoveFrom: #e1
				to: #g1
				on: chessboard
				on: gameExecutor).
	self deny: (blackKing
				isValidCastleMoveFrom: #e8
				to: #c8
				on: chessboard
				on: gameExecutor)!

testIsStaleMated1
	| blackKing |

	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '1k6/7Q/8/8/8/8/8/R1RK4/ w - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#b8 asChessSquareIn: systemRoot).
	self deny: blackKing isCheckMated.
	chessboard blackSideDo: [:side | self assert: side isStaledMated].!

testIsStaleMated2
	| blackKing |

	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: '7Q/k7/p7/Bp6/1N6/8/8/1K5B/ w - - 1 20') deployOn: chessboard.
	blackKing := chessboard pieceAt: (#a7 asChessSquareIn: systemRoot).
	self deny: blackKing isCheckMated.
	chessboard blackSideDo: [:side | self assert: side isStaledMated].!

testKingAlmostCheckMated
	| blackKing blackRook game fenString gameExecutor |
	fenString := '4r3/1K6/8/8/8/8/R7/3k1R2/ b KQkq - 1 20'.
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: fenString.
	chessboard := game newInitialChessboard.
	gameExecutor := game newFenExecutorOn: chessboard.

	blackKing := chessboard pieceAt: (#d1 asChessSquareIn: systemRoot).
	blackRook := chessboard pieceAt: (#e8 asChessSquareIn: systemRoot).
	self deny: blackKing isCheckMated.!

testKingInCheck
	| blackQueen blackKing game fenString gameExecutor |
	fenString := '2Q5/1K6/8/8/8/8/2k5/3q4/ w KQkq - 1 20'.
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: fenString.
	chessboard := game newInitialChessboard.
	gameExecutor := game newFenExecutorOn: chessboard.
	blackQueen := chessboard pieceAt: (#d1 asChessSquareIn: systemRoot).
	blackKing := chessboard pieceAt: (#c2 asChessSquareIn: systemRoot).
	self assert: (blackKing isValidMoveFromCoordinate: #c2 to: #b3).
	self deny: (blackKing isValidMoveFromCoordinate: #c2 to: #c3).
	self deny: (blackQueen isValidMoveFromCoordinate: #d1 to: #d3).

!

testKingSideBlackCastle
	| king game gameExecutor |
	
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: '4k2r/8/8/8/8/8/8/8/ b KQkq - 1 20'.
	chessboard := game newInitialChessboard.
	gameExecutor := game newFenExecutorOn: chessboard.
	king := chessboard pieceAt: (#e8 asChessSquareIn: systemRoot).
	self assert: (king isValidCastleMoveFrom: #e8 to: #g8 on: chessboard on: gameExecutor).!

testKingSideWhiteCastle
	| king game gameExecutor |
	
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: '8/8/8/8/8/8/8/4K2R/ w KQkq - 1 20'.
	chessboard := game newInitialChessboard.
	gameExecutor := game newFenExecutorOn: chessboard.
	king := chessboard pieceAt: (#e1 asChessSquareIn: systemRoot).
	self assert: (king isValidCastleMoveFrom: #e1 to: #g1 on: chessboard on: gameExecutor).!

testQueenPromotion
	| pawn game |
	
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: '8/PK6/8/8/8/8/2kp4/8/ w KQkq - 1 20'.
	chessboard := game newInitialChessboard.
	pawn := chessboard pieceAt: (#a7 asChessSquareIn: systemRoot).
	self assert: (pawn isValidMoveFrom: pawn currentChessSquare to: (#a8 asChessSquareIn: systemRoot)).

	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: '8/PK6/8/8/8/8/2kp4/8/ b KQkq - 1 20'.
	chessboard := game newInitialChessboard.
	pawn := chessboard pieceAt: (#d2 asChessSquareIn: systemRoot).
	self assert: (pawn isValidMoveFrom: pawn currentChessSquare to: (#d1 asChessSquareIn: systemRoot)).
!

testQueenSideBlackCastle
	| king game gameExecutor |
	
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: 'r3k3/8/8/8/8/8/8/8/ b KQkq - 1 20'.
	chessboard := game newInitialChessboard.
	gameExecutor := game newFenExecutorOn: chessboard.
	king := chessboard pieceAt: (#e8 asChessSquareIn: systemRoot).
	self assert: (king isValidCastleMoveFrom: #e8 to: #c8 on: chessboard on: gameExecutor).
	!

testQuenSideWhiteCastle
	| king game gameExecutor |
	
	game := ChessGame
				newOn: systemRoot
				whitePlayer: nil
				blackPlayer: nil
				fenString: '8/8/8/8/8/8/8/R3K3/ w KQkq - 1 20'.
	chessboard := game newInitialChessboard.
	gameExecutor := game newFenExecutorOn: chessboard.
	king := chessboard pieceAt: (#e1 asChessSquareIn: systemRoot).
	self assert: (king isValidCastleMoveFrom: #e1 to: #c1 on: chessboard on: gameExecutor).
	! !
!ChessSideTest categoriesForMethods!
testCastleSquaresUnderAttack!public! !
testIsStaleMated1!public! !
testIsStaleMated2!public! !
testKingAlmostCheckMated!public! !
testKingInCheck!public! !
testKingSideBlackCastle!public! !
testKingSideWhiteCastle!public! !
testQueenPromotion!public! !
testQueenSideBlackCastle!public! !
testQuenSideWhiteCastle!public! !
!

