"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGamePlayer
	instanceVariableNames: 'game chessboard currentMove'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGamePlayer guid: (GUID fromString: '{7e71a7b2-ce53-45dd-8f9c-c3dcfe6b5ff4}')!
ChessGamePlayer comment: ''!
!ChessGamePlayer categoriesForClass!Unclassified! !
!ChessGamePlayer methodsFor!

playNextMove

	game movesDo: [:treeList | | nodes |
		nodes := treeList childrenOf: (currentMove ifNil: [nil] ifNotNil: [:value | value move]).
		nodes do: [:node | self halt. node move redoOn: chessboard].
		currentMove := nodes last.
	].!

setGame: aChessGame chessboard: aChessboard

	game := aChessGame.
	chessboard := aChessboard! !
!ChessGamePlayer categoriesForMethods!
playNextMove!public! !
setGame:chessboard:!private! !
!

!ChessGamePlayer class methodsFor!

newOn: aChessGame

	^self newOn: aChessGame chessboard: aChessGame newInitialChessboard!

newOn: aChessGame chessboard: aChessboard

	^self new setGame: aChessGame chessboard: aChessboard! !
!ChessGamePlayer class categoriesForMethods!
newOn:!public! !
newOn:chessboard:!public! !
!

