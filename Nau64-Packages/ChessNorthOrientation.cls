"Filed out from Dolphin Smallalk"!

ChessOrientation subclass: #ChessNorthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessNorthOrientation guid: (GUID fromString: '{c649c585-2d07-4ce6-849b-4fa1bf17f8e3}')!
ChessNorthOrientation comment: ''!
!ChessNorthOrientation categoriesForClass!Unclassified! !
!ChessNorthOrientation methodsFor!

fileSign
	self shouldNotImplement!

rankSign
	^1!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtNorthDo: aBlock! !
!ChessNorthOrientation categoriesForMethods!
fileSign!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

