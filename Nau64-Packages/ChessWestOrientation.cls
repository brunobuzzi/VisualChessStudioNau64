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

newFor: aChessPiece orientation: aChessOrientation

	^self vectorClass newAtWestFor: aChessPiece!

rankSign
	self shouldNotImplement!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtWestDo: aBlock! !
!ChessWestOrientation categoriesForMethods!
fileSign!public! !
newFor:orientation:!public!vector creation! !
rankSign!public! !
validSquaresOn:do:!public! !
!

!ChessWestOrientation class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 9664) asUtf16String fontName: 'Malgun Gothic'! !
!ChessWestOrientation class categoriesForMethods!
icon!public! !
!

