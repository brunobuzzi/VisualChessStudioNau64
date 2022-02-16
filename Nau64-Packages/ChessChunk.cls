"Filed out from Dolphin Smallalk"!

Object subclass: #ChessChunk
	instanceVariableNames: 'code chessboard pieces'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessChunk guid: (GUID fromString: '{d24f3905-3d9e-498b-a4ee-3fffcf575ae3}')!
ChessChunk comment: ''!
!ChessChunk categoriesForClass!Unclassified! !
!ChessChunk methodsFor!

setChessboard: aChessboard

	chessboard := aChessboard! !
!ChessChunk categoriesForMethods!
setChessboard:!private! !
!

!ChessChunk class methodsFor!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\chessboard-chunk-2.ico')!

newOn: aChessboard

	^self new setChessboard: aChessboard! !
!ChessChunk class categoriesForMethods!
icon!public! !
newOn:!public! !
!

