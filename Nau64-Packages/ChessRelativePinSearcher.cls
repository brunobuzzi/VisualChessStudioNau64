"Filed out from Dolphin Smallalk"!

ChessPinSearcher subclass: #ChessRelativePinSearcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessRelativePinSearcher guid: (GUID fromString: '{a91528b5-d89e-46c3-8d2d-22de33bb3bd0}')!
ChessRelativePinSearcher comment: ''!
!ChessRelativePinSearcher categoriesForClass!Unclassified! !
!ChessRelativePinSearcher methodsFor!

searchOnChessboardFor: aChessSide
	| pins |
	pins := Dictionary new.
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
								(((chessboard squareNotEmptyAtCoordinate: each coordinate) and: 
										[((chessboard pieceAt: each) isOppositeSideTo: piece) and: [(chessboard pieceAt: each) isKing not]])
									and: [piece isSecureToAttack: square on: chessboard]) ifTrue: [pinSquare := square].
								(pins includesKey: piece) ifFalse: [pins at: piece put: Set new].
								pinSquare notNil ifTrue: [(pins at: piece) add: pinSquare]]]].
	^pins! !
!ChessRelativePinSearcher categoriesForMethods!
searchOnChessboardFor:!public! !
!

