"Filed out from Dolphin Smallalk"!

Shell subclass: #ChessAbstractShell
	instanceVariableNames: 'systemRoot'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessAbstractShell guid: (GUID fromString: '{097b86cd-c962-4df9-9b07-da4626e5b790}')!
ChessAbstractShell comment: ''!
!ChessAbstractShell categoriesForClass!Unclassified! !
!ChessAbstractShell methodsFor!

setRoot: aSystemRoot

	systemRoot := aSystemRoot! !
!ChessAbstractShell categoriesForMethods!
setRoot:!private! !
!

!ChessAbstractShell class methodsFor!

defaultModel
	^Chessboard newWithAllPiecesOn: (Smalltalk at: #SystemRoot)! !
!ChessAbstractShell class categoriesForMethods!
defaultModel!public! !
!

