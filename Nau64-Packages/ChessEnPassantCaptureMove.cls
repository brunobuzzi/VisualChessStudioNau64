"Filed out from Dolphin Smallalk"!

ChessCaptureMove subclass: #ChessEnPassantCaptureMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEnPassantCaptureMove guid: (GUID fromString: '{b1872f71-6486-45b2-bacf-f51505b9660e}')!
ChessEnPassantCaptureMove comment: ''!
!ChessEnPassantCaptureMove categoriesForClass!Unclassified! !
!ChessEnPassantCaptureMove methodsFor!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGame

	aChessGame nextSideToMoveOn: aChessboard isBlackDo: [
		originCoordinateSymbol last = 5 ifFalse: [^self].
		(aChessboard pieceAtCoordinate: targetCoordinateSymbol) isPawn ifFalse: [^self].
		
	].
	aChessGame nextSideToMoveOn: aChessboard isWhiteDo: [
		originCoordinateSymbol last = 4 ifFalse: [^self].
		(aChessboard pieceAtCoordinate: targetCoordinateSymbol) isPawn ifFalse: [^self].
	].

	aChessboard movePieceFromCoordiante: originCoordinateSymbol to: targetCoordinateSymbol.
	aChessboard removeEnPassantPawn: targetCoordinateSymbol! !
!ChessEnPassantCaptureMove categoriesForMethods!
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
!

