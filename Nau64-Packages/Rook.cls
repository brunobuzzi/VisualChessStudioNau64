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

fenString

	^self isBlack ifTrue: ['r'] ifFalse: ['R']!

isRook

	^true!

isSlidingPiece

	^true!

pieceCode
	^'r'! !
!Rook categoriesForMethods!
fenString!public! !
isRook!public!testing! !
isSlidingPiece!public! !
pieceCode!public! !
!

!Rook class methodsFor!

filePrefix
	" r - rook "

	^'r'! !
!Rook class categoriesForMethods!
filePrefix!public! !
!

