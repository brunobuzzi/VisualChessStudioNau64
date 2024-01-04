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
	chessboard blackSideDo: [:side | self assert: side isStaledMated].! !
!ChessSideTest categoriesForMethods!
testIsStaleMated1!public! !
testIsStaleMated2!public! !
!

