"Filed out from Dolphin Smallalk"!

Object subclass: #ChessOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessOrientation guid: (GUID fromString: '{46375996-6e3b-4930-8715-16ac898a374a}')!
ChessOrientation comment: ''!
!ChessOrientation categoriesForClass!Unclassified! !
!ChessOrientation methodsFor!

fileSign
	self subclassResponsibility!

rankSign
	^1!

validSquaresOn: aSquareDictionary do: aBlock

	self subclassResponsibility! !
!ChessOrientation categoriesForMethods!
fileSign!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

