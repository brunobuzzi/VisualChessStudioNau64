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

getValidAttackSquaresFor: piece from: aChessSquare do: aBlock
	| currentSquare attackedSquares |

	piece isPawn ifTrue: [^piece newMovementEngine possibleMovesOn: chessboard from: aChessSquare].

	currentSquare := chessboard squareFor: piece.
	^(chessboard squareIsEmptyAtCoordinate: aChessSquare coordinate)
	ifTrue: [chessboard movePieceFromCoordiante: currentSquare coordinate to: aChessSquare coordinate.
		attackedSquares := piece newMovementEngine attackedSquaresOn: chessboard from: aChessSquare.
		chessboard movePieceFromCoordiante: aChessSquare coordinate to: currentSquare coordinate.
		attackedSquares]
	ifFalse: [piece newMovementEngine attackedSquaresOn: chessboard from: aChessSquare]!

searchOnChessboardFor: aChessSide
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
!ChessForkSearcher categoriesForMethods!
createForkFor:from:to:!public! !
getValidAttackSquaresFor:from:do:!public! !
searchOnChessboardFor:!public! !
!

