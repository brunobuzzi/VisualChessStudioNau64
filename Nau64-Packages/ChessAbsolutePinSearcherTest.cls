"Filed out from Dolphin Smallalk"!

ChessPinSearcherTest subclass: #ChessAbsolutePinSearcherTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessAbsolutePinSearcherTest guid: (GUID fromString: '{cd896f55-ab1f-4b3f-b620-473c83e4699f}')!
ChessAbsolutePinSearcherTest comment: ''!
!ChessAbsolutePinSearcherTest categoriesForClass!Unclassified! !
!ChessAbsolutePinSearcherTest methodsFor!

testBlackBishopPin
	| parser chessboard pinSearcher pinDictionary pinnedSquares |

	parser := ChessFenParser newOn: systemRoot fenString: '8/8/3R4/2K5/3Q1p1b/5k2/8/8/ b - - 1 20'.
	chessboard := Chessboard newEmptyOn: systemRoot.
	parser deployOn: chessboard.
	pinSearcher := ChessAbsolutePinSearcher newOn: chessboard.
	chessboard blackSideDo: [:side | pinDictionary := pinSearcher searchOnChessboardFor: side].
	pinnedSquares := OrderedCollection with: (#d6 asChessSquareIn: systemRoot)
				with: (#d4 asChessSquareIn: systemRoot).
	self
		assert: (pinDictionary
				detectPinFromCurrentSquare: (#h4 asChessSquareIn: systemRoot)
				from: (#d5 asChessSquareIn: systemRoot)
				to: pinnedSquares) notNil! !
!ChessAbsolutePinSearcherTest categoriesForMethods!
testBlackBishopPin!public! !
!

