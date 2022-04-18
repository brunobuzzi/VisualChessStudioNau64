"Filed out from Dolphin Smallalk"!

ChessEngineTreeNode subclass: #ChessEngineSquareTreeNode
	instanceVariableNames: 'square movementEngine'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEngineSquareTreeNode guid: (GUID fromString: '{2a197d15-c036-4894-961f-589913a4a5d0}')!
ChessEngineSquareTreeNode comment: ''!
!ChessEngineSquareTreeNode categoriesForClass!Unclassified! !
!ChessEngineSquareTreeNode methodsFor!

movementEngineDo: aBlock

	aBlock value: movementEngine!

orientationParentNode

	^parentNode parentNode 
		ifNil: [] 
		ifNotNil: [:node | node parentNode]!

printNodeOn: aStream 

	aStream cr.

	1 to: self treeLevel do: [:idx | aStream tab].

	aStream nextPutAll: square printName.

	children do: [:each | each printNodeOn: aStream].!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', square printName, ']'!

setTree: aChessMovementEngineStackTree from: aChessSquare movementEngine: aChessMovementEngine parentNode: treeNode

	tree := aChessMovementEngineStackTree.
	movementEngine := aChessMovementEngine.
	parentNode := treeNode.
	children := OrderedCollection new.
	square := aChessSquare.


!

square

	^square!

squaresDo: aBlock

	movementEngine squaresDo: aBlock!

treeKey

	^square printName asSymbol! !
!ChessEngineSquareTreeNode categoriesForMethods!
movementEngineDo:!public! !
orientationParentNode!public! !
printNodeOn:!public! !
printOn:!public! !
setTree:from:movementEngine:parentNode:!private! !
square!public! !
squaresDo:!public! !
treeKey!public! !
!

!ChessEngineSquareTreeNode class methodsFor!

newOn: aChessMovementEngineStackTree from: aChessSquare movementEngine: aChessMovementEngine parentNode: treeNode

	^self new setTree: aChessMovementEngineStackTree from: aChessSquare movementEngine: aChessMovementEngine parentNode: treeNode! !
!ChessEngineSquareTreeNode class categoriesForMethods!
newOn:from:movementEngine:parentNode:!public! !
!

