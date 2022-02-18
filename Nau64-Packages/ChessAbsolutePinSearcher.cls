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
	pins := Dictionary new.
	aChessSide validSquaresByPieceKeysAndValuesDo: 
			[:piece :squareDictionary |
			squareDictionary squaresDo: 
					[:square |
					(piece newMovementEngine
						skeweredPieces: 2
						on: chessboard
						from: square) do: 
								[:each |
								| pinSquare |
								((chessboard squareNotEmptyAtCoordinate: each coordinate)
									and: [((chessboard pieceAt: each) isOppositeSideTo: piece) and: [(chessboard pieceAt: each) isKing]])
										ifTrue: [pinSquare := square].
								(pins includesKey: piece) ifFalse: [pins at: piece put: Set new].
								pinSquare notNil ifTrue: [(pins at: piece) add: pinSquare]]]].
	^pins!

searchOnChessboardFor2: aChessSide
	| forks |
	
	forks := TacticDictionary new.
	aChessSide validSquaresByPieceKeysAndValuesDo: [:piece :squareDictionary |
		squareDictionary squaresDo: [:square | | newMoveEngine |
			newMoveEngine := piece newMovementEngine.
			newMoveEngine computeValidSquaresOn: chessboard from: square.
			newMoveEngine detectedForksDo: [:forkedSquares | 
				forks add: (self createForkFor: piece from: square to: forkedSquares) to: piece.
			].
		].
	].
	^forks! !
!ChessAbsolutePinSearcher categoriesForMethods!
searchOnChessboardFor:!public! !
searchOnChessboardFor2:!public! !
!

