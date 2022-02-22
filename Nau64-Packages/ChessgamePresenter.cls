"Filed out from Dolphin Smallalk"!

AbstractChessboardPresenter subclass: #ChessgamePresenter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessgamePresenter guid: (GUID fromString: '{2f0bf0a9-c497-4443-98a4-e1081722f91e}')!
ChessgamePresenter comment: ''!
!ChessgamePresenter categoriesForClass!Unclassified! !
!ChessgamePresenter methodsFor!

endTrackingAt: aPoint 

	self halt!

movePiece: aMouseEvent

	self halt!

renderChessboard
	| gdiBitmap |
	gdiBitmap := GdiplusBitmap extent: DesktopView current extent.
	model drawOn: gdiBitmap isDisplayCoordinatesEnabled: false .
	self imageModel: gdiBitmap asValue! !
!ChessgamePresenter categoriesForMethods!
endTrackingAt:!drag & drop!public! !
movePiece:!public! !
renderChessboard!public!rendering-chessboard! !
!

