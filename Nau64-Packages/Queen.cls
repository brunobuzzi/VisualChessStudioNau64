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

isQueen

	^true!

isSlidingPiece

	^true!

movesAreCompatibleWith: aChessOrientationVector

	^aChessOrientationVector isCompatibleWithQueen!

pieceCode
	^'q'! !
!Queen categoriesForMethods!
fenString!public! !
isQueen!public!testing! !
isSlidingPiece!public! !
movesAreCompatibleWith:!public! !
pieceCode!public! !
!

!Queen class methodsFor!

filePrefix
	" q - queen "

	^'q'! !
!Queen class categoriesForMethods!
filePrefix!public! !
!

