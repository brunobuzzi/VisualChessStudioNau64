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

chessboardDo: aMonadicBlock

	aMonadicBlock value: chessboard!

currentMoveDo: aBlock

	aBlock value: currentMove!

disableBlackCastle

	blackCastleStatus disableCastle!

disableBlackCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
	originSymbolCoordiante = #e8 ifTrue: [^self disableWhiteCastle].
	originSymbolCoordiante = #a8 ifTrue: [^blackCastleStatus disableQueenSideCastle].
	originSymbolCoordiante = #h8 ifTrue: [^blackCastleStatus disableKingSideCastle]!

disableCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
	currentMove ifNil: [^self].
	(self lastSideToMoveOn: aChessboard) = #white
		ifTrue: [^self disableWhiteCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard].
	(self lastSideToMoveOn: aChessboard) = #black
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

includesPgnMove: pgnString

	moves preOrderDo: [:each | each printPgn = pgnString ifTrue: [^true]].
	^false!

isCorrectSideToMove: aChessPiece on: aChessboard

	^(self nextSideToMoveOn: aChessboard) = aChessPiece sideName!

lastMoveIsBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastSideToMoveOn: aChessboard

	currentMove isNil ifTrue: [^self error: 'No side has moved'].

	^(currentMove isBlackOn: aChessboard) ifTrue: [#black] ifFalse: [#white]!

moveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard

	self 
		performMove: (self annotateMoveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard) 
		on: aChessboard
	
	!

moveRedoAllOn: aChessboard

	moves moveRedoAllOn: aChessboard!

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

printFenStringForBlackCastle

	^blackCastleStatus printFenStringForBlack!

printFenStringForWhiteCastle

	^whiteCastleStatus printFenStringForWhite!

printMoves

	^moves printMoves!

printMovesOn: aStream

	moves printMovesOn: aStream!

redoAllMoves

	self redoAllMovesOn: chessboard!

redoAllMovesOn: aChessboard
	
	self redoAllMovesOn: aChessboard currentMoveDo: [:move | "do nothing" ]!

redoAllMovesOn: aChessboard currentMoveDo: aBlock
	| count exit |
	count := 0.
	exit := false.
	[exit] whileFalse: [
		count := count + 1.
		self redoNextMoveOn: aChessboard ifNone: [exit := true].
		aBlock value: currentMove.
		count > 500 ifTrue: [self error: 'BUG: something went wrong'].
	].!

redoFirstMoveOn: aChessboard 

	self redoFirstMoveOn: aChessboard ifNone: [self]!

redoFirstMoveOn: aChessboard ifNone: aBlock

	moves hasMoves ifFalse: [^aBlock value].
	
	moves firstMoveDo: [:aChessMove | 
		aChessMove redoOn: aChessboard.
		currentMove := aChessMove].!

redoNextMoveOn: aChessboard 

	self redoNextMoveOn: aChessboard ifNone: [self]!

redoNextMoveOn: aChessboard ifNone: aBlock

	currentMove ifNil: [^self redoFirstMoveOn: aChessboard].
	moves 
		lookupChildNodeOf: currentMove 
		do: [:childNode |
			currentMove := childNode move.
			currentMove redoOn: aChessboard.]
		ifNone: aBlock!

setGame: aChessGame chessboard: aChessboard

	game := aChessGame.
	chessboard := aChessboard.

	moves := ChessMoveTreeList newOn: self.

	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self.!

undoAllMoves

	self undoAllMovesOn: chessboard!

undoAllMovesOn: aChessboard
	| count |
	count := 0.

	[currentMove notNil] whileTrue: [
		count := count + 1.
		self undoLastMoveOn: aChessboard ifNone: [].
		count > 500 ifTrue: [self error: 'BUG: something went wrong'].
	].!

undoLastMove

	self undoLastMoveOn: chessboard!

undoLastMoveOn: aChessboard

	self undoLastMoveOn: aChessboard 
		ifNone: [self error: 'Can NOT undo, there is no last move']!

undoLastMoveOn: aChessboard ifNone: aBlock

	currentMove ifNil: [^aBlock value].
	
	moves 
		lookupParentNodeOf: currentMove 
		do: [:parentNode |
			currentMove undoOn: aChessboard.
			parentNode ifNotNil: [currentMove := parentNode move] ifNil: [currentMove := nil] ] 
		ifNone: [aBlock value].! !
!ChessGameExecutor categoriesForMethods!
annotateMoveFrom:to:on:!moves!public! !
chessboardDo:!public! !
currentMoveDo:!moves!public! !
disableBlackCastle!castle!public! !
disableBlackCastleForPieceMovedFrom:on:!castle!public! !
disableCastleForPieceMovedFrom:on:!castle!public! !
disableWhiteCastle!castle!public! !
disableWhiteCastleForPieceMovedFrom:on:!castle!public! !
ifBlackKindSideCastleNotEnabled:!castle!public! !
ifBlackQueenSideCastleNotEnabled:!castle!public! !
ifWhiteKindSideCastleNotEnabled:!castle!public! !
ifWhiteQueenSideCastleNotEnabled:!castle!public! !
includesPgnMove:!public! !
isCorrectSideToMove:on:!public! !
lastMoveIsBlackEnPassantEnabledFrom:to:!en passant!public! !
lastMoveIsWhiteEnPassantEnabledFrom:to:!en passant!public! !
lastSideToMoveOn:!public! !
moveFrom:to:on:!moves!public! !
moveRedoAllOn:!moves!public! !
movesDo:!moves!public! !
newInitialChessboard!chessboard!public! !
nextSideToMoveOn:!public! !
nextSideToMoveOn:isBlackDo:!public! !
nextSideToMoveOn:isWhiteDo:!public! !
performMove:on:!moves!public! !
printFenStringForBlackCastle!public! !
printFenStringForWhiteCastle!public! !
printMoves!public! !
printMovesOn:!public! !
redoAllMoves!moves!public! !
redoAllMovesOn:!moves!public! !
redoAllMovesOn:currentMoveDo:!moves!public! !
redoFirstMoveOn:!moves!public! !
redoFirstMoveOn:ifNone:!moves!public! !
redoNextMoveOn:!moves!public! !
redoNextMoveOn:ifNone:!moves!public! !
setGame:chessboard:!private! !
undoAllMoves!moves!public! !
undoAllMovesOn:!moves!public! !
undoLastMove!public! !
undoLastMoveOn:!moves!public! !
undoLastMoveOn:ifNone:!moves!public! !
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

