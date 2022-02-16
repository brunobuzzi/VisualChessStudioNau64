"Filed out from Dolphin Smallalk"!

ChessOrientation subclass: #ChessEastOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEastOrientation guid: (GUID fromString: '{11cd8702-4134-4e7c-8ccc-af0cddf1c004}')!
ChessEastOrientation comment: ''!
!ChessEastOrientation categoriesForClass!Unclassified! !
!ChessEastOrientation methodsFor!

fileSign
	^1!

rankSign
	self shouldNotImplement!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtEastDo: aBlock! !
!ChessEastOrientation categoriesForMethods!
fileSign!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

