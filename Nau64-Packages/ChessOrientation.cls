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

isEast
	^false!

isNorth
	^false!

isOpposing: aChessOrientation

	self subclassResponsibility!

isSouth
	^false!

isWest
	^false!

newFor: aChessPiece orientation: aChessOrientation

	self subclassResponsibility!

orientationName

	self subclassResponsibility!

pinCompatibleOrientations

	self subclassResponsibility!

rankSign
	self subclassResponsibility!

validSquaresOn: aSquareDictionary do: aBlock

	self subclassResponsibility!

vectorClass

	^ChessOrientationVector! !
!ChessOrientation categoriesForMethods!
fileSign!public! !
isEast!public!testing! !
isNorth!public!testing! !
isOpposing:!public!testing! !
isSouth!public!testing! !
isWest!public!testing! !
newFor:orientation:!public!vector creation! !
orientationName!public! !
pinCompatibleOrientations!public! !
rankSign!public! !
validSquaresOn:do:!public! !
vectorClass!public!vector creation! !
!

!ChessOrientation class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 8862) asUtf16String fontName: 'Malgun Gothic'! !
!ChessOrientation class categoriesForMethods!
icon!public! !
!

