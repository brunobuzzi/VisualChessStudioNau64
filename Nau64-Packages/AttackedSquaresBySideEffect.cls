"Filed out from Dolphin Smallalk"!

ChessboardEffect subclass: #AttackedSquaresBySideEffect
	instanceVariableNames: 'forceNumbers'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AttackedSquaresBySideEffect guid: (GUID fromString: '{c9951cc0-c613-496e-be02-9e44c741ad6d}')!
AttackedSquaresBySideEffect comment: ''!
!AttackedSquaresBySideEffect categoriesForClass!Kernel-Objects! !
!AttackedSquaresBySideEffect methodsFor!

drawOn: aCanvas

	chessboard blackSideDo: [:whiteSide | forceNumbers := whiteSide forceNumbers].

	chessboard allAttackedSquaresByWhiteDo: [:square | 
		self renderAttackedSquare: square on: aCanvas].

	chessboard allAttackedSquaresByBlackDo: [:square | 
		self renderAttackedSquare: square on: aCanvas]!

penForSquare: aChessSquare
	| pen |

	pen := ((forceNumbers at: aChessSquare) > 0) ifTrue: [GdiplusPen black] ifFalse: [GdiplusPen red].
	pen width: (forceNumbers at: aChessSquare) abs * 2.

	^pen
!

renderAttackedSquare: aChessSquare on: aCanvas

"	aCanvas graphics 
			drawImage: (GdiplusBitmap fromBitmap: self bitmap) 
			at: (aChessSquare calculatePositionAt: chessboard)
			extent: chessboard squareSize @ chessboard squareSize."

	((forceNumbers at: aChessSquare) = 0)
	ifFalse: [aCanvas graphics
			drawRectangle: (Rectangle origin: ((aChessSquare calculatePositionAt: chessboard) + 4) extent: (chessboard squareSize @ chessboard squareSize) - 8) pen: (self penForSquare: aChessSquare)].

	aCanvas graphics 
			drawString:  ((forceNumbers at: aChessSquare) abs) printString 
			font: (GdiplusFont name: 'Arial' emSize: 8)
			at: ((aChessSquare calculatePositionAt: chessboard) + 6)
			format: nil 
			brush: (GdiplusSolidBrush color: Color darkRed).! !
!AttackedSquaresBySideEffect categoriesForMethods!
drawOn:!public! !
penForSquare:!public! !
renderAttackedSquare:on:!public! !
!

