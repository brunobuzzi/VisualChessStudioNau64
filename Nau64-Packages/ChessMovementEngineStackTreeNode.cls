"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMovementEngineStackTreeNode
	instanceVariableNames: 'tree square movementEngine parentNode children'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMovementEngineStackTreeNode guid: (GUID fromString: '{1ef7548b-5f4a-479b-a1a2-3311b5fef504}')!
ChessMovementEngineStackTreeNode comment: ''!
!ChessMovementEngineStackTreeNode categoriesForClass!Unclassified! !
!ChessMovementEngineStackTreeNode methodsFor!

children

	^children!

expand

	children notEmpty ifTrue: [^self].

	self halt.!

parentNode

	^parentNode!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', square printName, ']'!

setTree: aChessMovementEngineStackTree from: aChessSquare movementEngine: aChessMovementEngine parentNode: treeNode

	tree := aChessMovementEngineStackTree.
	movementEngine := aChessMovementEngine.
	parentNode := treeNode.
	children := OrderedCollection new.
	square := aChessSquare

!

square

	^square! !
!ChessMovementEngineStackTreeNode categoriesForMethods!
children!public! !
expand!public! !
parentNode!public! !
printOn:!public! !
setTree:from:movementEngine:parentNode:!private! !
square!public! !
!

!ChessMovementEngineStackTreeNode class methodsFor!

newOn: aChessMovementEngineStackTree from: aChessSquare movementEngine: aChessMovementEngint parentNode: treeNode

	^self new setTree: aChessMovementEngineStackTree from: aChessSquare  movementEngine: aChessMovementEngint parentNode: treeNode! !
!ChessMovementEngineStackTreeNode class categoriesForMethods!
newOn:from:movementEngine:parentNode:!public! !
!

