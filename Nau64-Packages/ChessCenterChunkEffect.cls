"Filed out from Dolphin Smallalk"!

ChessChunkEffect subclass: #ChessCenterChunkEffect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessCenterChunkEffect guid: (GUID fromString: '{b5a22550-de50-4822-abe3-e9b4ab33aa94}')!
ChessCenterChunkEffect comment: ''!
!ChessCenterChunkEffect categoriesForClass!Unclassified! !
!ChessCenterChunkEffect methodsFor!

drawOn: aCanvas
	| squareOriginPosition squareTargetPosition rectangle pen |

	squareOriginPosition := chessboard calculatePositionForFile: (ChessFile getFile: 'c') rank: (ChessRank getRank: 6).
	squareTargetPosition := chessboard calculatePositionForFile: (ChessFile getFile: 'f') rank: (ChessRank getRank: 3).
	
	rectangle := Rectangle origin: squareOriginPosition @ squareTargetPosition extent: ((4 * chessboard squareSize) @ (4 * chessboard squareSize)).

	pen := GdiplusPen color: Color orange.
	pen width: 5.

	aCanvas graphics 
		drawRectangle: rectangle pen: pen! !
!ChessCenterChunkEffect categoriesForMethods!
drawOn:!public! !
!

