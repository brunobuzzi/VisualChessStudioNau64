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

fenString

	^self isBlack ifTrue: ['k'] ifFalse: ['K']!

isCheckMatedOn: aChessboard

	^self newRule isCheckMatedOn: aChessboard!

isKing

	^true!

pieceCode
	^'k'! !
!King categoriesForMethods!
fenString!public! !
isCheckMatedOn:!public! !
isKing!public!testing! !
pieceCode!public! !
!

!King class methodsFor!

filePrefix
	" k - king "

	^'k'! !
!King class categoriesForMethods!
filePrefix!public! !
!

