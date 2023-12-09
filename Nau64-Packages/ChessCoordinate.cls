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

next: anInteger
	self subclassResponsibility!

number
	self subclassResponsibility!

printName
	self subclassResponsibility! !
!ChessCoordinate categoriesForMethods!
name!public! !
next:!public! !
number!public! !
printName!public! !
!

!ChessCoordinate class methodsFor!

icon

	^Icon fromId: 'TextEdit.ico'! !
!ChessCoordinate class categoriesForMethods!
icon!public! !
!

