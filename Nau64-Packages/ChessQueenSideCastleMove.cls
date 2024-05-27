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

	aChessGame disableWhiteCastle.!

undoOn: aChessboard 

	move to last = $1 "white castle"
	ifTrue: [
		aChessboard movePieceFromCoordiante: #d1 to: #a1.
		^aChessboard movePieceFromCoordiante: #c1 to: #e1.		
	].

	move to last = $8 "black castle"	
	ifTrue: [
		aChessboard movePieceFromCoordiante: #d8 to: #a8.
		^aChessboard movePieceFromCoordiante: #c8 to: #e8.
	].

	^self error: 'Bad undo'
	! !
!ChessQueenSideCastleMove categoriesForMethods!
performBlackCastleOn:withPostActionOn:!public! !
performWhiteCastleOn:withPostActionOn:!public! !
undoOn:!public! !
!

