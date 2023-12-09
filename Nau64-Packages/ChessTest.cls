"Filed out from Dolphin Smallalk"!

TestCase subclass: #ChessTest
	instanceVariableNames: 'systemRoot chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessTest guid: (GUID fromString: '{abfce311-e48e-482e-bbc1-2a73befc4b82}')!
ChessTest comment: ''!
!ChessTest categoriesForClass!Unclassified! !
!ChessTest methodsFor!

inspectChessboard
	^true!

setUp

	super setUp.

	systemRoot := Nau64ChessSystemRoot new.

	Smalltalk at: #TestSystemRoot put: systemRoot!

tearDown

	super tearDown.! !
!ChessTest categoriesForMethods!
inspectChessboard!public! !
setUp!public! !
tearDown!public! !
!

