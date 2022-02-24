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

	move setCategoriesFrom: aChessboard.

	moves annotateMove: move.

	move isEnPassant ifTrue: [aChessboard removeEnPassantPawn: targetSymbolCoordinate].

	move isCastle
	ifFalse: [aChessboard movePieceFromCoordiante: originSymbolCoordiante to: targetSymbolCoordinate]
	ifTrue: [self performCastleMove: move on: aChessboard].

	self halt. "check if a Rook or King has been moved --> disable castle"
	!

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

lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^moves lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

nextSideToMoveOn: aChessboard

	(moves isEmpty and: [initialFenPosition notEmpty]) ifTrue: [^initialSideToMove].

	(moves isEmpty and: [initialFenPosition isEmpty]) ifTrue: [^#white].

	^moves nextSideToMoveOn: aChessboard
!

performBlackCastleMove: aChessMove on: aChessboard 

	aChessMove performBlackCastleOn: aChessboard.

	blackCastleStatus disableCastle.!

performCastleMove: aChessMove on: aChessboard 

	(aChessMove isBlackCurrentSideMovingOn: aChessboard) 
	ifTrue: [self performBlackCastleMove: aChessMove on: aChessboard] 
	ifFalse: [self performWhiteCastleMove: aChessMove on: aChessboard]!

performWhiteCastleMove: aChessMove on: aChessboard 

	aChessMove performWhiteCastleOn: aChessboard.

	whiteCastleStatus disableCastle.!

setInitialMoveToBlack
	initialFenPosition ifNil: [self error: 'White always move first when there is NO position setup'].
	initialSideToMove := #black!

setInitialMoveToWhite
	initialFenPosition ifNil: [self error: 'White always move first when there is NO position setup'].
	initialSideToMove := #white!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString

	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	moves := ChessMoveList newOn: self.
	dateTime := TimeStamp current.

	initialFenPosition := fenString.

	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self.
! !
!ChessGame categoriesForMethods!
annotateAndMovePieceFrom:to:on:!public! !
ifBlackKindSideCastleNotEnabled:!public! !
ifBlackQueenSideCastleNotEnabled:!public! !
ifWhiteKindSideCastleNotEnabled:!public! !
ifWhiteQueenSideCastleNotEnabled:!public! !
initialSideToMove!public! !
lastMoveIsBlackEnPassantEnablerFrom:to:!public! !
lastMoveIsWhiteEnPassantEnablerFrom:to:!public! !
nextSideToMoveOn:!public! !
performBlackCastleMove:on:!public! !
performCastleMove:on:!public! !
performWhiteCastleMove:on:!public! !
setInitialMoveToBlack!public! !
setInitialMoveToWhite!public! !
setRoot:whitePlayer:blackPlayer:fenString:!private! !
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

