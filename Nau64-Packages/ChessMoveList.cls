"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMoveList
	instanceVariableNames: 'game movesCollection lastMove hasWhiteCastled hasBlackCastled'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMoveList guid: (GUID fromString: '{63fc429f-63c1-437a-9e02-2b10719c0fc8}')!
ChessMoveList comment: ''!
!ChessMoveList categoriesForClass!Unclassified! !
!ChessMoveList methodsFor!

setChessGame: aChessGame

	game := aChessGame.
	movesCollection := OrderedCollection new.
	hasWhiteCastled := false.
	hasBlackCastled := false.! !
!ChessMoveList categoriesForMethods!
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

