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

isOpposing: aChessOrientation

	aChessOrientation ifNil: [^false].
	^aChessOrientation isEast or: [aChessOrientation isWest]!

isWest
	^true!

newFor: aChessPiece orientation: aChessOrientation

	^self vectorClass newAtWestFor: aChessPiece!

orientationName

	^'West'!

rankSign
	self shouldNotImplement!

validSquaresOn: aSquareDictionary do: aBlock

	aSquareDictionary squaresAtWestDo: aBlock! !
!ChessWestOrientation categoriesForMethods!
fileSign!public! !
isOpposing:!public!testing! !
isWest!public!testing! !
newFor:orientation:!public!vector creation! !
orientationName!public! !
rankSign!public! !
validSquaresOn:do:!public! !
!

!ChessWestOrientation class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 9664) asUtf16String fontName: 'Malgun Gothic'! !
!ChessWestOrientation class categoriesForMethods!
icon!public! !
!

