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

fenString

	^self isBlack ifTrue: ['q'] ifFalse: ['Q']!

generateSquaresScopeFrom: aChessSquareScope

	^aChessSquareScope generateSlidingPieceSquareScope.!

isQueen

	^true!

isSlidingPiece

	^true!

movesAreCompatibleWith: aChessOrientationVector

	^aChessOrientationVector isCompatibleWithQueen! !
!Queen categoriesForMethods!
fenString!public! !
generateSquaresScopeFrom:!new framework!public! !
isQueen!public!testing! !
isSlidingPiece!public! !
movesAreCompatibleWith:!public! !
!

!Queen class methodsFor!

blackCodePoint

	^9819!

filePrefix
	" q - queen "

	^'q'!

pieceCode
	^'q'!

whiteCodePoint

	^9813! !
!Queen class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

