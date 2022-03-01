"Filed out from Dolphin Smallalk"!

ChessAbstractShell subclass: #AbstractChessboardShell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AbstractChessboardShell guid: (GUID fromString: '{31692210-dbe8-43d2-9e3d-590d9d58b9c6}')!
AbstractChessboardShell comment: ''!
!AbstractChessboardShell categoriesForClass!Unclassified! !
!AbstractChessboardShell methodsFor!

renderChessboard

	self subclassResponsibility! !
!AbstractChessboardShell categoriesForMethods!
renderChessboard!public! !
!

!AbstractChessboardShell class methodsFor!

showOn: aChessboard on: aSystemRoot
	| shell |

	shell := self showOn: aChessboard.
	shell setRoot: aSystemRoot.
	^shell
	! !
!AbstractChessboardShell class categoriesForMethods!
showOn:on:!public! !
!

