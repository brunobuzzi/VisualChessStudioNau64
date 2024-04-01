"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMoveCategory
	instanceVariableNames: 'move'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMoveCategory guid: (GUID fromString: '{b63176c2-3d16-45a1-962d-2060353b7c68}')!
ChessMoveCategory comment: ''!
!ChessMoveCategory categoriesForClass!Unclassified! !
!ChessMoveCategory methodsFor!

isPromotion
	^false!

performPieceSwitchFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard withPostActionOn: aChessGame

	self subclassResponsibility!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGame presenter: aPresenter

	self subclassResponsibility!

setMove: aChessMove

	move := aChessMove! !
!ChessMoveCategory categoriesForMethods!
isPromotion!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
performPieceSwitchFrom:to:on:withPostActionOn:presenter:!public! !
setMove:!private! !
!

!ChessMoveCategory class methodsFor!

icon

	^Icon fromId: 'STON.ico'!

newOn: aChessMove

	^self new setMove: aChessMove! !
!ChessMoveCategory class categoriesForMethods!
icon!public! !
newOn:!public! !
!

