"Filed out from Dolphin Smallalk"!

ChessCastleMove subclass: #ChessQueenSideCastleMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessQueenSideCastleMove guid: (GUID fromString: '{50282620-5463-451f-bc8b-e2367896bd29}')!
ChessQueenSideCastleMove comment: ''!
!ChessQueenSideCastleMove categoriesForClass!Unclassified! !
!ChessQueenSideCastleMove methodsFor!

performBlackCastleOn: aChessboard withPostActionOn: aChessGame

	aChessboard movePieceFromCoordiante: #e8 to: #c8.
	aChessboard movePieceFromCoordiante: #a8 to: #d8.

	aChessGame disableBlackCastle.!

performWhiteCastleOn: aChessboard withPostActionOn: aChessGame

	aChessboard movePieceFromCoordiante: #e1 to: #c1.
	aChessboard movePieceFromCoordiante: #a1 to: #d1.

	aChessGame disableWhiteCastle.! !
!ChessQueenSideCastleMove categoriesForMethods!
performBlackCastleOn:withPostActionOn:!public! !
performWhiteCastleOn:withPostActionOn:!public! !
!

