"Filed out from Dolphin Smallalk"!

ChessTacticsTest subclass: #ChessPinTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPinTest guid: (GUID fromString: '{a8121735-a6e0-4b15-bf5d-4e2080d91aac}')!
ChessPinTest comment: ''!
!ChessPinTest categoriesForClass!Unclassified! !
!ChessPinTest methodsFor!

testAbsolutePinOnBishopFromRook
	| piece pinnedPieces pin pinnedPiece controlPiece |

	parser := ChessFenParser newOn: systemRoot
				fenString: '1k1b1R2/ppp5/8/4p3/3p4/P7/1PP5/2K1R2r/ b - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.

	controlPiece := chessboard pieceAtCoordinate: #f8.
	pinnedPiece := chessboard pieceAtCoordinate: #d8.
	pinnedPieces := controlPiece pinnedPieces.
	self assert: pinnedPieces totalSize equals: 1.
	pinnedPieces collectionAtWestDo: [:collection | pin := collection at: 1].
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #f8)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #d8)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #b8)).
	self assert: (pin orientationIs: #west).
	self assert: pin isAbsolute.
	self deny: (pinnedPiece isValidMoveFrom: (#d8 asChessSquareIn: systemRoot) to: (#e7 asChessSquareIn: systemRoot)).

	piece := chessboard pieceAtCoordinate: #h1.
	pinnedPiece := chessboard pieceAtCoordinate: #e1.
	pinnedPieces := piece pinnedPieces.
	self assert: pinnedPieces totalSize equals: 1.
	pinnedPieces collectionAtWestDo: [:collection | pin := collection at: 1].
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #h1)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #e1)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #c1)).
	self assert: (pin orientationIs: #west).
	self assert: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#e1 asChessSquareIn: systemRoot) to: (#d1 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#e1 asChessSquareIn: systemRoot) to: (#f1 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#e1 asChessSquareIn: systemRoot) to: (#g1 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#e1 asChessSquareIn: systemRoot) to: (#e2 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#e1 asChessSquareIn: systemRoot) to: (#h1 asChessSquareIn: systemRoot)).
!

testAbsolutePinOnQueenFromBishop
	| pinnedPieces pin pinnedPiece controlPiece |
	parser := ChessFenParser newOn: systemRoot fenString: '1k6/8/p2q4/1b6/8/3Q2B1/7P/5K2/ b - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.

	controlPiece := chessboard pieceAtCoordinate: #g3.
	pinnedPiece := chessboard pieceAtCoordinate: #d6.
	pinnedPieces := controlPiece pinnedPieces.
	self assert: pinnedPieces totalSize equals: 1.
	pinnedPieces collectionAtNorthWestDo: [:collection | pin := collection at: 1].
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #g3)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #d6)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #b8)).
	self assert: (pin orientationIs: #northWest).
	self assert: pin isAbsolute.
	self deny: (pinnedPiece isValidMoveFrom: (#d6 asChessSquareIn: systemRoot) to: (#d7 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#d6 asChessSquareIn: systemRoot) to: (#c5 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#d6 asChessSquareIn: systemRoot) to: (#c7 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#d6 asChessSquareIn: systemRoot) to: (#e5 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#d6 asChessSquareIn: systemRoot) to: (#f4 asChessSquareIn: systemRoot)).

	controlPiece := chessboard pieceAtCoordinate: #b5.
	pinnedPiece := chessboard pieceAtCoordinate: #d3.
	pinnedPieces := controlPiece pinnedPieces.
	self assert: pinnedPieces totalSize equals: 1.
	pinnedPieces collectionAtSouthEastDo: [:collection | pin := collection at: 1].
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #b5)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #d3)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #f1)).
	self assert: (pin orientationIs: #southEast).
	self assert: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#d3 asChessSquareIn: systemRoot) to: (#c4 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#d3 asChessSquareIn: systemRoot) to: (#e2 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#d3 asChessSquareIn: systemRoot) to: (#e4 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#d3 asChessSquareIn: systemRoot) to: (#c2 asChessSquareIn: systemRoot))!

testAbsolutePinQueenFromQueen
	| pinnedPieces pin pinnedPiece controlPiece |
	parser := ChessFenParser newOn: systemRoot fenString: '8/1k6/2q5/8/8/5Q2/6K1/8/ b - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.

	controlPiece := chessboard pieceAtCoordinate: #f3.
	pinnedPiece := chessboard pieceAtCoordinate: #c6.
	pinnedPieces := controlPiece pinnedPieces.
	self assert: pinnedPieces totalSize equals: 1.
	pinnedPieces collectionAtNorthWestDo: [:collection | pin := collection at: 1].
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #f3)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #c6)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #b7)).
	self assert: (pin orientationIs: #northWest).
	self assert: pin isAbsolute.
	self deny: (pinnedPiece isValidMoveFrom: (#c6 asChessSquareIn: systemRoot) to: (#c7 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#c6 asChessSquareIn: systemRoot) to: (#d6 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#c6 asChessSquareIn: systemRoot) to: (#d5 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#c6 asChessSquareIn: systemRoot) to: (#e4 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#c6 asChessSquareIn: systemRoot) to: (#f3 asChessSquareIn: systemRoot)).

	controlPiece := chessboard pieceAtCoordinate: #c6.
	pinnedPiece := chessboard pieceAtCoordinate: #f3.
	pinnedPieces := controlPiece pinnedPieces.
	self assert: pinnedPieces totalSize equals: 1.
	pinnedPieces collectionAtSouthEastDo: [:collection | pin := collection at: 1].
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #c6)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #f3)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #g2)).
	self assert: (pin orientationIs: #southEast).
	self assert: pin isAbsolute.
	self deny: (pinnedPiece isValidMoveFrom: (#f3 asChessSquareIn: systemRoot) to: (#e3 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#f3 asChessSquareIn: systemRoot) to: (#g4 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#f3 asChessSquareIn: systemRoot) to: (#e4 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#f3 asChessSquareIn: systemRoot) to: (#d5 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#f3 asChessSquareIn: systemRoot) to: (#c6 asChessSquareIn: systemRoot)).!

testDoublePin
	| pinnedPieces pin pinnedPiece controlPiece |
	parser := ChessFenParser newOn: systemRoot fenString: '8/8/8/5k2/8/8/2K1PBr1/8/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.

	controlPiece := chessboard pieceAtCoordinate: #g2.
	pinnedPiece := chessboard pieceAtCoordinate: #f2.
	pinnedPieces := controlPiece pinnedPieces.
	self assert: pinnedPieces totalSize equals: 2.
	pinnedPieces collectionAtWestDo: [:collection | pin := collection at: 1].
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #g2)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #f2)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #e2)).
	self assert: (pin orientationIs: #west).
	self deny: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#f2 asChessSquareIn: systemRoot) to: (#e3 asChessSquareIn: systemRoot)).
	!

testMultiplePins
	| pinnedPieces pin pinnedPiece controlPiece |
	parser := ChessFenParser newOn: systemRoot fenString: 'k1q3r1/1p6/4R1N1/5RN1/r3BPK1/5NB1/4R3/1N1b2q1/ w - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.

	controlPiece := chessboard pieceAtCoordinate: #g1.
	pinnedPiece := chessboard pieceAtCoordinate: #g3.
	pinnedPieces := controlPiece pinnedPieces.
	pinnedPieces collectionAtNorthDo: [:collection | pin := collection at: 1].
	self assert: pinnedPieces totalSize equals: 1.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #g1)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #g3)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #g4)).
	self assert: (pin orientationIs: #north).
	self assert: pin isAbsolute.
	self deny: (pinnedPiece isValidMoveFrom: (#g3 asChessSquareIn: systemRoot) to: (#h2 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#g3 asChessSquareIn: systemRoot) to: (#f2 asChessSquareIn: systemRoot)).
	self deny: (pinnedPiece isValidMoveFrom: (#g3 asChessSquareIn: systemRoot) to: (#e1 asChessSquareIn: systemRoot)).

	controlPiece := chessboard pieceAtCoordinate: #c8.
	pinnedPiece := chessboard pieceAtCoordinate: #e6.
	pinnedPieces := controlPiece pinnedPieces.
	pinnedPieces collectionAtSouthEastDo: [:collection | pin := collection at: 1].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #c8)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #e6)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #f5)).
	self assert: (pin orientationIs: #southEast).
	self deny: pin isAbsolute.
	controlPiece := chessboard pieceAtCoordinate: #c8.
	pinnedPiece := chessboard pieceAtCoordinate: #f5.
	pinnedPieces collectionAtSouthEastDo: [:collection | pin := collection at: 2].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #c8)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #f5)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #g4)).
	self assert: (pin orientationIs: #southEast).
	self assert: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#e6 asChessSquareIn: systemRoot) to: (#e5 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#f5 asChessSquareIn: systemRoot) to: (#e5 asChessSquareIn: systemRoot)).

	controlPiece := chessboard pieceAtCoordinate: #g8.
	pinnedPiece := chessboard pieceAtCoordinate: #g6.
	pinnedPieces := controlPiece pinnedPieces.
	pinnedPieces collectionAtSouthDo: [:collection | pin := collection at: 1].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #g8)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #g6)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #g5)).
	self assert: (pin orientationIs: #south).
	self deny: pin isAbsolute.
	controlPiece := chessboard pieceAtCoordinate: #g8.
	pinnedPiece := chessboard pieceAtCoordinate: #g5.
	pinnedPieces collectionAtSouthDo: [:collection | pin := collection at: 2].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #g8)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #g5)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #g4)).
	self assert: (pin orientationIs: #south).
	self assert: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#g6 asChessSquareIn: systemRoot) to: (#h8 asChessSquareIn: systemRoot)).
	self assert: (pinnedPiece isValidMoveFrom: (#g5 asChessSquareIn: systemRoot) to: (#f7 asChessSquareIn: systemRoot)).

	controlPiece := chessboard pieceAtCoordinate: #a4.
	pinnedPiece := chessboard pieceAtCoordinate: #e4.
	pinnedPieces := controlPiece pinnedPieces.
	pinnedPieces collectionAtEastDo: [:collection | pin := collection at: 1].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #a4)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #e4)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #f4)).
	self assert: (pin orientationIs: #east).
	self deny: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#e4 asChessSquareIn: systemRoot) to: (#d3 asChessSquareIn: systemRoot)).
	controlPiece := chessboard pieceAtCoordinate: #a4.
	pinnedPiece := chessboard pieceAtCoordinate: #f4.
	pinnedPieces collectionAtEastDo: [:collection | pin := collection at: 2].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #a4)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #f4)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #g4)).
	self assert: (pin orientationIs: #east).
	self assert: pin isAbsolute.

	controlPiece := chessboard pieceAtCoordinate: #d1.
	pinnedPiece := chessboard pieceAtCoordinate: #e2.
	pinnedPieces := controlPiece pinnedPieces.
	pinnedPieces collectionAtNorthEastDo: [:collection | pin := collection at: 1].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #d1)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #e2)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #f3)).
	self assert: (pin orientationIs: #northEast).
	self deny: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#e2 asChessSquareIn: systemRoot) to: (#e1 asChessSquareIn: systemRoot)).
	controlPiece := chessboard pieceAtCoordinate: #d1.
	pinnedPiece := chessboard pieceAtCoordinate: #f3.
	pinnedPieces collectionAtNorthEastDo: [:collection | pin := collection at: 2].
	self assert: pinnedPieces totalSize equals: 2.
	self assert: (pin controlPieceIs: (chessboard pieceAtCoordinate: #d1)).
	self assert: (pin pinnedPieceIs: (chessboard pieceAtCoordinate: #f3)).
	self assert: (pin targetPieceIs: (chessboard pieceAtCoordinate: #g4)).
	self assert: (pin orientationIs: #northEast).
	self assert: pin isAbsolute.
	self assert: (pinnedPiece isValidMoveFrom: (#f3 asChessSquareIn: systemRoot) to: (#h2 asChessSquareIn: systemRoot)).! !
!ChessPinTest categoriesForMethods!
testAbsolutePinOnBishopFromRook!public! !
testAbsolutePinOnQueenFromBishop!public! !
testAbsolutePinQueenFromQueen!public! !
testDoublePin!public! !
testMultiplePins!public! !
!

