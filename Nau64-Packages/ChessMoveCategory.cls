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

isCastle
	^false!

isEnPassantEnabler
	^false!

isPromotion
	^false!

performPieceSwitchFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard withPostActionOn: aChessGameExecutor

	self subclassResponsibility!

redoOn: aChessboard
	self subclassResponsibility!

setMove: aChessMove

	move := aChessMove!

undoOn: aChessboard 
	self subclassResponsibility! !
!ChessMoveCategory categoriesForMethods!
isCastle!public! !
isEnPassantEnabler!public! !
isPromotion!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
redoOn:!public! !
setMove:!private! !
undoOn:!public! !
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

