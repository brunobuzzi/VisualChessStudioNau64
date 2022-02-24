"Filed out from Dolphin Smallalk"!

ChessCastleMove subclass: #ChessKingSideCastleMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessKingSideCastleMove guid: (GUID fromString: '{e9527250-3e77-485a-8f97-6d9ad6edbfe3}')!
ChessKingSideCastleMove comment: ''!
!ChessKingSideCastleMove categoriesForClass!Unclassified! !
!ChessKingSideCastleMove methodsFor!

performBlackCastleOn: aChessboard 

	aChessboard movePieceFromCoordiante: #e8 to: #g8.
	aChessboard movePieceFromCoordiante: #h8 to: #f8.
!

performWhiteCastleOn: aChessboard 

	aChessboard movePieceFromCoordiante: #e1 to: #g1.
	aChessboard movePieceFromCoordiante: #h1 to: #f1.
! !
!ChessKingSideCastleMove categoriesForMethods!
performBlackCastleOn:!public! !
performWhiteCastleOn:!public! !
!

