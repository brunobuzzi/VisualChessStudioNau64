"Filed out from Dolphin Smallalk"!

ChessSide subclass: #ChessSideWhite
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSideWhite guid: (GUID fromString: '{0f5d06e6-8e4c-4d7a-906b-1369e17547d2}')!
ChessSideWhite comment: ''!
!ChessSideWhite categoriesForClass!Unclassified! !
!ChessSideWhite methodsFor!

anyWhitePawnAtEnPassantMoveFrom: aSymbol 

	self piecesDo: [:piece | piece currentChessSquare isWhiteEnPassantRank ifTrue: [^true]].

	^false!

isWhite
	^true!

oppositePiecesDo: aBlock

	chessboard blackPiecesDo: aBlock!

piecesDo: aBlock

	chessboard whitePiecesDo: aBlock! !
!ChessSideWhite categoriesForMethods!
anyWhitePawnAtEnPassantMoveFrom:!public! !
isWhite!public! !
oppositePiecesDo:!public! !
piecesDo:!public! !
!

!ChessSideWhite class methodsFor!

filePrefix

	^'wwhitecellw'!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\',self filePrefix , '.ico')! !
!ChessSideWhite class categoriesForMethods!
filePrefix!public! !
icon!public! !
!

