"Filed out from Dolphin Smallalk"!

TestCase subclass: #ChessShellTest
	instanceVariableNames: 'shell'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessShellTest guid: (GUID fromString: '{ec371dbd-22a1-414e-9e69-89b90f2e0df1}')!
ChessShellTest comment: ''!
!ChessShellTest categoriesForClass!Unclassified! !
!ChessShellTest methodsFor!

tearDown

	[(Delay forMilliseconds: 500) wait.
	shell view destroy] forkAt: 5.

	super tearDown.!

testChessboardEmpty
	| model |
	shell := ChessShell showOn: Chessboard newEmpty.
	model := shell model.
	
!

testChessboardEmptyWithCoordinates
	| model |
	shell := ChessShell showOn: Chessboard newEmpty.
	model := shell model.
	shell toggleCoordinates.
	
!

testChessboardWithPaws
	| model |
	shell := ChessShell showOn: Chessboard newWithPawns.
	model := shell model.
	
!

testChessboardWithPieces
	| model |
	shell := ChessShell show.
	model := shell model.
	
!

testReverseChessboard
	| model |
	shell := ChessShell show.
	model := shell model.
	[(Delay forMilliseconds: 400) wait.
	shell reverseChessboard.] forkAt: 5.
! !
!ChessShellTest categoriesForMethods!
tearDown!public! !
testChessboardEmpty!public! !
testChessboardEmptyWithCoordinates!public! !
testChessboardWithPaws!public! !
testChessboardWithPieces!public! !
testReverseChessboard!public! !
!

