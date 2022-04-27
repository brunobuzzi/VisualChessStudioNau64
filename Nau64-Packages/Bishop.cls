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

fenString

	^self isBlack ifTrue: ['b'] ifFalse: ['B']!

isBishop

	^true!

isSlidingPiece

	^true!

movesAreCompatibleWith: aChessOrientationVector

	^aChessOrientationVector isCompatibleWithBishop! !
!Bishop categoriesForMethods!
fenString!public! !
isBishop!public!testing! !
isSlidingPiece!public! !
movesAreCompatibleWith:!public! !
!

!Bishop class methodsFor!

blackCodePoint

	^9821!

filePrefix
	" b - bishop "

	^'b'!

pieceCode
	^'b'!

whiteCodePoint

	^9815! !
!Bishop class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

