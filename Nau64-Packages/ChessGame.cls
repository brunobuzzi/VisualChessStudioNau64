"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGame
	instanceVariableNames: 'systemRoot dateTime whitePlayer blackPlayer moves initialPosition isWhiteCastleEnabled isBlackCastleEnabled'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGame guid: (GUID fromString: '{cab5dfb3-cb33-47c8-828c-f22ddfe10c20}')!
ChessGame comment: ''!
!ChessGame categoriesForClass!Unclassified! !
!ChessGame methodsFor!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString

	systemRoot := aSystemRoot.
	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	moves := ChessMoveList newOn: self.
	dateTime := TimeStamp current.
	initialPosition :=  fenString.

	isWhiteCastleEnabled := true.
	isBlackCastleEnabled := true.! !
!ChessGame categoriesForMethods!
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

