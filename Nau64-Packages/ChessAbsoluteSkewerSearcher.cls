"Filed out from Dolphin Smallalk"!

ChessSkewerSearcher subclass: #ChessAbsoluteSkewerSearcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessAbsoluteSkewerSearcher guid: (GUID fromString: '{4b93b7ba-469d-406f-9659-4b5c9d807cd7}')!
ChessAbsoluteSkewerSearcher comment: ''!
!ChessAbsoluteSkewerSearcher categoriesForClass!Unclassified! !
!ChessAbsoluteSkewerSearcher methodsFor!

searchOnChessboardFor: aChessSide
	| forks |
	
	forks := TacticDictionary new.
	aChessSide validSquaresByPieceKeysAndValuesDo: [:piece :squareDictionary |
		squareDictionary squaresDo: [:square | | newMoveEngine |
			newMoveEngine := piece newMovementEngine.
			newMoveEngine computeValidSquaresOn: chessboard from: square.
			newMoveEngine detectedADo: [:forkedSquares | 
				forks add: (self createAbsoluteSkewerFor: piece from: square to: forkedSquares) to: piece.
			].
		].
	].
	^forks! !
!ChessAbsoluteSkewerSearcher categoriesForMethods!
searchOnChessboardFor:!public! !
!

