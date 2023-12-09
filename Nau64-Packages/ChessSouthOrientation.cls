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

isOpposing: aChessOrientation

	aChessOrientation ifNil: [^false].
	^aChessOrientation isNorth or: [aChessOrientation isSouth]!

isSouth
	^true!

newFor: aChessPiece orientation: aChessOrientation

	^self vectorClass newAtSouthFor: aChessPiece!

orientationName

	^'South'!

rankSign
	^-1!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtSouthDo: aBlock! !
!ChessSouthOrientation categoriesForMethods!
fileSign!public! !
isOpposing:!public!testing! !
isSouth!public!testing! !
newFor:orientation:!public!vector creation! !
orientationName!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

!ChessSouthOrientation class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 9660) asUtf16String fontName: 'Malgun Gothic'! !
!ChessSouthOrientation class categoriesForMethods!
icon!public! !
!

