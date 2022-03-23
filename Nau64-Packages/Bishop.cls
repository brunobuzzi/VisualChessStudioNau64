"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #Bishop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Bishop guid: (GUID fromString: '{c4dbd593-8c29-4b73-b3c0-16ce40dee3fb}')!
Bishop comment: ''!
!Bishop categoriesForClass!Kernel-Objects! !
!Bishop methodsFor!

blackCodePoint

	^9821!

fenString

	^self isBlack ifTrue: ['b'] ifFalse: ['B']!

isBishop

	^true!

isSlidingPiece

	^true!

movesAreCompatibleWith: aChessOrientationVector

	^aChessOrientationVector isCompatibleWithBishop!

whiteCodePoint

	^9815! !
!Bishop categoriesForMethods!
blackCodePoint!public!unicode! !
fenString!public! !
isBishop!public!testing! !
isSlidingPiece!public! !
movesAreCompatibleWith:!public! !
whiteCodePoint!public!unicode! !
!

!Bishop class methodsFor!

filePrefix
	" b - bishop "

	^'b'!

pieceCode
	^'b'! !
!Bishop class categoriesForMethods!
filePrefix!public! !
pieceCode!public! !
!

