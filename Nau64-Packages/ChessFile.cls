"Filed out from Dolphin Smallalk"!

ChessCoordinate subclass: #ChessFile
	instanceVariableNames: ''
	classVariableNames: 'AllChessFiles'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessFile guid: (GUID fromString: '{fea45525-e891-4a16-9316-5c7e2979db33}')!
ChessFile comment: ''!
!ChessFile categoriesForClass!Kernel-Objects! !
!ChessFile methodsFor!

isEqualTo: anInteger

	^self number = anInteger!

isGreaterThan: anInteger

	^self number > anInteger!

next
	^self next: 1!

next: anInteger
	| nextCharacterValue nextCharacter |
	nextCharacterValue := (name at: 1) asciiValue + anInteger.
	nextCharacter := Character asciiValue: nextCharacterValue.
	^systemRoot getFile: nextCharacter asAnsiString!

number

	name = 'a' ifTrue: [^1].
	name = 'b' ifTrue: [^2].
	name = 'c' ifTrue: [^3].
	name = 'd' ifTrue: [^4].
	name = 'e' ifTrue: [^5].
	name = 'f' ifTrue: [^6].
	name = 'g' ifTrue: [^7].
	name = 'h' ifTrue: [^8].

	self error: 'No File named [', name,']'
!

printName
	^name!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', name, ']'!

setFile: anInteger root: aSystemRoot

	systemRoot := aSystemRoot.
	name := anInteger! !
!ChessFile categoriesForMethods!
isEqualTo:!public! !
isGreaterThan:!public! !
next!public! !
next:!public! !
number!public! !
printName!public! !
printOn:!public! !
setFile:root:!private! !
!

!ChessFile class methodsFor!

getFile: aString

	^AllChessFiles at: aString ifAbsent: [self error: 'No Chess File [', aString , ']']!

icon

	^String icon!

initializeFiles
	AllChessFiles := Dictionary new.
	AllChessFiles
		at: 'a' put: (self newAon: nil);
		at: 'b' put: (self newBon: self);
		at: 'c' put: (self newCon: self);
		at: 'd' put: (self newDon: self);
		at: 'e' put: (self newEon: self);
		at: 'f' put: (self newFon: self);
		at: 'g' put: (self newGon: self);
		at: 'h' put: (self newHon: self)!

newAon: anObject
	^self new setFile: 'a' root: anObject!

newBon: anObject
	^self new setFile: 'b' root: anObject!

newCon: anObject
	^self new setFile: 'c' root: anObject!

newDon: anObject
	^self new setFile: 'd' root: anObject!

newEon: anObject
	^self new setFile: 'e' root: anObject!

newFon: anObject
	^self new setFile: 'f' root: anObject!

newGon: anObject
	^self new setFile: 'g' root: anObject!

newHon: anObject
	^self new setFile: 'h' root: anObject! !
!ChessFile class categoriesForMethods!
getFile:!public! !
icon!public! !
initializeFiles!public! !
newAon:!public! !
newBon:!public! !
newCon:!public! !
newDon:!public! !
newEon:!public! !
newFon:!public! !
newGon:!public! !
newHon:!public! !
!

