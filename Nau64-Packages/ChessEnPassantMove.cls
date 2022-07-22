"Filed out from Dolphin Smallalk"!

ChessMoveCategory subclass: #ChessEnPassantMove
	instanceVariableNames: 'enablerMove'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEnPassantMove guid: (GUID fromString: '{2ddfbebc-d9c8-44f3-b38d-efee6596b782}')!
ChessEnPassantMove comment: ''!
!ChessEnPassantMove categoriesForClass!Unclassified! !
!ChessEnPassantMove methodsFor!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGame

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
!ChessEnPassantMove categoriesForMethods!
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
setMove:enabler:!private! !
undoOn:!public! !
!

!ChessEnPassantMove class methodsFor!

newOn: aChessMove enabler: enablerMove

	^self new setMove: aChessMove enabler: enablerMove! !
!ChessEnPassantMove class categoriesForMethods!
newOn:enabler:!public! !
!

