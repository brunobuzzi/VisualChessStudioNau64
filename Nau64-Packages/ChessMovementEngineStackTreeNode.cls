"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMovementEngineStackTreeNode
	instanceVariableNames: 'tree movementEngine parentNode children'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMovementEngineStackTreeNode guid: (GUID fromString: '{1ef7548b-5f4a-479b-a1a2-3311b5fef504}')!
ChessMovementEngineStackTreeNode comment: ''!
!ChessMovementEngineStackTreeNode categoriesForClass!Unclassified! !
!ChessMovementEngineStackTreeNode methodsFor!

setTree: aChessMovementEngineStackTree movementEngine: aChessMovementEngine parentNode: treeNode

	tree := aChessMovementEngineStackTree.
	movementEngine := aChessMovementEngine.
	parentNode := treeNode.
	children := OrderedCollection new.! !
!ChessMovementEngineStackTreeNode categoriesForMethods!
setTree:movementEngine:parentNode:!private! !
!

!ChessMovementEngineStackTreeNode class methodsFor!

newOn: aChessMovementEngineStackTree movementEngine: aChessMovementEngint parentNode: treeNode

	^self new setTree: aChessMovementEngineStackTree movementEngine: aChessMovementEngint parentNode: treeNode! !
!ChessMovementEngineStackTreeNode class categoriesForMethods!
newOn:movementEngine:parentNode:!public! !
!

