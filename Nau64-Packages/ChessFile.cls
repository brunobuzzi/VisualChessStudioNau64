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
	| nextCharacterValue nextCharacter |
	nextCharacterValue := (name at: 1) asciiValue + 1.
	nextCharacter := Character asciiValue: nextCharacterValue.
	^self class getFile: nextCharacter asAnsiString!

next: anInteger
	| nextCharacterValue nextCharacter |
	nextCharacterValue := (name at: 1) asciiValue + anInteger.
	nextCharacter := Character asciiValue: nextCharacterValue.
	^self class getFile: nextCharacter asAnsiString!

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

setFile: anInteger

	name := anInteger! !
!ChessFile categoriesForMethods!
isEqualTo:!public! !
isGreaterThan:!public! !
next!public! !
next:!public! !
number!public! !
printName!public! !
printOn:!public! !
setFile:!private! !
!

!ChessFile class methodsFor!

a
	^self new setFile: 'a'!

b
	^self new setFile: 'b'!

c
	^self new setFile: 'c'!

d
	^self new setFile: 'd'!

e
	^self new setFile: 'e'!

f
	^self new setFile: 'f'!

g
	^self new setFile: 'g'!

getFile: aString

	AllChessFiles ifNil: [self initializeFiles].

	^AllChessFiles at: aString ifAbsent: [self error: 'No Chess File [', aString , ']']!

h
	^self new setFile: 'h'!

icon

	^String icon!

initializeFiles

	AllChessFiles := Dictionary new.
	AllChessFiles 
		at: 'a' put: self a;
		at: 'b' put: self b;
		at: 'c' put: self c;
		at: 'd' put: self d;
		at: 'e' put: self e;
		at: 'f' put: self f;
		at: 'g' put: self g;
		at: 'h' put: self h.
! !
!ChessFile class categoriesForMethods!
a!public! !
b!public! !
c!public! !
d!public! !
e!public! !
f!public! !
g!public! !
getFile:!public! !
h!public! !
icon!public! !
initializeFiles!public! !
!

