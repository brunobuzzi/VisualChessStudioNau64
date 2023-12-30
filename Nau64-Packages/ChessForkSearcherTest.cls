"Filed out from Dolphin Smallalk"!

ChessTacticMoveSearcherTest subclass: #ChessForkSearcherTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessForkSearcherTest guid: (GUID fromString: '{e0b35bb2-f262-4b1c-9c2d-5326565fcf4e}')!
ChessForkSearcherTest comment: ''!
!ChessForkSearcherTest categoriesForClass!Unclassified! !
!ChessForkSearcherTest methodsFor!

testPawnAndKnightFork
	| parser chessboard forkSearcher forksDictionary forkedSquares |

	parser := ChessFenParser newOn: systemRoot fenString: '8/3k1b2/2q1r3/8/3PP3/2BK1N2/8/8/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	forkSearcher := ChessForkSearcher newOn: chessboard.
	chessboard whiteSideDo: [:side | forksDictionary := forkSearcher searchOnChessboardFor: side].

	forkedSquares := OrderedCollection with: (#c6 asChessSquareIn: systemRoot) with: (#e6 asChessSquareIn: systemRoot).
	self assert: (forksDictionary 
				detectForkFromCurrentSquare: (#d4 asChessSquareIn: systemRoot) 
				from: (#d5 asChessSquareIn: systemRoot) 
				to: forkedSquares) notNil.

	forkedSquares := OrderedCollection with: (#e6 asChessSquareIn: systemRoot) with: (#f7 asChessSquareIn: systemRoot).
	self assert: (forksDictionary 
				detectForkFromCurrentSquare: (#f3 asChessSquareIn: systemRoot) 
				from: (#g5 asChessSquareIn: systemRoot) 
				to: forkedSquares) notNil.

	forkedSquares := OrderedCollection with: (#c6 asChessSquareIn: systemRoot) with: (#d7 asChessSquareIn: systemRoot) with: (#f7 asChessSquareIn: systemRoot).
	self assert: (forksDictionary 
				detectForkFromCurrentSquare: (#f3 asChessSquareIn: systemRoot) 
				from: (#e5 asChessSquareIn: systemRoot) 
				to: forkedSquares) notNil.!

testPawnFork
	| parser chessboard forkSearcher forksDictionary forkedSquares |

	parser := ChessFenParser newOn: systemRoot fenString: '8/3k4/2q1r3/8/3PP3/2BK4/8/8/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	forkSearcher := ChessForkSearcher newOn: chessboard.
	chessboard whiteSideDo: [:side | forksDictionary := forkSearcher searchOnChessboardFor: side].
	forkedSquares := OrderedCollection with: (#c6 asChessSquareIn: systemRoot)
				with: (#e6 asChessSquareIn: systemRoot).
	self
		assert: (forksDictionary
				detectForkFromCurrentSquare: (#d4 asChessSquareIn: systemRoot)
				from: (#d5 asChessSquareIn: systemRoot)
				to: forkedSquares) notNil! !
!ChessForkSearcherTest categoriesForMethods!
testPawnAndKnightFork!public! !
testPawnFork!public! !
!

