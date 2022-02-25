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

annotateMove: aChessMove on: aChessboard

	aChessMove setCategoriesFrom:  aChessboard.

	lastMove ifNotNil: [
		(self lastMoveIsBlackEnPassantEnablerFrom: aChessMove from to: aChessMove to) ifTrue: [aChessMove addEnPassantCategory].
		(self lastMoveIsWhiteEnPassantEnablerFrom: aChessMove from to: aChessMove to) ifTrue: [aChessMove addEnPassantCategory].
	].
	
	movesCollection add: aChessMove.

	lastMove := aChessMove.!

isEmpty

	^movesCollection isEmpty!

lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^lastMove isBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^lastMove isWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastSideToMoveOn: aChessboard

	^(lastMove isBlackOn: aChessboard) ifTrue: [#black] ifFalse: [#white]!

nextSideToMoveOn: aChessboard

	^(lastMove isBlackOn: aChessboard) ifTrue: [#white] ifFalse: [#black]!

setChessGame: aChessGame
	game := aChessGame.
	movesCollection := OrderedCollection new.
!

undoLastMove
	| moveToRemove |
self halt.
	moveToRemove := lastMove.
	moveToRemove undo.
	movesCollection removeLast.
	movesCollection notEmpty ifTrue: [lastMove := movesCollection last].! !
!ChessMoveList categoriesForMethods!
annotateMove:on:!public! !
isEmpty!public! !
lastMoveIsBlackEnPassantEnablerFrom:to:!public! !
lastMoveIsWhiteEnPassantEnablerFrom:to:!public! !
lastSideToMoveOn:!public! !
nextSideToMoveOn:!public! !
setChessGame:!private! !
undoLastMove!public! !
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

