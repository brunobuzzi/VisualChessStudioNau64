"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGameExecutor
	instanceVariableNames: 'game chessboard currentMove'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGameExecutor guid: (GUID fromString: '{7e71a7b2-ce53-45dd-8f9c-c3dcfe6b5ff4}')!
ChessGameExecutor comment: ''!
!ChessGameExecutor categoriesForClass!Unclassified! !
!ChessGameExecutor methodsFor!

playNextMove

	game movesDo: [:treeList | | nodes |
		nodes := treeList childrenOf: (currentMove ifNil: [nil] ifNotNil: [:value | value move]).
		nodes do: [:node | "node move isCastle ifTrue: [self halt]." game performMove: node move on: chessboard ].
		currentMove := nodes last.
	].!

setGame: aChessGame chessboard: aChessboard

	game := aChessGame.
	chessboard := aChessboard!

undoLastMove

	game undoLastMoveOn: chessboard! !
!ChessGameExecutor categoriesForMethods!
playNextMove!public! !
setGame:chessboard:!private! !
undoLastMove!public! !
!

!ChessGameExecutor class methodsFor!

newOn: aChessGame

	^self newOn: aChessGame chessboard: aChessGame newInitialChessboard!

newOn: aChessGame chessboard: aChessboard

	^self new setGame: aChessGame chessboard: aChessboard! !
!ChessGameExecutor class categoriesForMethods!
newOn:!public! !
newOn:chessboard:!public! !
!

