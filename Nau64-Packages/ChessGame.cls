"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGame
	instanceVariableNames: 'systemRoot dateTime whitePlayer blackPlayer moves initialFenPosition initialSideToMove isWhiteCastleEnabled isBlackCastleEnabled'
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

	aChessboard movePieceFromCoordiante: originSymbolCoordiante to: targetSymbolCoordinate!

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

	isWhiteCastleEnabled := true.
	isBlackCastleEnabled := true! !
!ChessGame categoriesForMethods!
annotateAndMovePieceFrom:to:on:!public! !
initialSideToMove!public! !
lastMoveIsBlackEnPassantEnablerFrom:to:!public! !
lastMoveIsWhiteEnPassantEnablerFrom:to:!public! !
nextSideToMoveOn:!public! !
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

