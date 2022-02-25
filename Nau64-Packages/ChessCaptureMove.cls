"Filed out from Dolphin Smallalk"!

ChessMoveCategory subclass: #ChessCaptureMove
	instanceVariableNames: 'capturedPieceCode'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessCaptureMove guid: (GUID fromString: '{6b496f80-75e0-418f-8df1-66c8d6339c61}')!
ChessCaptureMove comment: ''!
!ChessCaptureMove categoriesForClass!Unclassified! !
!ChessCaptureMove methodsFor!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGame

	aChessboard movePieceFromCoordiante: originCoordinateSymbol to: targetCoordinateSymbol!

setMove: aChessMove capturedPiece: code

	move := aChessMove.
	capturedPieceCode := code! !
!ChessCaptureMove categoriesForMethods!
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
setMove:capturedPiece:!public! !
!

!ChessCaptureMove class methodsFor!

newOn: aChessMove capturedPiece: aChessPiece

	^self new setMove: aChessMove capturedPiece: aChessPiece pieceCode! !
!ChessCaptureMove class categoriesForMethods!
newOn:capturedPiece:!public! !
!

