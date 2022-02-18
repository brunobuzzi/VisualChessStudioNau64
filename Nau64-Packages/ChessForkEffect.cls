"Filed out from Dolphin Smallalk"!

ChessTacticEffect subclass: #ChessForkEffect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessForkEffect guid: (GUID fromString: '{68d3cde4-3e68-486f-8362-5ee872e4a876}')!
ChessForkEffect comment: ''!
!ChessForkEffect categoriesForClass!Unclassified! !
!ChessForkEffect methodsFor!

drawOn: aCanvas
	| forkSearcher forksDictionary |
	forkSearcher := ChessForkSearcher newOn: chessboard.
	isBlack
		ifTrue: [chessboard blackSideDo: [:side | forksDictionary := forkSearcher searchOnChessboardFor: side]]
		ifFalse: 
			[chessboard whiteSideDo: [:side | forksDictionary := forkSearcher searchOnChessboardFor: side]].
	forksDictionary keysAndValuesDo: [:piece :forkCollection |
			forkCollection do: [:fork | fork drawOn: aCanvas graphics on: chessboard pieceSquarePen: self penRed forkPen: self pen]]! !
!ChessForkEffect categoriesForMethods!
drawOn:!public! !
!

