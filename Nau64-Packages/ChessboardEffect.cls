"Filed out from Dolphin Smallalk"!

Object subclass: #ChessboardEffect
	instanceVariableNames: 'chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessboardEffect guid: (GUID fromString: '{0d45f5e0-e2e5-4a3b-a824-dc3a6d6656f7}')!
ChessboardEffect comment: ''!
!ChessboardEffect categoriesForClass!Kernel-Objects! !
!ChessboardEffect methodsFor!

drawOn: aCanvas

	self subclassResponsibility!

setChessboard: aChessboard

	chessboard := aChessboard! !
!ChessboardEffect categoriesForMethods!
drawOn:!public! !
setChessboard:!private! !
!

!ChessboardEffect class methodsFor!

newOn: aChessboard

	^self new setChessboard: aChessboard! !
!ChessboardEffect class categoriesForMethods!
newOn:!public! !
!

