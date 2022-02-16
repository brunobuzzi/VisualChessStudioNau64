"Filed out from Dolphin Smallalk"!

ChessPinSearcher subclass: #ChessPartialPinSearcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPartialPinSearcher guid: (GUID fromString: '{0c289b43-f8e1-43f6-97c7-da1d3df5aa57}')!
ChessPartialPinSearcher comment: ''!
!ChessPartialPinSearcher categoriesForClass!Unclassified! !
!ChessPartialPinSearcher methodsFor!

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
!ChessPartialPinSearcher categoriesForMethods!
searchOnChessboardFor:!public! !
!

