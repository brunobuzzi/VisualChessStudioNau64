"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #Rook
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Rook guid: (GUID fromString: '{ff74ba36-efa8-4230-9b40-33df6e0cfc67}')!
Rook comment: ''!
!Rook categoriesForClass!Kernel-Objects! !
!Rook methodsFor!

bateryOrientationsFrom: aChessOrientationVector do: aBlock

	aChessOrientationVector rookBateryOrientationsDo: aBlock!

fenString

	^self isBlack ifTrue: ['r'] ifFalse: ['R']!

isRook

	^true!

isSlidingPiece

	^true!

movesAreCompatibleWith: aChessOrientationVector

	^aChessOrientationVector isCompatibleWithRook! !
!Rook categoriesForMethods!
bateryOrientationsFrom:do:!public!tactics! !
fenString!public! !
isRook!public!testing! !
isSlidingPiece!public! !
movesAreCompatibleWith:!public! !
!

!Rook class methodsFor!

blackCodePoint

	^9820!

filePrefix
	" r - rook "

	^'r'!

pieceCode
	^'r'!

whiteCodePoint

	^9814! !
!Rook class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

