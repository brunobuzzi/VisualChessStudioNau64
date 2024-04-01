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

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGame
	| piece |
	piece := aChessboard pieceAtCoordinate: originCoordinateSymbol.
	piece chessSideDo: [:side | side promote: piece at: targetCoordinateSymbol to: selectedPiece].!

setPromotionPieceClass: aPromotablePieceClass

	selectedPiece := aPromotablePieceClass! !
!ChessPromotionMove categoriesForMethods!
isPromotion!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
setPromotionPieceClass:!public! !
!

