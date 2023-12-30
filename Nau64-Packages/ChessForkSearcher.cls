"Filed out from Dolphin Smallalk"!

ChessTacticMoveSearcher subclass: #ChessForkSearcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessForkSearcher guid: (GUID fromString: '{b175382f-d8e6-4cfd-947e-63201256f54a}')!
ChessForkSearcher comment: ''!
!ChessForkSearcher categoriesForClass!Unclassified! !
!ChessForkSearcher methodsFor!

createForkFor: aChessPiece from: square to: forkedSquares

	^ChessFork newFromCurrentSquare: aChessPiece currentChessSquare from: square to: forkedSquares!

searchOnChessboardFor: aChessSide
	| forks |
	
	forks := TacticDictionary new.
	aChessSide validSquaresByPieceKeysAndValuesDo: [:piece :squareDictionary |
		squareDictionary squaresDo: [:square | | newMoveEngine |
		"	newMoveEngine := piece newMovementEngine.
			newMoveEngine computeValidSquaresOn: chessboard from: square.
			newMoveEngine detectedForksDo: [:forkedSquares | 
				forks add: (self createForkFor: piece from: square to: forkedSquares) to: piece.
			]."
		].
	].
	^forks! !
!ChessForkSearcher categoriesForMethods!
createForkFor:from:to:!public! !
searchOnChessboardFor:!public! !
!

