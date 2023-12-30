"Filed out from Dolphin Smallalk"!

ChessVectorTest subclass: #ChessSquareVectorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSquareVectorTest guid: (GUID fromString: '{a72b3e81-27d1-4b80-b9c5-ac06b3ef9830}')!
ChessSquareVectorTest comment: ''!
!ChessSquareVectorTest categoriesForClass!Unclassified! !
!ChessSquareVectorTest methodsFor!

testIsSlidingVector
	| sourcePiece targetPiece vector |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	sourcePiece := chessboard pieceAtCoordinate: #a1.
	targetPiece := chessboard pieceAtCoordinate: #a7.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector isSlidingVector.
	sourcePiece := chessboard pieceAtCoordinate: #a1.
	targetPiece := chessboard pieceAtCoordinate: #b1.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector isSlidingVector.
	sourcePiece := chessboard pieceAtCoordinate: #f7.
	targetPiece := chessboard pieceAtCoordinate: #c4.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector isSlidingVector.
	sourcePiece := chessboard pieceAtCoordinate: #f7.
	targetPiece := chessboard pieceAtCoordinate: #d3.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self deny: vector isSlidingVector!

testVectorCreations
	| sourcePiece targetPiece vector |

	parser := ChessFenParser newOn: systemRoot
				fenString: 'rk1n2qr/pp3bp1/5p1p/8/2P5/2NP2P1/1P2P1B1/RK2Q2R/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	sourcePiece := chessboard pieceAtCoordinate: #b1.
	targetPiece := chessboard pieceAtCoordinate: #e1.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsEast.
	sourcePiece := chessboard pieceAtCoordinate: #e1.
	targetPiece := chessboard pieceAtCoordinate: #b1.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsWest.
	sourcePiece := chessboard pieceAtCoordinate: #a1.
	targetPiece := chessboard pieceAtCoordinate: #a7.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsNorth.
	sourcePiece := chessboard pieceAtCoordinate: #a7.
	targetPiece := chessboard pieceAtCoordinate: #a1.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsSouth.
	sourcePiece := chessboard pieceAtCoordinate: #b8.
	targetPiece := chessboard pieceAtCoordinate: #b2.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsSouth.
	sourcePiece := chessboard pieceAtCoordinate: #e1.
	targetPiece := chessboard pieceAtCoordinate: #c3.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsNorthWest.
	sourcePiece := chessboard pieceAtCoordinate: #e1.
	targetPiece := chessboard pieceAtCoordinate: #g3.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsNorthEast.
	sourcePiece := chessboard pieceAtCoordinate: #b8.
	targetPiece := chessboard pieceAtCoordinate: #a7.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsSouthWest.
	sourcePiece := chessboard pieceAtCoordinate: #g8.
	targetPiece := chessboard pieceAtCoordinate: #h6.
	vector := ChessSquareVector from: sourcePiece to: targetPiece.
	self assert: vector orientationIsSouthEast! !
!ChessSquareVectorTest categoriesForMethods!
testIsSlidingVector!public! !
testVectorCreations!public! !
!

