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
	aChessSide piecesDo: [:piece | ].
	aChessSide validSquaresByPieceKeysAndValuesDo: 
			[:piece :squareCollection |
			squareCollection do: 
					[:square |
					(piece newRule
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
	^pins! !
!ChessAbsolutePinSearcher categoriesForMethods!
searchOnChessboardFor:!public! !
!

