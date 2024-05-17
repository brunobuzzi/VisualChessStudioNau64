"Filed out from Dolphin Smallalk"!

ChessMoveCategory subclass: #ChessCastleMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessCastleMove guid: (GUID fromString: '{e4dd4a6c-d882-4a95-bbea-7b6c0c30669e}')!
ChessCastleMove comment: ''!
!ChessCastleMove categoriesForClass!Unclassified! !
!ChessCastleMove methodsFor!

isCastle
	^true!

performBlackCastleOn: aChessboard withPostActionOn: aChessGame

	self subclassResponsibility!

performPieceSwitchFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard withPostActionOn: aChessGame

	(move isBlackCurrentSideMovingOn: aChessboard)
	ifTrue: [self performBlackCastleOn: aChessboard withPostActionOn: aChessGame] 
	ifFalse: [self performWhiteCastleOn: aChessboard withPostActionOn: aChessGame]!

performWhiteCastleOn: aChessboard withPostActionOn: aChessGame

	self subclassResponsibility! !
!ChessCastleMove categoriesForMethods!
isCastle!public! !
performBlackCastleOn:withPostActionOn:!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
performWhiteCastleOn:withPostActionOn:!public! !
!

