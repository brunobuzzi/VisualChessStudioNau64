"Filed out from Dolphin Smallalk"!

ChessMoveCategory subclass: #ChessEnPassantEnablerMove
	instanceVariableNames: 'enablerMove'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEnPassantEnablerMove guid: (GUID fromString: '{2ddfbebc-d9c8-44f3-b38d-efee6596b782}')!
ChessEnPassantEnablerMove comment: ''!
!ChessEnPassantEnablerMove categoriesForClass!Unclassified! !
!ChessEnPassantEnablerMove methodsFor!

applyRedoTo: aChessMove on: aChessboard

	aChessboard movePieceFromCoordiante: move from to: move to.
	aChessboard removeEnPassantPawn: move to!

isEnPassantEnabler
	^true!

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
	aChessboard removeEnPassantPawn: targetCoordinateSymbol!

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
!ChessEnPassantEnablerMove categoriesForMethods!
applyRedoTo:on:!public! !
isEnPassantEnabler!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
setMove:enabler:!private! !
undoOn:!public! !
!

!ChessEnPassantEnablerMove class methodsFor!

newOn: aChessMove enabler: enablerMove

	^self new setMove: aChessMove enabler: enablerMove! !
!ChessEnPassantEnablerMove class categoriesForMethods!
newOn:enabler:!public! !
!

