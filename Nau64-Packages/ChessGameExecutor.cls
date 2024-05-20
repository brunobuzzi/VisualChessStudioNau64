"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGameExecutor
	instanceVariableNames: 'game chessboard currentMove moves whiteCastleStatus blackCastleStatus'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGameExecutor guid: (GUID fromString: '{7e71a7b2-ce53-45dd-8f9c-c3dcfe6b5ff4}')!
ChessGameExecutor comment: ''!
!ChessGameExecutor categoriesForClass!Unclassified! !
!ChessGameExecutor methodsFor!

annotateMoveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard
	| aChessMove |

	aChessMove := ChessMove newOn: moves from: originSymbolCoordiante to: targetSymbolCoordinate.
	moves annotateMove: aChessMove on: aChessboard.
	^aChessMove!

disableBlackCastle

	blackCastleStatus disableCastle!

disableBlackCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
	originSymbolCoordiante = #e8 ifTrue: [^self disableWhiteCastle].
	originSymbolCoordiante = #a8 ifTrue: [^blackCastleStatus disableQueenSideCastle].
	originSymbolCoordiante = #h8 ifTrue: [^blackCastleStatus disableKingSideCastle]!

disableCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
	(moves lastSideToMoveOn: aChessboard) = #white
		ifTrue: [^self disableWhiteCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard].
	(moves lastSideToMoveOn: aChessboard) = #black
		ifTrue: [^self disableBlackCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard].
	self error: 'No such side'!

disableWhiteCastle

	whiteCastleStatus disableCastle!

disableWhiteCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
	originSymbolCoordiante = #e1 ifTrue: [^self disableWhiteCastle].
	originSymbolCoordiante = #a1 ifTrue: [^whiteCastleStatus disableQueenSideCastle].
	originSymbolCoordiante = #h1 ifTrue: [^whiteCastleStatus disableKingSideCastle]!

ifBlackKindSideCastleNotEnabled: aNiladicValuable 

	blackCastleStatus ifKindSideCastleNotEnabled: aNiladicValuable !

ifBlackQueenSideCastleNotEnabled: aNiladicValuable 

	blackCastleStatus ifQueenSideCastleNotEnabled: aNiladicValuable !

ifWhiteKindSideCastleNotEnabled: aNiladicValuable 

	whiteCastleStatus ifKindSideCastleNotEnabled: aNiladicValuable.!

ifWhiteQueenSideCastleNotEnabled: aNiladicValuable 

	whiteCastleStatus ifQueenSideCastleNotEnabled: aNiladicValuable !

isCorrectSideToMove: aChessPiece on: aChessboard

	^(self nextSideToMoveOn: aChessboard) = aChessPiece sideName!

lastMoveIsBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastSideToMoveOn: aChessboard

	moves isEmpty ifTrue: [^self error: 'No side has moved'].

	^moves lastSideToMoveOn: aChessboard
!

moveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard

	self 
		performMove: (self annotateMoveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard) 
		on: aChessboard
	
	!

movesDo: aBlock

	aBlock value: moves!

newInitialChessboard
	| newChessbaord |

	newChessbaord := Chessboard newEmptyOn: game systemRoot.
	(ChessFenParser newOn: game systemRoot fenString: game initialFenPosition) deployOn: newChessbaord.
	^newChessbaord!

nextSideToMoveOn: aChessboard

	moves isEmpty ifTrue: [^game initialSideToMove].

	^moves nextSideToMoveOn: aChessboard
!

nextSideToMoveOn: aChessboard isBlackDo: aBlock

	(self nextSideToMoveOn: aChessboard) = #black
	ifTrue: [aBlock value]!

nextSideToMoveOn: aChessboard isWhiteDo: aBlock

	(self nextSideToMoveOn: aChessboard) = #white
	ifTrue: [aBlock value]!

performMove: aChessMove on: aChessboard

	aChessMove 
		performPieceSwitchFrom: aChessMove from 
		to: aChessMove to 
		on: aChessboard 
		withPostActionOn: self!

playNextMove

	game movesDo: [:treeList | | nodes |
		nodes := treeList childrenOf: (currentMove ifNil: [nil] ifNotNil: [:value | value move]).
		nodes do: [:node | "node move isCastle ifTrue: [self halt]." game performMove: node move on: chessboard ].
		currentMove := nodes last.
	].!

printMoves

	^moves printMoves!

printMovesOn: aStream

	moves printMovesOn: aStream!

redoFirstMoveOn: aChessboard 

	moves redoFirstMoveOn: aChessboard!

redoNextMoveOn: aChessboard 

	moves redoNextMoveOn: aChessboard !

setGame: aChessGame chessboard: aChessboard

	game := aChessGame.
	chessboard := aChessboard.

	moves := ChessMoveTreeList newOn: self.

	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self.!

undoLastMove

	game undoLastMoveOn: chessboard!

undoLastMoveOn: aChessboard

	moves undoLastMoveOn: aChessboard! !
!ChessGameExecutor categoriesForMethods!
annotateMoveFrom:to:on:!moves!public! !
disableBlackCastle!castle!public! !
disableBlackCastleForPieceMovedFrom:on:!castle!public! !
disableCastleForPieceMovedFrom:on:!castle!public! !
disableWhiteCastle!castle!public! !
disableWhiteCastleForPieceMovedFrom:on:!castle!public! !
ifBlackKindSideCastleNotEnabled:!castle!public! !
ifBlackQueenSideCastleNotEnabled:!castle!public! !
ifWhiteKindSideCastleNotEnabled:!castle!public! !
ifWhiteQueenSideCastleNotEnabled:!castle!public! !
isCorrectSideToMove:on:!public! !
lastMoveIsBlackEnPassantEnabledFrom:to:!en passant!public! !
lastMoveIsWhiteEnPassantEnabledFrom:to:!en passant!public! !
lastSideToMoveOn:!public! !
moveFrom:to:on:!moves!public! !
movesDo:!moves!public! !
newInitialChessboard!chessboard!public! !
nextSideToMoveOn:!public! !
nextSideToMoveOn:isBlackDo:!public! !
nextSideToMoveOn:isWhiteDo:!public! !
performMove:on:!moves!public! !
playNextMove!public! !
printMoves!public! !
printMovesOn:!public! !
redoFirstMoveOn:!moves!public! !
redoNextMoveOn:!moves!public! !
setGame:chessboard:!private! !
undoLastMove!public! !
undoLastMoveOn:!moves!public! !
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

