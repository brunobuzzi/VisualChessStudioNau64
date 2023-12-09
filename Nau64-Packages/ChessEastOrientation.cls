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

isEast
	^true!

isOpposing: aChessOrientation

	aChessOrientation ifNil: [^false].
	^aChessOrientation isEast or: [aChessOrientation isWest]!

newFor: aChessPiece orientation: aChessOrientation

	^self vectorClass newAtEastFor: aChessPiece!

orientationName

	^'East'!

rankSign
	self shouldNotImplement!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtEastDo: aBlock! !
!ChessEastOrientation categoriesForMethods!
fileSign!public! !
isEast!public!testing! !
isOpposing:!public!testing! !
newFor:orientation:!public!vector creation! !
orientationName!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

!ChessEastOrientation class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 9654) asUtf16String fontName: 'Malgun Gothic'! !
!ChessEastOrientation class categoriesForMethods!
icon!public! !
!

