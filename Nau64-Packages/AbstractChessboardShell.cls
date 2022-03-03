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

copyPositionAsFenString

	self defaultChessPresenter copyPositionAsFenString!

defaultChessPresenter

	self subclassResponsibility!

queryCommand: aCommandQuery
	| cmd |

	cmd := aCommandQuery commandSymbol.

	(cmd == #toggleCoordinates) ifTrue: [aCommandQuery isEnabled: true. ^true].

	(cmd == #reverseChessboard) ifTrue: [aCommandQuery isEnabled: true. ^true].
	
	^super queryCommand: aCommandQuery!

renderChessboard

	self defaultChessPresenter renderChessboard!

reverseChessboard

	self defaultChessPresenter reverseChessboard!

toggleCoordinates

	^self defaultChessPresenter toggleCoordinates! !
!AbstractChessboardShell categoriesForMethods!
copyPositionAsFenString!public! !
defaultChessPresenter!public! !
queryCommand:!public! !
renderChessboard!public! !
reverseChessboard!public! !
toggleCoordinates!public! !
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

