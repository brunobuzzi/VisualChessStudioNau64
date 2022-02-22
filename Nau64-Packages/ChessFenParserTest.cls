"Filed out from Dolphin Smallalk"!

ChessTest subclass: #ChessFenParserTest
	instanceVariableNames: 'shell'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessFenParserTest guid: (GUID fromString: '{df4104b2-f892-469b-bcf5-76470105e9d6}')!
ChessFenParserTest comment: ''!
!ChessFenParserTest categoriesForClass!Unclassified! !
!ChessFenParserTest methodsFor!

tearDown

	[(Delay forMilliseconds: 500) wait.
	shell view destroy] forkAt: 5.

	super tearDown.!

testFen1
	| model fenParser |
	shell := ChessboardPlaygroundShell showOn: (Chessboard newEmptyOn: systemRoot).
	model := shell model.
	fenParser := ChessFenParser newOn: systemRoot
				fenString: 'r1b1k1nr/p2p1pNp/n2B4/1p1NP2P/6P1/3P1Q2/P1P1K3/q5b'.
	fenParser deployOn: model.
	shell renderChessboard!

testFenInitialPosition
	| model fenParser |
	shell := ChessboardPlaygroundShell showOn: (Chessboard newEmptyOn: systemRoot).
	model := shell model.
	fenParser := ChessFenParser newOn: systemRoot
				fenString: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'.
	fenParser deployOn: model.
	shell renderChessboard! !
!ChessFenParserTest categoriesForMethods!
tearDown!public! !
testFen1!public! !
testFenInitialPosition!public! !
!

