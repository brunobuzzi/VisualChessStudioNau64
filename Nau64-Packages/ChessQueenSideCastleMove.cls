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

performBlackCastleOn: aChessboard 

	aChessboard movePieceFromCoordiante: #e8 to: #c8.
	aChessboard movePieceFromCoordiante: #a8 to: #d8.
!

performWhiteCastleOn: aChessboard 

	aChessboard movePieceFromCoordiante: #e1 to: #c1.
	aChessboard movePieceFromCoordiante: #a1 to: #d1.
! !
!ChessQueenSideCastleMove categoriesForMethods!
performBlackCastleOn:!public! !
performWhiteCastleOn:!public! !
!

