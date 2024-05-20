"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGame
	instanceVariableNames: 'systemRoot dateTime whitePlayer blackPlayer moves initialFenPosition initialSideToMove whiteCastleStatus blackCastleStatus pgnString pgnMoves'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGame guid: (GUID fromString: '{cab5dfb3-cb33-47c8-828c-f22ddfe10c20}')!
ChessGame comment: ''!
!ChessGame categoriesForClass!Unclassified! !
!ChessGame methodsFor!

annotateMoveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard
	| aChessMove |
self shouldNotImplement.
	aChessMove := ChessMove newOn: moves from: originSymbolCoordiante to: targetSymbolCoordinate.
	moves annotateMove: aChessMove on: aChessboard.
	^aChessMove!

buildGameFromPgn: aPgnString
	| parser |
	parser := ChessPgnParser newOn: systemRoot pgnString: aPgnString.
	parser buildGameFor: self!

disableBlackCastle
self shouldNotImplement.
	blackCastleStatus disableCastle!

disableBlackCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
self shouldNotImplement.
	originSymbolCoordiante = #e8 ifTrue: [^self disableWhiteCastle].
	originSymbolCoordiante = #a8 ifTrue: [^blackCastleStatus disableQueenSideCastle].
	originSymbolCoordiante = #h8 ifTrue: [^blackCastleStatus disableKingSideCastle]!

disableCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
self shouldNotImplement.
	(moves lastSideToMoveOn: aChessboard) = #white
		ifTrue: [^self disableWhiteCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard].
	(moves lastSideToMoveOn: aChessboard) = #black
		ifTrue: [^self disableBlackCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard].
	self error: 'No such side'!

disableWhiteCastle
self shouldNotImplement.
	whiteCastleStatus disableCastle!

disableWhiteCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard
self shouldNotImplement.
	originSymbolCoordiante = #e1 ifTrue: [^self disableWhiteCastle].
	originSymbolCoordiante = #a1 ifTrue: [^whiteCastleStatus disableQueenSideCastle].
	originSymbolCoordiante = #h1 ifTrue: [^whiteCastleStatus disableKingSideCastle]!

ifBlackKindSideCastleNotEnabled: aNiladicValuable 
self shouldNotImplement.
	blackCastleStatus ifKindSideCastleNotEnabled: aNiladicValuable !

ifBlackQueenSideCastleNotEnabled: aNiladicValuable 
self shouldNotImplement.
	blackCastleStatus ifQueenSideCastleNotEnabled: aNiladicValuable !

ifWhiteKindSideCastleNotEnabled: aNiladicValuable 
self shouldNotImplement.
	whiteCastleStatus ifKindSideCastleNotEnabled: aNiladicValuable.!

ifWhiteQueenSideCastleNotEnabled: aNiladicValuable 
self shouldNotImplement.
	whiteCastleStatus ifQueenSideCastleNotEnabled: aNiladicValuable !

initialFenPosition

	^initialFenPosition ifNil: [self initialFenStringPosition] ifNotNil: [initialFenPosition].!

initialFenStringPosition

	^self class initialFenStringPosition!

initialSideToMove

	^initialSideToMove!

isCorrectSideToMove: aChessPiece on: aChessboard
self shouldNotImplement.
	^(self nextSideToMoveOn: aChessboard) = aChessPiece sideName!

isLastPgnAnnotation: anArray

	^pgnMoves last == anArray!

lastMoveIsBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate
self shouldNotImplement.
	^moves lastMoveIsBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate
self shouldNotImplement.
	^moves lastMoveIsWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastSideToMoveOn: aChessboard
self shouldNotImplement.
	moves isEmpty ifTrue: [^self error: 'No side has moved'].

	^moves lastSideToMoveOn: aChessboard
!

moveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard

	self 
		performMove: (self annotateMoveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard) 
		on: aChessboard
	
	!

movesDo: aBlock
self shouldNotImplement.
	aBlock value: moves!

newFenExecutor
	| fenExecutor parser |

	fenExecutor := ChessFenGameExecutor newOn: self.

	parser := ChessFenParser newOn: systemRoot fenString: initialFenPosition.
	fenExecutor setInitalMoveAndCastleFromFenParser: parser.

	^fenExecutor!

newFenExecutorOn: aChessboard
	| fenExecutor parser |

	fenExecutor := ChessFenGameExecutor newOn: self chessboard: aChessboard.

	parser := ChessFenParser newOn: systemRoot fenString: initialFenPosition.
	fenExecutor setInitalMoveAndCastleFromFenParser: parser.
	parser deployOn: aChessboard.

	^fenExecutor!

newInitialChessboard
	| chessboard |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: initialFenPosition) deployOn: chessboard.
	^chessboard
	

	!

newPgnExecutor
	| pgnExecutor parser |

	pgnExecutor := ChessFenGameExecutor newOn: self.

	parser := ChessPgnParser newOn: systemRoot pgnString: initialFenPosition.
	parser buildGameFor: pgnExecutor.

	^pgnExecutor!

nextSideToMoveOn: aChessboard
self shouldNotImplement.
	moves isEmpty ifTrue: [^initialSideToMove].

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

pgnMovesDo: aBlock

	pgnMoves do: aBlock!

printMoves
self shouldNotImplement.
	^moves printMoves!

printMovesOn: aStream
self shouldNotImplement.
	moves printMovesOn: aStream!

redoFirstMoveOn: aChessboard 
self shouldNotImplement.
	moves redoFirstMoveOn: aChessboard!

redoNextMoveOn: aChessboard 
self shouldNotImplement.
	moves redoNextMoveOn: aChessboard !

setInitialMoveToBlack
	
	initialSideToMove := #black!

setInitialMoveToWhite
	
	initialSideToMove := #white!

setOptionFromFenParser: aChessFenParser
self shouldNotImplement.
	initialSideToMove := aChessFenParser sideToMove.

	whiteCastleStatus setQueenCastle: aChessFenParser isEnabledWhiteQueenSideCastle kingCastle: aChessFenParser isEnabledWhiteKingSideCastle.
	
	blackCastleStatus setQueenCastle: aChessFenParser isEnabledBlackQueenSideCastle kingCastle: aChessFenParser isEnabledBlackKingSideCastle.


!

setPgnMoves: anOrderedCollection

	pgnMoves := anOrderedCollection!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString
	| parser |

	dateTime := TimeStamp current.
	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

"	moves := ChessMoveTreeList newOn: self."

	initialSideToMove := #white.

"	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self."

	initialFenPosition := fenString ifNil: [self initialFenStringPosition] ifNotNil: [fenString].
	pgnMoves := OrderedCollection new.
"	parser := ChessFenParser newOn: aSystemRoot fenString: (fenString ifNil: [initialFenPosition]).
	self setOptionFromFenParser: parser."
!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer pgnString: aString
	| parser |

	dateTime := TimeStamp current.
	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	"moves := ChessMoveList newOn: self."
"	moves := ChessMoveTreeList newOn: self."

	initialSideToMove := #white.
"
	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self."

	initialFenPosition := self initialFenStringPosition.
	pgnMoves := OrderedCollection new.
	pgnString := aString.
	
"	parser := ChessPgnParser newOn: aSystemRoot pgnString: pgnString.
	parser buildPgnListFor: self"
!

undoLastMoveOn: aChessboard
self shouldNotImplement.
	moves undoLastMoveOn: aChessboard! !
!ChessGame categoriesForMethods!
annotateMoveFrom:to:on:!moves!public! !
buildGameFromPgn:!parser-pgn!public! !
disableBlackCastle!castle!public! !
disableBlackCastleForPieceMovedFrom:on:!castle!public! !
disableCastleForPieceMovedFrom:on:!castle!public! !
disableWhiteCastle!castle!public! !
disableWhiteCastleForPieceMovedFrom:on:!castle!public! !
ifBlackKindSideCastleNotEnabled:!castle!public! !
ifBlackQueenSideCastleNotEnabled:!castle!public! !
ifWhiteKindSideCastleNotEnabled:!castle!public! !
ifWhiteQueenSideCastleNotEnabled:!castle!public! !
initialFenPosition!executors!public! !
initialFenStringPosition!private! !
initialSideToMove!public! !
isCorrectSideToMove:on:!public! !
isLastPgnAnnotation:!moves!public! !
lastMoveIsBlackEnPassantEnabledFrom:to:!en passant!public! !
lastMoveIsWhiteEnPassantEnabledFrom:to:!en passant!public! !
lastSideToMoveOn:!public! !
moveFrom:to:on:!moves!public! !
movesDo:!moves!public! !
newFenExecutor!executors!public! !
newFenExecutorOn:!executors!public! !
newInitialChessboard!public! !
newPgnExecutor!executors!public! !
nextSideToMoveOn:!public! !
nextSideToMoveOn:isBlackDo:!public! !
nextSideToMoveOn:isWhiteDo:!public! !
performMove:on:!moves!public! !
pgnMovesDo:!moves!public! !
printMoves!public! !
printMovesOn:!public! !
redoFirstMoveOn:!moves!public! !
redoNextMoveOn:!moves!public! !
setInitialMoveToBlack!public! !
setInitialMoveToWhite!public! !
setOptionFromFenParser:!parser-fen!public! !
setPgnMoves:!parser-pgn!public! !
setRoot:whitePlayer:blackPlayer:fenString:!private! !
setRoot:whitePlayer:blackPlayer:pgnString:!private! !
undoLastMoveOn:!moves!public! !
!

!ChessGame class methodsFor!

icon

	^Icon fromId: 'Interactor.ico'!

initialFenStringPosition
	^'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR/ w - - 1 20'!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer

	^self new setRoot:  aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: self initialFenStringPosition!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString

	^self new setRoot:  aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer pgnString: pgnString

	^self new setRoot:  aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer pgnString: pgnString! !
!ChessGame class categoriesForMethods!
icon!public! !
initialFenStringPosition!private! !
newOn:whitePlayer:blackPlayer:!public! !
newOn:whitePlayer:blackPlayer:fenString:!public! !
newOn:whitePlayer:blackPlayer:pgnString:!public! !
!

