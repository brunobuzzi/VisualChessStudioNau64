"Filed out from Dolphin Smallalk"!

Object subclass: #ChessCastleStatus
	instanceVariableNames: 'game isQueenSideClastleEnabled isKingSideClastleEnabled'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessCastleStatus guid: (GUID fromString: '{366fd97f-f39f-440c-85d9-e6b799e56cd2}')!
ChessCastleStatus comment: ''!
!ChessCastleStatus categoriesForClass!Unclassified! !
!ChessCastleStatus methodsFor!

disableCastle

	self disableKingSideCastle.
	self disableQueenSideCastle.!

disableKingSideCastle

	isKingSideClastleEnabled := false!

disableQueenSideCastle

	isQueenSideClastleEnabled := false!

enableKingSideCastle

	isKingSideClastleEnabled := true!

enableQueenSideCastle

	isQueenSideClastleEnabled := true!

ifKindSideCastleNotEnabled: aNiladicValuable 

	isKingSideClastleEnabled ifFalse: aNiladicValuable!

ifQueenSideCastleNotEnabled: aNiladicValuable 

	isQueenSideClastleEnabled ifFalse: aNiladicValuable!

ifWhiteCastleNotEnabled: aNiladicValuable 
	^Error notYetImplemented!

setBlackCastleOptionsFromFenParser: aChessFenParser

	aChessFenParser isEnabledBlackKingSideCastle 
		ifTrue: [self enableKingSideCastle]
		ifFalse: [self disableKingSideCastle].

	aChessFenParser isEnabledBlackQueenSideCastle 
		ifTrue: [self enableQueenSideCastle ] 
		ifFalse: [self disableQueenSideCastle].!

setChessGame: aChessGame

	game := aChessGame.
	isKingSideClastleEnabled := true.
	isQueenSideClastleEnabled := true.!

setWhiteCastleOptionsFromFenParser: aChessFenParser

	aChessFenParser isEnabledWhiteKingSideCastle 
		ifTrue: [self enableKingSideCastle]
		ifFalse: [self disableKingSideCastle].

	aChessFenParser isEnabledWhiteQueenSideCastle 
		ifTrue: [self enableQueenSideCastle ] 
		ifFalse: [self disableQueenSideCastle].! !
!ChessCastleStatus categoriesForMethods!
disableCastle!public! !
disableKingSideCastle!public! !
disableQueenSideCastle!public! !
enableKingSideCastle!public! !
enableQueenSideCastle!public! !
ifKindSideCastleNotEnabled:!public! !
ifQueenSideCastleNotEnabled:!public! !
ifWhiteCastleNotEnabled:!public! !
setBlackCastleOptionsFromFenParser:!public! !
setChessGame:!private! !
setWhiteCastleOptionsFromFenParser:!public! !
!

!ChessCastleStatus class methodsFor!

newOn: aChessGame

	^self new setChessGame: aChessGame! !
!ChessCastleStatus class categoriesForMethods!
newOn:!public! !
!

