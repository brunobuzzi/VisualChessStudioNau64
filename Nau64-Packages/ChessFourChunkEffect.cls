"Filed out from Dolphin Smallalk"!

ChessChunkEffect subclass: #ChessFourChunkEffect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessFourChunkEffect guid: (GUID fromString: '{698ef53a-9457-4638-8099-4adae36cb350}')!
ChessFourChunkEffect comment: ''!
!ChessFourChunkEffect categoriesForClass!Unclassified! !
!ChessFourChunkEffect methodsFor!

drawOn: aCanvas

	self drawOn: aCanvas file1: 'a' rank1: 4 file2: 'd' rank2: 1.
	self drawOn: aCanvas file1: 'e' rank1: 4 file2: 'h' rank2: 1.

	self drawOn: aCanvas file1: 'a' rank1: 8 file2: 'd' rank2: 5.
	self drawOn: aCanvas file1: 'e' rank1: 8 file2: 'h' rank2: 5.
!

drawOn: aCanvas file1: file1 rank1: rank1 file2:file2  rank2: rank2
	| squareOriginPosition squareTargetPosition rectangle pen |

	squareOriginPosition := chessboard calculatePositionForFile: (ChessFile getFile: file1) rank: (ChessRank getRank: rank1).
	squareTargetPosition := chessboard calculatePositionForFile: (ChessFile getFile: file2) rank: (ChessRank getRank: rank2).
	
	rectangle := Rectangle origin: squareOriginPosition @ squareTargetPosition extent: ((4 * chessboard squareSize) @ (4 * chessboard squareSize)).

	pen := GdiplusPen color: Color orange.
	pen width: 5.

	aCanvas graphics 
		drawRectangle: rectangle pen: pen! !
!ChessFourChunkEffect categoriesForMethods!
drawOn:!public! !
drawOn:file1:rank1:file2:rank2:!public! !
!

