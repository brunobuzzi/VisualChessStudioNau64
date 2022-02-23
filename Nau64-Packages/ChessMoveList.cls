"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMoveList
	instanceVariableNames: 'game movesCollection lastMove'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMoveList guid: (GUID fromString: '{63fc429f-63c1-437a-9e02-2b10719c0fc8}')!
ChessMoveList comment: ''!
!ChessMoveList categoriesForClass!Unclassified! !
!ChessMoveList methodsFor!

annotateMove: aChessMove

	movesCollection add: aChessMove.

	lastMove := aChessMove.!

lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^lastMove isBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^lastMove isWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

nextSideToMoveOn: aChessboard

	^(lastMove isBlackOn: aChessboard) ifTrue: [#white] ifFalse: [#black]!

setChessGame: aChessGame
	game := aChessGame.
	movesCollection := OrderedCollection new.
! !
!ChessMoveList categoriesForMethods!
annotateMove:!public! !
lastMoveIsBlackEnPassantEnablerFrom:to:!public! !
lastMoveIsWhiteEnPassantEnablerFrom:to:!public! !
nextSideToMoveOn:!public! !
setChessGame:!private! !
!

!ChessMoveList class methodsFor!

icon

	^Array icon!

newOn: aChessGame

	^self new setChessGame: aChessGame! !
!ChessMoveList class categoriesForMethods!
icon!public! !
newOn:!public! !
!

