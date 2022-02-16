"Filed out from Dolphin Smallalk"!

ChessPinEffect subclass: #ChessPartialPinEffect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPartialPinEffect guid: (GUID fromString: '{4719619c-50e8-48ef-b5b7-7fc0411be4ca}')!
ChessPartialPinEffect comment: ''!
!ChessPartialPinEffect categoriesForClass!Unclassified! !
!ChessPartialPinEffect methodsFor!

drawOn: aCanvas
	| pinSearcher pins |

	pinSearcher := ChessPartialPinSearcher newOn: chessboard.
	isBlack 
		ifTrue: [chessboard blackSideDo: [:side | pins := pinSearcher searchOnChessboardFor: side]]
		ifFalse: [chessboard whiteSideDo: [:side | pins := pinSearcher searchOnChessboardFor: side]].

	pins keysAndValuesDo: [:piece :squareSet | 
			squareSet do: [:square | 
				aCanvas graphics drawLineFrom: ((chessboard calculatePositionFor: (chessboard squareFor: piece)) + (chessboard halfSquareSize)) to: ((chessboard calculatePositionFor: square) + (chessboard halfSquareSize)) pen: self pen]
	].! !
!ChessPartialPinEffect categoriesForMethods!
drawOn:!public! !
!

