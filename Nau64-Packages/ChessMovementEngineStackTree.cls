"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMovementEngineStackTree
	instanceVariableNames: 'piece originSquare chessboard roots'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMovementEngineStackTree guid: (GUID fromString: '{be8f61e4-7324-4646-9f73-ce107d41d633}')!
ChessMovementEngineStackTree comment: ''!
!ChessMovementEngineStackTree categoriesForClass!Unclassified! !
!ChessMovementEngineStackTree methodsFor!

createTreeNodesFrom: aChessSquare
	| moveEngine treeNode |
	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: originSquare.
	treeNode := ChessMovementEngineStackTreeNode newOn: self movementEngine: moveEngine parentNode: nil.
	^treeNode!

setPiece: aChessPiece from: aChessSquare on: aChessboard
	| moveEngine |

	piece := aChessPiece.
	originSquare := aChessSquare.
	chessboard := aChessboard.

	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: originSquare.
	moveEngine squaresDo: [:square | roots add: (self createTreeNodesFrom: square)]! !
!ChessMovementEngineStackTree categoriesForMethods!
createTreeNodesFrom:!public! !
setPiece:from:on:!private! !
!

!ChessMovementEngineStackTree class methodsFor!

newOn: aChessPiece from: aChessSquare on: aChessboard

	^self new setPiece: aChessPiece from: aChessSquare on: aChessboard! !
!ChessMovementEngineStackTree class categoriesForMethods!
newOn:from:on:!public! !
!

