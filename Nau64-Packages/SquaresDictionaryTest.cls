"Filed out from Dolphin Smallalk"!

ChessTest subclass: #SquaresDictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SquaresDictionaryTest guid: (GUID fromString: '{1259bec3-c1f5-4771-af93-609b0d20cf60}')!
SquaresDictionaryTest comment: ''!
!SquaresDictionaryTest categoriesForClass!Unclassified! !
!SquaresDictionaryTest methodsFor!

setUp
	| fenParser |
	super setUp.

	chessboard := Chessboard newEmptyOn: systemRoot.

	fenParser := ChessFenParser newOn: systemRoot
				fenString: 'r1b1k1nr/p2p1pNp/n2B4/1p1NP2P/6P1/3P1Q2/P1P1K3/q5b w KQkq - 2 20'.

	fenParser deployOn: chessboard!

testAddEast
	| dict blackQueen |

	blackQueen := chessboard pieceAtCoordinate: #a1.
	dict := SquaresDictionary on: blackQueen.
	dict atEastAdd: (#b1 asChessSquareIn: systemRoot).
	self assert: (dict includesAtEast: (#b1 asChessSquareIn: systemRoot)).
	dict atEastAdd: (#b1 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.!

testAddNorth
	| dict whiteQueen |

	whiteQueen := chessboard pieceAtCoordinate: #f3.
	dict := SquaresDictionary on: whiteQueen.
	dict atNorthAdd: (#f4 asChessSquareIn: systemRoot).
	self assert: (dict includesAtNorth: (#f4 asChessSquareIn: systemRoot)).
	dict atNorthAdd: (#f4 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.!

testAddNorthEast
	| dict whiteBishop |

	whiteBishop := chessboard pieceAtCoordinate: #d6.
	dict := SquaresDictionary on: whiteBishop.
	dict atNorthEastAdd: (#e7 asChessSquareIn: systemRoot).
	self assert: (dict includesAtNorthEast: (#e7 asChessSquareIn: systemRoot)).
	dict atNorthEastAdd: (#e7 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.!

testAddNorthWest
	| dict whiteBishop |

	whiteBishop := chessboard pieceAtCoordinate: #d6.
	dict := SquaresDictionary on: whiteBishop.
	dict atNorthWestAdd: (#c7 asChessSquareIn: systemRoot).
	self assert: (dict includesAtNorthWest: (#c7 asChessSquareIn: systemRoot)).
	dict atNorthWestAdd: (#c7 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.!

testAddSouth
	| dict whiteQueen |

	whiteQueen := chessboard pieceAtCoordinate: #f3.
	dict := SquaresDictionary on: whiteQueen.
	dict atSouthAdd: (#f2 asChessSquareIn: systemRoot).
	self assert: (dict includesAtSouth: (#f2 asChessSquareIn: systemRoot)).
	dict atSouthAdd: (#f2 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.!

testAddSouthEast
	| dict whiteQueen |

	whiteQueen := chessboard pieceAtCoordinate: #f3.
	dict := SquaresDictionary on: whiteQueen.
	dict atSouthEastAdd: (#g2 asChessSquareIn: systemRoot).
	self assert: (dict includesAtSouthEast: (#g2 asChessSquareIn: systemRoot)).
	dict atSouthEastAdd: (#g2 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.!

testAddSouthWest
	| dict whiteBishop |

	whiteBishop := chessboard pieceAtCoordinate: #d6.
	dict := SquaresDictionary on: whiteBishop.
	dict atSouthWestAdd: (#c5 asChessSquareIn: systemRoot).
	self assert: (dict includesAtSouthWest: (#c5 asChessSquareIn: systemRoot)).
	dict atSouthWestAdd: (#c5 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.!

testAddWest
	| dict whiteQueen |

	whiteQueen := chessboard pieceAtCoordinate: #f3.
	dict := SquaresDictionary on: whiteQueen.
	dict atWestAdd: (#e3 asChessSquareIn: systemRoot).
	self assert: (dict includesAtWest: (#e3 asChessSquareIn: systemRoot)).
	dict atWestAdd: (#e3 asChessSquareIn: systemRoot).
	self assert: dict squaresSize equals: 1.! !
!SquaresDictionaryTest categoriesForMethods!
setUp!public! !
testAddEast!public! !
testAddNorth!public! !
testAddNorthEast!public! !
testAddNorthWest!public! !
testAddSouth!public! !
testAddSouthEast!public! !
testAddSouthWest!public! !
testAddWest!public! !
!

