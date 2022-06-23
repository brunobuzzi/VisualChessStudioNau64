"Filed out from Dolphin Smallalk"!

ChessOrientation subclass: #ChessSouthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSouthOrientation guid: (GUID fromString: '{33651111-0dd3-40d1-958d-746c6e1d4ef3}')!
ChessSouthOrientation comment: ''!
!ChessSouthOrientation categoriesForClass!Unclassified! !
!ChessSouthOrientation methodsFor!

fileSign
	self shouldNotImplement!

rankSign
	^-1!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtSouthDo: aBlock! !
!ChessSouthOrientation categoriesForMethods!
fileSign!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

!ChessSouthOrientation class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 9660) asUtf16String fontName: 'Malgun Gothic'! !
!ChessSouthOrientation class categoriesForMethods!
icon!public! !
!

