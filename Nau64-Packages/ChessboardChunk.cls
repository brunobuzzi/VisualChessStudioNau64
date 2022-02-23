"Filed out from Dolphin Smallalk"!

Object subclass: #ChessboardChunk
	instanceVariableNames: 'code chessGame moveIndex'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessboardChunk guid: (GUID fromString: '{d24f3905-3d9e-498b-a4ee-3fffcf575ae3}')!
ChessboardChunk comment: ''!
!ChessboardChunk categoriesForClass!Unclassified! !
!ChessboardChunk methodsFor!

setChessGame: aChessGame index: index

	chessGame := aChessGame.	
	moveIndex := index! !
!ChessboardChunk categoriesForMethods!
setChessGame:index:!private! !
!

!ChessboardChunk class methodsFor!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\chessboard-chunk-2.ico')!

newOn: aChessGame index: index

	^self new setChessGame: aChessGame index: index! !
!ChessboardChunk class categoriesForMethods!
icon!public! !
newOn:index:!public! !
!

