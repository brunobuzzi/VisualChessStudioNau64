"Filed out from Dolphin Smallalk"!

Object subclass: #ChessSide
	instanceVariableNames: 'chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSide guid: (GUID fromString: '{40355e9d-4755-4839-85ec-7540b069cd63}')!
ChessSide comment: ''!
!ChessSide categoriesForClass!Unclassified! !
!ChessSide methodsFor!

anyPawnAtEnPassantMoveFrom: aSymbol 
	
	^self isBlack 
	ifTrue: [self anyBlackPawnAtEnPassantMoveFrom: aSymbol] 
	ifFalse: [self anyWhitePawnAtEnPassantMoveFrom: aSymbol]!

chessboardDo: aBlock

	aBlock value: chessboard!

currentChessSquareFor: aChessPiece

	^chessboard currentChessSquareFor: aChessPiece!

isBlack
	^false!

isWhite
	^false!

oppositePiecesDo: aBlock

	self subclassResponsibility!

oppositeSideName

	^self subclassResponsibility!

opppositeSlidingPiecesDo: aBlock

	self oppositePiecesDo: [:piece | piece isSlidingPiece ifTrue: [aBlock value: piece]]!

piecesDo: aBlock

	self subclassResponsibility!

setChessboard: aChessBoard

	chessboard := aChessBoard.!

sideName

	^self subclassResponsibility!

slidingPiecesDo: aBlock

	self piecesDo: [:piece | piece isSlidingPiece ifTrue: [aBlock value: piece]]!

squareSize

	^chessboard squareSize!

systemRoot

	^chessboard systemRoot! !
!ChessSide categoriesForMethods!
anyPawnAtEnPassantMoveFrom:!public! !
chessboardDo:!public! !
currentChessSquareFor:!public! !
isBlack!public! !
isWhite!public! !
oppositePiecesDo:!public! !
oppositeSideName!public! !
opppositeSlidingPiecesDo:!public! !
piecesDo:!public! !
setChessboard:!private! !
sideName!public! !
slidingPiecesDo:!public! !
squareSize!public! !
systemRoot!private! !
!

!ChessSide class methodsFor!

filePrefix

	^'bblackcellw'!

icon
	^Boolean icon!

newOn: aChessBoard

	^self new setChessboard: aChessBoard! !
!ChessSide class categoriesForMethods!
filePrefix!public! !
icon!public! !
newOn:!public! !
!

