"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #King
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
King guid: (GUID fromString: '{dd0a5697-2022-4ef0-859c-3eaf90c9e114}')!
King comment: ''!
!King categoriesForClass!Kernel-Objects! !
!King methodsFor!

blackCodePoint

	^9818
!

fenString

	^self isBlack ifTrue: ['k'] ifFalse: ['K']!

isCheckMatedOn: aChessboard
	^self newMovementEngine isCheckMatedOn: aChessboard!

isKing

	^true!

whiteCodePoint

	^9812! !
!King categoriesForMethods!
blackCodePoint!public!unicode! !
fenString!public! !
isCheckMatedOn:!public! !
isKing!public!testing! !
whiteCodePoint!public!unicode! !
!

!King class methodsFor!

filePrefix
	" k - king "

	^'k'!

pieceCode
	^'k'! !
!King class categoriesForMethods!
filePrefix!public! !
pieceCode!public! !
!

