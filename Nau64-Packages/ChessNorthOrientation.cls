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

isNorth
	^true!

isOpposing: aChessOrientation

	aChessOrientation ifNil: [^false].
	^aChessOrientation isNorth or: [aChessOrientation isSouth]!

newFor: aChessPiece orientation: aChessOrientation

	^self vectorClass newAtNorthFor: aChessPiece!

orientationName

	^'North'!

rankSign
	^1!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtNorthDo: aBlock! !
!ChessNorthOrientation categoriesForMethods!
fileSign!public! !
isNorth!public!testing! !
isOpposing:!public!testing! !
newFor:orientation:!public!vector creation! !
orientationName!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

!ChessNorthOrientation class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 9650) asUtf16String fontName: 'Malgun Gothic'! !
!ChessNorthOrientation class categoriesForMethods!
icon!public! !
!

