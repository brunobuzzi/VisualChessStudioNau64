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

performBlackCastleOn: aChessboard withPostActionOn: aChessGame

	aChessboard movePieceFromCoordiante: #e8 to: #g8.
	aChessboard movePieceFromCoordiante: #h8 to: #f8.

	aChessGame disableBlackCastle.!

performWhiteCastleOn: aChessboard withPostActionOn: aChessGame

	aChessboard movePieceFromCoordiante: #e1 to: #g1.
	aChessboard movePieceFromCoordiante: #h1 to: #f1.

	aChessGame disableWhiteCastle.!

undoOn: aChessboard 

	move to last = $1 "white castle"
	ifTrue: [
		aChessboard movePieceFromCoordiante: #f1 to: #h1.
		^aChessboard movePieceFromCoordiante: #g1 to: #e1.		
	].

	move to last = $8 "black castle"	
	ifTrue: [
		aChessboard movePieceFromCoordiante: #f8 to: #h8.
		^aChessboard movePieceFromCoordiante: #g8 to: #e8.
	].

	^self error: 'Bad undo'
	! !
!ChessKingSideCastleMove categoriesForMethods!
performBlackCastleOn:withPostActionOn:!public! !
performWhiteCastleOn:withPostActionOn:!public! !
undoOn:!public! !
!

