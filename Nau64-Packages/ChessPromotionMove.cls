"Filed out from Dolphin Smallalk"!

ChessMoveCategory subclass: #ChessPromotionMove
	instanceVariableNames: 'selectedPieceCode'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPromotionMove guid: (GUID fromString: '{ae0507d5-6548-497a-984d-614ef14e75cb}')!
ChessPromotionMove comment: ''!
!ChessPromotionMove categoriesForClass!Unclassified! !
!ChessPromotionMove methodsFor!

isPromotion
	^true!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGame presenter: aPresenter
	| piece promotionPieceClass |
	piece := aChessboard pieceAtCoordinate: originCoordinateSymbol.
	[promotionPieceClass isNil] whileTrue: [promotionPieceClass := aPresenter selectPromotionPiece].
	piece chessSideDo: [:side | side promote: piece at: targetCoordinateSymbol to: promotionPieceClass].! !
!ChessPromotionMove categoriesForMethods!
isPromotion!public! !
performPieceSwitchFrom:to:on:withPostActionOn:presenter:!public! !
!

