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

next

	^self class getRank: name + 1!

next: anInteger

	^self class getRank: name + anInteger!

number

	^name!

printName
	^name printString!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', name printString , ']'!

setRank: anInteger

	name := anInteger ! !
!ChessRank categoriesForMethods!
isEqualTo:!public! !
isGreaterThan:!public! !
next!public! !
next:!public! !
number!public! !
printName!public! !
printOn:!public! !
setRank:!private! !
!

!ChessRank class methodsFor!

eight

	^self new setRank: 8!

five

	^self new setRank: 5!

four

	^self new setRank: 4!

getRank: anInteger

	^AllChessRanks at: anInteger ifAbsent: [self error: 'No Chess Rank [', anInteger printString, ']']!

icon

	^Integer icon!

initializeRanks

	AllChessRanks := Dictionary new.
	AllChessRanks 
		at: 1 put: self one;
		at: 2 put: self two;
		at: 3 put: self three;
		at: 4 put: self four;
		at: 5 put: self five;
		at: 6 put: self six;
		at: 7 put: self seven;
		at: 8 put: self eight.
!

one

	^self new setRank: 1!

seven

	^self new setRank: 7!

six

	^self new setRank: 6!

three

	^self new setRank: 3!

two

	^self new setRank: 2! !
!ChessRank class categoriesForMethods!
eight!public! !
five!public! !
four!public! !
getRank:!public! !
icon!public! !
initializeRanks!public! !
one!public! !
seven!public! !
six!public! !
three!public! !
two!public! !
!

