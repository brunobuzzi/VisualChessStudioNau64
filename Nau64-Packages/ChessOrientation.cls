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

newFor: aChessPiece orientation: aChessOrientation

	self subclassResponsibility!

rankSign
	self subclassResponsibility!

validSquaresOn: aSquareDictionary do: aBlock

	self subclassResponsibility!

vectorClass

	^ChessOrientationVector! !
!ChessOrientation categoriesForMethods!
fileSign!public! !
newFor:orientation:!public!vector creation! !
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

