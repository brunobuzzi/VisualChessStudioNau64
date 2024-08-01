"Filed out from Dolphin Smallalk"!

ChessMoveCategory subclass: #ChessPromotionMove
	instanceVariableNames: 'selectedPiece'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPromotionMove guid: (GUID fromString: '{ae0507d5-6548-497a-984d-614ef14e75cb}')!
ChessPromotionMove comment: ''!
!ChessPromotionMove categoriesForClass!Unclassified! !
!ChessPromotionMove methodsFor!

isPromotion
	^true!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGameExecutor
	| piece |
	piece := aChessboard pieceAtCoordinate: originCoordinateSymbol.
	piece chessSideDo: [:side | side promote: piece at: targetCoordinateSymbol to: selectedPiece].!

redoOn: aChessboard
	| piece |
	piece := aChessboard pieceAtCoordinate: move from.
	piece chessSideDo: 
			[:side |
			side
				promote: piece
				at: move to
				to: selectedPiece]!

setPromotionPieceClass: aPromotablePieceClass

	selectedPiece := aPromotablePieceClass!

undoOn: aChessboard 
	| promotedPiece side |
	promotedPiece := aChessboard pieceAtCoordinate: move to.
	promotedPiece chessSideDo: [:chessSide | side := chessSide].
	aChessboard pieceAtCoordinate: move from put: (Pawn newOn: side).
	aChessboard removePieceAtCoordiante: move to.! !
!ChessPromotionMove categoriesForMethods!
isPromotion!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
redoOn:!public! !
setPromotionPieceClass:!public! !
undoOn:!public! !
!

