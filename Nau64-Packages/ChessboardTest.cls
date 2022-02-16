"Filed out from Dolphin Smallalk"!

TestCase subclass: #ChessboardTest
	instanceVariableNames: 'chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessboardTest guid: (GUID fromString: '{6bbdce75-0060-40c1-8d1e-05a865608315}')!
ChessboardTest comment: ''!
!ChessboardTest categoriesForClass!Unclassified! !
!ChessboardTest methodsFor!

testChessboardWithAllPieces
	chessboard := Chessboard newWithAllPieces.

	self assert: chessboard piecesSize = 32.
	self assert: chessboard blackPiecesSize = 16.
	self assert: chessboard whitePiecesSize = 16.
!

testChessboardWithPaws
	chessboard := Chessboard newWithPawns.

	self assert: chessboard piecesSize = 16.
	self assert: chessboard blackPiecesSize = 8.
	self assert: chessboard whitePiecesSize = 8.

	self assert: chessboard blackPawns size equals: 8.
	self assert: chessboard whitePawns size equals: 8.!

testEmptyChessboard
	chessboard := Chessboard newEmpty.

	chessboard piecesDo: [:each | self assert: false].

	self assert: true! !
!ChessboardTest categoriesForMethods!
testChessboardWithAllPieces!public! !
testChessboardWithPaws!public! !
testEmptyChessboard!public! !
!

