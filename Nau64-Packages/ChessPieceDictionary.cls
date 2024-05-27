"Filed out from Dolphin Smallalk"!

Object subclass: #ChessPieceDictionary
	instanceVariableNames: 'piece'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPieceDictionary guid: (GUID fromString: '{0ab80e81-4eb3-4b29-b13a-cce1f0a17b5b}')!
ChessPieceDictionary comment: ''!
!ChessPieceDictionary categoriesForClass!Unclassified! !
!ChessPieceDictionary methodsFor!

chessboardDo: monadicBlock

	piece chessboardDo: [:chessboard | monadicBlock value: chessboard]!

pieceDo: monadicBlock

	monadicBlock value: piece!

setChessPiece: aChessPiece

	piece := aChessPiece.! !
!ChessPieceDictionary categoriesForMethods!
chessboardDo:!public! !
pieceDo:!public!tactics searchs! !
setChessPiece:!private! !
!

!ChessPieceDictionary class methodsFor!

icon

	^Icon fromId: 'SystemDictionary.ico'!

on: aChessPiece

	^self new setChessPiece: aChessPiece! !
!ChessPieceDictionary class categoriesForMethods!
icon!public! !
on:!public! !
!

