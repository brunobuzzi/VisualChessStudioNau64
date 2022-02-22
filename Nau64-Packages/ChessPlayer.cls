"Filed out from Dolphin Smallalk"!

Object subclass: #ChessPlayer
	instanceVariableNames: 'name surname currentElo games'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPlayer guid: (GUID fromString: '{24fa3928-cb3f-4dca-9eb7-0c76ec327771}')!
ChessPlayer comment: ''!
!ChessPlayer categoriesForClass!Unclassified! !
!ChessPlayer methodsFor!

setName: nameString surname: surnameString elo: anInteger

	name := nameString.
	surname := surnameString.
	currentElo := anInteger.
	games := OrderedCollection new.! !
!ChessPlayer categoriesForMethods!
setName:surname:elo:!private! !
!

!ChessPlayer class methodsFor!

icon

	^Icon fromId: 'MethodProtocol.ico'!

newNamed: nameString surname: surnameString elo: anInteger

	^self new setName: name surname: surnameString elo: anInteger! !
!ChessPlayer class categoriesForMethods!
icon!public! !
newNamed:surname:elo:!public! !
!

