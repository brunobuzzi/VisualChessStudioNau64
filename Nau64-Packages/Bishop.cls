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

	^aChessOrientationVector isCompatibleWithBishop!

pieceCode
	^'b'! !
!Bishop categoriesForMethods!
fenString!public! !
isBishop!public!testing! !
isSlidingPiece!public! !
movesAreCompatibleWith:!public! !
pieceCode!public! !
!

!Bishop class methodsFor!

filePrefix
	" b - bishop "

	^'b'! !
!Bishop class categoriesForMethods!
filePrefix!public! !
!

