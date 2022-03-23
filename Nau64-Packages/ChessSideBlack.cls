"Filed out from Dolphin Smallalk"!

ChessSide subclass: #ChessSideBlack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSideBlack guid: (GUID fromString: '{f8cf5312-b3e9-4943-a06b-a33ebe41bbbe}')!
ChessSideBlack comment: ''!
!ChessSideBlack categoriesForClass!Unclassified! !
!ChessSideBlack methodsFor!

anyBlackPawnAtEnPassantMoveFrom: aSymbol 

	self piecesDo: [:piece | piece currentChessSquare isBlackEnPassantRank ifTrue: [^true]].

	^false!

codePointFor: aChessPiece

	^aChessPiece blackCodePoint!

defaultColor

	^Color black!

isBlack
	^true!

oppositePiecesDo: aBlock

	chessboard whitePiecesDo: aBlock!

oppositeSideName

	^#white!

piecesDo: aBlock

	chessboard blackPiecesDo: aBlock!

sideName

	^#black! !
!ChessSideBlack categoriesForMethods!
anyBlackPawnAtEnPassantMoveFrom:!public! !
codePointFor:!public! !
defaultColor!public! !
isBlack!public! !
oppositePiecesDo:!public! !
oppositeSideName!public! !
piecesDo:!public! !
sideName!public! !
!

!ChessSideBlack class methodsFor!

filePrefix

	^'bblackcellb'!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\',self filePrefix , '.ico')! !
!ChessSideBlack class categoriesForMethods!
filePrefix!public! !
icon!public! !
!

