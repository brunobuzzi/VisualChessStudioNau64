"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #Queen
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Queen guid: (GUID fromString: '{4806ae75-a285-4b98-b234-53c0bb8a8cfc}')!
Queen comment: ''!
!Queen categoriesForClass!Kernel-Objects! !
!Queen methodsFor!

blackCodePoint

	^9819!

fenString

	^self isBlack ifTrue: ['q'] ifFalse: ['Q']!

isQueen

	^true!

isSlidingPiece

	^true!

movesAreCompatibleWith: aChessOrientationVector

	^aChessOrientationVector isCompatibleWithQueen!

whiteCodePoint

	^9813! !
!Queen categoriesForMethods!
blackCodePoint!public!unicode! !
fenString!public! !
isQueen!public!testing! !
isSlidingPiece!public! !
movesAreCompatibleWith:!public! !
whiteCodePoint!public!unicode! !
!

!Queen class methodsFor!

filePrefix
	" q - queen "

	^'q'!

pieceCode
	^'q'! !
!Queen class categoriesForMethods!
filePrefix!public! !
pieceCode!public! !
!

