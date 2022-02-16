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

pieceCode
	^'n'! !
!Knight categoriesForMethods!
fenString!public! !
isKnight!public!testing! !
pieceCode!public! !
!

!Knight class methodsFor!

filePrefix
	" n - Knight "

	^'n'! !
!Knight class categoriesForMethods!
filePrefix!public! !
!

