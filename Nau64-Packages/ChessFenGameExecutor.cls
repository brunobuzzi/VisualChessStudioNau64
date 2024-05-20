"Filed out from Dolphin Smallalk"!

ChessGameExecutor subclass: #ChessFenGameExecutor
	instanceVariableNames: 'initialSideToMove'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessFenGameExecutor guid: (GUID fromString: '{4bf0a7d6-33ac-4502-88db-92a2537dc5a2}')!
ChessFenGameExecutor comment: ''!
!ChessFenGameExecutor categoriesForClass!Unclassified! !
!ChessFenGameExecutor methodsFor!

setInitalMoveAndCastleFromFenParser: aChessFenParser

	initialSideToMove := aChessFenParser sideToMove.

	whiteCastleStatus setQueenCastle: aChessFenParser isEnabledWhiteQueenSideCastle kingCastle: aChessFenParser isEnabledWhiteKingSideCastle.
	
	blackCastleStatus setQueenCastle: aChessFenParser isEnabledBlackQueenSideCastle kingCastle: aChessFenParser isEnabledBlackKingSideCastle.


! !
!ChessFenGameExecutor categoriesForMethods!
setInitalMoveAndCastleFromFenParser:!parser-fen!public! !
!

