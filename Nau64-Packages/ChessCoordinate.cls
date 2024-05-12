"Filed out from Dolphin Smallalk"!

Object subclass: #ChessCoordinate
	instanceVariableNames: 'systemRoot name'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessCoordinate guid: (GUID fromString: '{68d6b87e-2461-45c8-92dd-e23ff0dd179f}')!
ChessCoordinate comment: ''!
!ChessCoordinate categoriesForClass!Kernel-Objects! !
!ChessCoordinate methodsFor!

name
	^name!

next
	^self next: 1!

next: anInteger

	^self next: anInteger ifAbsent: [self error: 'No next Chess File/Rank']!

next: anInteger ifAbsent: aBlock
	self subclassResponsibility!

number
	self subclassResponsibility!

previous
	^self previous: 1!

previous: anInteger
	
	^self previous: anInteger ifAbsent: [self error: 'No next Chess File/Rank']!

previous: anInteger ifAbsent: aBlock
	self subclassResponsibility!

printName
	self subclassResponsibility! !
!ChessCoordinate categoriesForMethods!
name!public! !
next!public! !
next:!public! !
next:ifAbsent:!public! !
number!public! !
previous!public! !
previous:!public! !
previous:ifAbsent:!public! !
printName!public! !
!

!ChessCoordinate class methodsFor!

icon

	^Icon fromId: 'TextEdit.ico'! !
!ChessCoordinate class categoriesForMethods!
icon!public! !
!

