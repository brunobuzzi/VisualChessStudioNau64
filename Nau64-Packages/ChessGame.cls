"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGame
	instanceVariableNames: 'systemRoot dateTime whitePlayer blackPlayer moves initialFenPosition initialSideToMove whiteCastleStatus blackCastleStatus'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGame guid: (GUID fromString: '{cab5dfb3-cb33-47c8-828c-f22ddfe10c20}')!
ChessGame comment: ''!
!ChessGame categoriesForClass!Unclassified! !
!ChessGame methodsFor!

annotateMoveFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard
	| aChessMove |

	aChessMove := ChessMove newOn: moves from: originSymbolCoordiante to: targetSymbolCoordinate.
	moves annotateMove: aChessMove on: aChessboard.
	^aChessMove!

buildGameFromPgn: aPgnString
	| parser |
	parser := ChessPgnParser newOn: systemRoot pgnString: aPgnString.
	parser buildGameFor: self!

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

initialFenStringPosition

	^self class initialFenStringPosition!

initialSideToMove

	^initialSideToMove!

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

movesListDo: aBlock

	aBlock value: moves!

newInitialChessboard
	| chessboard |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: initialFenPosition) deployOn: chessboard.
	^chessboard
	

	!

nextSideToMoveOn: aChessboard

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

redoNextMoveOn: aChessboard 

	moves redoNextMoveOn: aChessboard !

setInitialMoveToBlack
	
	initialSideToMove := #black!

setInitialMoveToWhite
	
	initialSideToMove := #white!

setOptionFromFenParser: aChessFenParser

	initialSideToMove := aChessFenParser sideToMove.

	whiteCastleStatus setQueenCastle: aChessFenParser isEnabledWhiteQueenSideCastle kingCastle: aChessFenParser isEnabledWhiteKingSideCastle.
	
	blackCastleStatus setQueenCastle: aChessFenParser isEnabledBlackQueenSideCastle kingCastle: aChessFenParser isEnabledBlackKingSideCastle.


!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString
	| parser |

	dateTime := TimeStamp current.
	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	"moves := ChessMoveList newOn: self."
	moves := ChessMoveTreeList newOn: self.
	dateTime := TimeStamp current.

	initialSideToMove := #white.

	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self.

	initialFenPosition := fenString ifNil: [self initialFenStringPosition] ifNotNil: [fenString].
	parser := ChessFenParser newOn: aSystemRoot fenString: (fenString ifNil: [initialFenPosition]).
	self setOptionFromFenParser: parser.
!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer pgnString: pgnString
	| parser |

	dateTime := TimeStamp current.
	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	"moves := ChessMoveList newOn: self."
	moves := ChessMoveTreeList newOn: self.
	dateTime := TimeStamp current.

	initialSideToMove := #white.

	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self.

	initialFenPosition := self initialFenStringPosition.
	parser := ChessPgnParser newOn: aSystemRoot pgnString: pgnString.
	parser buildGameFor: self
!

undoLastMoveOn: aChessboard

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
initialFenStringPosition!private! !
initialSideToMove!public! !
isCorrectSideToMove:on:!public! !
lastMoveIsBlackEnPassantEnabledFrom:to:!en passant!public! !
lastMoveIsWhiteEnPassantEnabledFrom:to:!en passant!public! !
lastSideToMoveOn:!public! !
moveFrom:to:on:!moves!public! !
movesListDo:!public! !
newInitialChessboard!public! !
nextSideToMoveOn:!public! !
nextSideToMoveOn:isBlackDo:!public! !
nextSideToMoveOn:isWhiteDo:!public! !
performMove:on:!moves!public! !
redoNextMoveOn:!public! !
setInitialMoveToBlack!public! !
setInitialMoveToWhite!public! !
setOptionFromFenParser:!parser-fen!public! !
setRoot:whitePlayer:blackPlayer:fenString:!private! !
setRoot:whitePlayer:blackPlayer:pgnString:!private! !
undoLastMoveOn:!public! !
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

