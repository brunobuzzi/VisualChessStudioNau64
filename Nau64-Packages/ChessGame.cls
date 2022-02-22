"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGame
	instanceVariableNames: 'date whitePlayer blackPlayer moves'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGame guid: (GUID fromString: '{cab5dfb3-cb33-47c8-828c-f22ddfe10c20}')!
ChessGame comment: ''!
!ChessGame categoriesForClass!Unclassified! !
!ChessGame methodsFor!

setWhiteChessPlayer: whiteChessPlayer black: blackChessPlayer

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	moves := ChessMoveList newOn: self.! !
!ChessGame categoriesForMethods!
setWhiteChessPlayer:black:!private! !
!

!ChessGame class methodsFor!

icon

	^Icon fromId: 'Interactor.ico'!

newWithWhite: whiteChessPlayer black: blackChessPlayer

	^self setWhiteChessPlayer: whiteChessPlayer black: blackChessPlayer! !
!ChessGame class categoriesForMethods!
icon!public! !
newWithWhite:black:!private! !
!

