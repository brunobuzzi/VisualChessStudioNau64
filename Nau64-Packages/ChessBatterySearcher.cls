"Filed out from Dolphin Smallalk"!

ChessTacticMoveSearcher subclass: #ChessBatterySearcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessBatterySearcher guid: (GUID fromString: '{e14529c0-ebe9-4bee-b7ef-8d39e1930c6f}')!
ChessBatterySearcher comment: ''!
!ChessBatterySearcher categoriesForClass!Unclassified! !
!ChessBatterySearcher methodsFor!

createBatteryFor: aChessPiece from: square to: forkedSquares

	^ChessBattery new!

searchOnChessboardFor: aChessSide
	| forks |
	
	forks := TacticDictionary new.
	aChessSide validSquaresByPieceKeysAndValuesDo: [:piece :squareDictionary |
		squareDictionary squaresDo: [:square | | newMoveEngine |
	"		newMoveEngine := piece newMovementEngine.
			newMoveEngine computeValidSquaresOn: chessboard from: square.
			newMoveEngine detectedBatteriesDo: [:baterrySquares | 
				forks add: (self createBatteryFor: piece from: square to: baterrySquares) to: piece.
			]."
		].
	].
	^forks! !
!ChessBatterySearcher categoriesForMethods!
createBatteryFor:from:to:!public! !
searchOnChessboardFor:!public! !
!

