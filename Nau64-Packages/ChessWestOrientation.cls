"Filed out from Dolphin Smallalk"!

ChessOrientation subclass: #ChessWestOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessWestOrientation guid: (GUID fromString: '{b04873db-3204-4f0e-9aa3-15e9f5fdcee4}')!
ChessWestOrientation comment: ''!
!ChessWestOrientation categoriesForClass!Unclassified! !
!ChessWestOrientation methodsFor!

fileSign
	^-1!

rankSign
	self shouldNotImplement!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtWestDo: aBlock! !
!ChessWestOrientation categoriesForMethods!
fileSign!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

