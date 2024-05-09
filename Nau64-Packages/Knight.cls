"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #Knight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Knight guid: (GUID fromString: '{9a94a41f-a339-4ac3-a754-7f378ec7747b}')!
Knight comment: ''!
!Knight categoriesForClass!Kernel-Objects! !
!Knight methodsFor!

fenString

	^self isBlack ifTrue: ['n'] ifFalse: ['N']!

isKnight

	^true!

pgnString

	^'N'!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	aSquaresDictionary pruneUnreacheableSquaresFromKnight! !
!Knight categoriesForMethods!
fenString!public! !
isKnight!public!testing! !
pgnString!public! !
pruneUnreacheableSquaresFrom:!new framework!public! !
!

!Knight class methodsFor!

blackCodePoint

	^9822!

filePrefix
	" n - Knight "

	^'n'!

pieceCode
	^'n'!

whiteCodePoint

	^9816! !
!Knight class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

