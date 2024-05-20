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
	"Nothing to do, it is only a enabler for the next move" !

isEnPassantEnabler
	^true!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGameExecutor
	"Nothing to do, it is only a enabler for the next move" !

undoOn: aChessboard 
	"Nothing to do, it is only a enabler for the next move" ! !
!ChessEnPassantEnablerMove categoriesForMethods!
applyRedoTo:on:!public! !
isEnPassantEnabler!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
undoOn:!public! !
!

