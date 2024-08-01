"Filed out from Dolphin Smallalk"!

ChessCaptureMove subclass: #ChessEnPassantCaptureMove
	instanceVariableNames: 'enablerMove'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEnPassantCaptureMove guid: (GUID fromString: '{b1872f71-6486-45b2-bacf-f51505b9660e}')!
ChessEnPassantCaptureMove comment: ''!
!ChessEnPassantCaptureMove categoriesForClass!Unclassified! !
!ChessEnPassantCaptureMove methodsFor!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGameExecutor

	aChessGameExecutor nextSideToMoveOn: aChessboard isBlackDo: [
		originCoordinateSymbol last = 5 ifFalse: [^self].
		(aChessboard pieceAtCoordinate: targetCoordinateSymbol) isPawn ifFalse: [^self].
		
	].
	aChessGameExecutor nextSideToMoveOn: aChessboard isWhiteDo: [
		originCoordinateSymbol last = 4 ifFalse: [^self].
		(aChessboard pieceAtCoordinate: targetCoordinateSymbol) isPawn ifFalse: [^self].
	].

	aChessboard movePieceFromCoordiante: originCoordinateSymbol to: targetCoordinateSymbol.
	aChessboard removeEnPassantPawn: targetCoordinateSymbol!

redoOn: aChessboard
	aChessboard movePieceFromCoordiante: move from to: move to.
	aChessboard removeEnPassantPawn: move to!

setMove: aChessMove enabler: enablerChessMove

	move := aChessMove.
	enablerMove := enablerChessMove!

undoOn: aChessboard 
	| killerPiece capturedPieceClass capturedPiece |

	killerPiece := aChessboard pieceAtCoordinate: move to.
	capturedPieceClass := Pawn.

	killerPiece oppositeSideDo: [:opSide | capturedPiece := capturedPieceClass newOn: opSide].

	aChessboard movePieceFromCoordiante: move to to: move from.

	aChessboard pieceAtCoordinate: enablerMove to put: capturedPiece! !
!ChessEnPassantCaptureMove categoriesForMethods!
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
redoOn:!public! !
setMove:enabler:!private! !
undoOn:!public! !
!

!ChessEnPassantCaptureMove class methodsFor!

newOn: aChessMove enabler: enablerMove

	^self new setMove: aChessMove enabler: enablerMove! !
!ChessEnPassantCaptureMove class categoriesForMethods!
newOn:enabler:!public! !
!

