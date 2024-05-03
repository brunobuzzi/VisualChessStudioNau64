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

applyRedoTo: aChessMove on: aChessboard
	| piece |

	piece := aChessboard pieceAtCoordinate: aChessMove from.

	piece chessSideDo: [:side | side promote: piece at: aChessMove to to: selectedPiece].!

isPromotion
	^true!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGame
	| piece |
	piece := aChessboard pieceAtCoordinate: originCoordinateSymbol.
	piece chessSideDo: [:side | side promote: piece at: targetCoordinateSymbol to: selectedPiece].!

setPromotionPieceClass: aPromotablePieceClass

	selectedPiece := aPromotablePieceClass!

undoOn: aChessboard 
	| promotedPiece side |
	promotedPiece := aChessboard pieceAtCoordinate: move to.
	promotedPiece chessSideDo: [:chessSide | side := chessSide].
	aChessboard pieceAtCoordinate: move from put: (Pawn newOn: side).
	aChessboard removePieceAtCoordiante: move to.! !
!ChessPromotionMove categoriesForMethods!
applyRedoTo:on:!public! !
isPromotion!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
setPromotionPieceClass:!public! !
undoOn:!public! !
!

