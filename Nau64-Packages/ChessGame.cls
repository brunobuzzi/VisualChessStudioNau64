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

annotateAndMovePieceFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard
	| move |

	move := ChessMove newOn: moves from: originSymbolCoordiante to: targetSymbolCoordinate.

	moves annotateMove: move on: aChessboard.

	"check if a Rook or King has been moved --> disable castle"
	
	move performPieceSwitchFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard withPostActionOn: self.
!

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

initialSideToMove

	initialFenPosition ifNil: [^#white].

	^initialSideToMove!

isCorrectSideToMove: aChessPiece on: aChessboard

	^(self nextSideToMoveOn: aChessboard) = aChessPiece sideName!

lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastSideToMoveOn: aChessboard

	moves isEmpty ifTrue: [^self error: 'No side has moved'].

	^moves lastSideToMoveOn: aChessboard
!

nextSideToMoveOn: aChessboard

	(moves isEmpty and: [initialFenPosition notNil and:[initialFenPosition notEmpty]]) ifTrue: [^initialSideToMove].

	(moves isEmpty and: [initialFenPosition isNil]) ifTrue: [^#white].

	^moves nextSideToMoveOn: aChessboard
!

redoNextMoveOn: aChessboard 

	moves redoNextMoveOn: aChessboard !

setInitialMoveToBlack
	initialFenPosition ifNil: [self error: 'White always move first when there is NO position setup'].
	initialSideToMove := #black!

setInitialMoveToWhite
	initialFenPosition ifNil: [self error: 'White always move first when there is NO position setup'].
	initialSideToMove := #white!

setOptionFromFenParser: aChessFenParser

	initialSideToMove := aChessFenParser sideToMove.

	whiteCastleStatus setQueenCastle: aChessFenParser isEnabledWhiteQueenSideCastle kingCastle: aChessFenParser isEnabledWhiteKingSideCastle.
	
	blackCastleStatus setQueenCastle: aChessFenParser isEnabledBlackQueenSideCastle kingCastle: aChessFenParser isEnabledBlackKingSideCastle.


!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString

	dateTime := TimeStamp current.
	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	"moves := ChessMoveList newOn: self."
	moves := ChessMoveTreeList newOn: self.
	dateTime := TimeStamp current.

	initialSideToMove := #white.
	initialFenPosition := fenString.

	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self.
!

undoLastMoveOn: aChessboard

	moves undoLastMoveOn: aChessboard! !
!ChessGame categoriesForMethods!
annotateAndMovePieceFrom:to:on:!public! !
disableBlackCastle!castle!public! !
disableBlackCastleForPieceMovedFrom:on:!castle!public! !
disableCastleForPieceMovedFrom:on:!castle!public! !
disableWhiteCastle!castle!public! !
disableWhiteCastleForPieceMovedFrom:on:!castle!public! !
ifBlackKindSideCastleNotEnabled:!castle!public! !
ifBlackQueenSideCastleNotEnabled:!castle!public! !
ifWhiteKindSideCastleNotEnabled:!castle!public! !
ifWhiteQueenSideCastleNotEnabled:!castle!public! !
initialSideToMove!public! !
isCorrectSideToMove:on:!public! !
lastMoveIsBlackEnPassantEnablerFrom:to:!en passant!public! !
lastMoveIsWhiteEnPassantEnablerFrom:to:!en passant!public! !
lastSideToMoveOn:!public! !
nextSideToMoveOn:!public! !
redoNextMoveOn:!public! !
setInitialMoveToBlack!public! !
setInitialMoveToWhite!public! !
setOptionFromFenParser:!parser-fen!public! !
setRoot:whitePlayer:blackPlayer:fenString:!private! !
undoLastMoveOn:!public! !
!

!ChessGame class methodsFor!

icon

	^Icon fromId: 'Interactor.ico'!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer

	^self newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: nil!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString

	^self new setRoot:  aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString! !
!ChessGame class categoriesForMethods!
icon!public! !
newOn:whitePlayer:blackPlayer:!public! !
newOn:whitePlayer:blackPlayer:fenString:!public! !
!

