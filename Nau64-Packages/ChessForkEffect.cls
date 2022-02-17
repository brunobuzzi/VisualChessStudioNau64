"Filed out from Dolphin Smallalk"!

ChessTacticEffect subclass: #ChessForkEffect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessForkEffect guid: (GUID fromString: '{68d3cde4-3e68-486f-8362-5ee872e4a876}')!
ChessForkEffect comment: ''!
!ChessForkEffect categoriesForClass!Unclassified! !
!ChessForkEffect methodsFor!

drawOn: aCanvas
	| forkSearcher forks |

	forkSearcher := ChessForkSearcher newOn: chessboard.
	isBlack 
		ifTrue: [chessboard blackSideDo: [:side | forks := forkSearcher searchOnChessboardFor: side]]
		ifFalse: [chessboard whiteSideDo: [:side | forks := forkSearcher searchOnChessboardFor: side]].

	forks keysAndValuesDo: [:piece :fork | 
			fork originAndTargetSquaresDo: [:originSquare :targetSquares |
				targetSquares do: [:square | 
					aCanvas graphics drawLineFrom: (chessboard calculatePositionFor: piece currentChessSquare) + (chessboard halfSquareSize) to: (chessboard calculatePositionFor: originSquare) + (chessboard halfSquareSize) pen: self penRed.
					aCanvas graphics drawLineFrom: ((chessboard calculatePositionFor: originSquare) + (chessboard halfSquareSize)) to: ((chessboard calculatePositionFor: square) + (chessboard halfSquareSize)) pen: self pen.
				].
			].
	].! !
!ChessForkEffect categoriesForMethods!
drawOn:!public! !
!

