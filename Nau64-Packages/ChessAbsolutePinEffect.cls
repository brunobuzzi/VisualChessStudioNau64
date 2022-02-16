"Filed out from Dolphin Smallalk"!

ChessPinEffect subclass: #ChessAbsolutePinEffect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessAbsolutePinEffect guid: (GUID fromString: '{a91df747-a7bf-4268-b0dd-f91232067dec}')!
ChessAbsolutePinEffect comment: ''!
!ChessAbsolutePinEffect categoriesForClass!Unclassified! !
!ChessAbsolutePinEffect methodsFor!

drawOn: aCanvas
	| pinSearcher pins |

	pinSearcher := ChessAbsolutePinSearcher newOn: chessboard.
	isBlack 
		ifTrue: [chessboard blackSideDo: [:side | pins := pinSearcher searchOnChessboardFor: side]]
		ifFalse: [chessboard whiteSideDo: [:side | pins := pinSearcher searchOnChessboardFor: side]].

	pins keysAndValuesDo: [:piece :squareSet | 
			squareSet do: [:square | 
				aCanvas graphics drawLineFrom: ((chessboard calculatePositionFor: (chessboard squareFor: piece)) + (chessboard halfSquareSize)) to: ((chessboard calculatePositionFor: square) + (chessboard halfSquareSize)) pen: self pen]
	].! !
!ChessAbsolutePinEffect categoriesForMethods!
drawOn:!public! !
!

