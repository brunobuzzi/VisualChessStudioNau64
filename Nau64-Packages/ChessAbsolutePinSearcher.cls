"Filed out from Dolphin Smallalk"!

ChessPinSearcher subclass: #ChessAbsolutePinSearcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessAbsolutePinSearcher guid: (GUID fromString: '{45c8e50e-addb-42d9-967c-2069579c7586}')!
ChessAbsolutePinSearcher comment: ''!
!ChessAbsolutePinSearcher categoriesForClass!Unclassified! !
!ChessAbsolutePinSearcher methodsFor!

searchOnChessboardFor: aChessSide
	| pins |
	
	pins := TacticDictionary new.
	aChessSide validSquaresByPieceKeysAndValuesDo: [:piece :squareDictionary |
		squareDictionary squaresDo: [:square | | newMoveEngine |
"			newMoveEngine := piece newMovementEngine.
			newMoveEngine computeValidSquaresOn: chessboard from: square.
			newMoveEngine detectedAbsolutePinsDo: [:pinSquares | 
				pins add: (self createAbsolutePinFor: piece from: square to: pinSquares) to: piece.
			]."
		].
	].
	^pins! !
!ChessAbsolutePinSearcher categoriesForMethods!
searchOnChessboardFor:!public! !
!

