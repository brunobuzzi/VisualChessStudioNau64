"Filed out from Dolphin Smallalk"!

ChessCoordinate subclass: #ChessRank
	instanceVariableNames: ''
	classVariableNames: 'AllChessRanks'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessRank guid: (GUID fromString: '{2b524b49-8329-40c4-b020-a385d0ec7efd}')!
ChessRank comment: ''!
!ChessRank categoriesForClass!Kernel-Objects! !
!ChessRank methodsFor!

isEqualTo: anInteger

	^self number = anInteger!

isGreaterThan: anInteger

	^self number > anInteger!

next: anInteger ifAbsent: aBlock

	^systemRoot getRank: name + anInteger ifAbsent: aBlock!

number

	^name!

previous: anInteger ifAbsent: aBlock

	^systemRoot getRank: name - anInteger ifAbsent: aBlock!

printName
	^name printString!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', name printString , ']'!

setRank: anInteger root: aSystemRoot

	systemRoot := aSystemRoot.
	name := anInteger ! !
!ChessRank categoriesForMethods!
isEqualTo:!public! !
isGreaterThan:!public! !
next:ifAbsent:!public! !
number!public! !
previous:ifAbsent:!public! !
printName!public! !
printOn:!public! !
setRank:root:!private! !
!

!ChessRank class methodsFor!

getRank: anInteger

	^AllChessRanks at: anInteger ifAbsent: [self error: 'No Chess Rank [', anInteger printString, ']']!

icon

	^Integer icon!

initializeRanks
	AllChessRanks := Dictionary new.
	AllChessRanks
		at: 1 put: (self new1On: self);
		at: 2 put: (self new2On: self);
		at: 3 put: (self new3On: self);
		at: 4 put: (self new4On: self);
		at: 5 put: (self new5On: self);
		at: 6 put: (self new6On: self);
		at: 7 put: (self new7On: self);
		at: 8 put: (self new8On: self)!

new1On: anObject
	^self new setRank: 1 root: anObject!

new2On: anObject
	^self new setRank: 2 root: anObject!

new3On: anObject
	^self new setRank: 3 root: anObject!

new4On: anObject
	^self new setRank: 4 root: anObject!

new5On: anObject
	^self new setRank: 5 root: anObject!

new6On: anObject
	^self new setRank: 6 root: anObject!

new7On: anObject
	^self new setRank: 7 root: anObject!

new8On: anObject
	^self new setRank: 8 root: anObject! !
!ChessRank class categoriesForMethods!
getRank:!public! !
icon!public! !
initializeRanks!public! !
new1On:!public! !
new2On:!public! !
new3On:!public! !
new4On:!public! !
new5On:!public! !
new6On:!public! !
new7On:!public! !
new8On:!public! !
!

