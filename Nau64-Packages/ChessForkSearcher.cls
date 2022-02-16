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

getValidAttackSquaresFor: piece from: aChessSquare do: aBlock
"	| currentSquare attackedSquares |

	piece isPawn ifTrue: [^piece newRule possibleMovesOn: chessboard from: aChessSquare].

	currentSquare := chessboard squareFor: piece.
	^(chessboard squareIsEmptyAtCoordinate: aChessSquare coordinate)
	ifTrue: [chessboard movePieceFromCoordiante: currentSquare coordinate to: aChessSquare coordinate.
		attackedSquares := piece newRule attackedSquaresOn: chessboard from: aChessSquare.
		chessboard movePieceFromCoordiante: aChessSquare coordinate to: currentSquare coordinate.
		attackedSquares]
	ifFalse: [piece newRule attackedSquaresOn: chessboard from: aChessSquare]"!

searchOnChessboardFor: aChessSide
	| forks |
	
	forks := Dictionary new.
	aChessSide validSquaresByPieceKeysAndValuesDo: 
			[:piece :squareCollection |
			squareCollection do: 
					[:square |
					| attackCount forkSquare |
					attackCount := 0.
					self getValidAttackSquaresFor: piece from: square do: 
							[:each |
							(each coordinate ~= square coordinate and:[((chessboard pieceAt: each) notNil and: [(chessboard pieceAt: each) isOppositeSideTo: piece])])
								ifTrue: 
									[attackCount := attackCount + 1.
									forkSquare := square]].
					attackCount > 1
						ifTrue: 
							[(forks includesKey: piece) ifFalse: [forks at: piece put: Set new].
							(forks at: piece) add: forkSquare]]].
	^forks! !
!ChessForkSearcher categoriesForMethods!
getValidAttackSquaresFor:from:do:!public! !
searchOnChessboardFor:!public! !
!

