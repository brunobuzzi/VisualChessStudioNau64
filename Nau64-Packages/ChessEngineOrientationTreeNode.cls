"Filed out from Dolphin Smallalk"!

ChessEngineTreeNode subclass: #ChessEngineOrientationTreeNode
	instanceVariableNames: 'orientation'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEngineOrientationTreeNode guid: (GUID fromString: '{1f8d6f2e-6f48-406c-b3b1-409836acfd3a}')!
ChessEngineOrientationTreeNode comment: ''!
!ChessEngineOrientationTreeNode categoriesForClass!Unclassified! !
!ChessEngineOrientationTreeNode methodsFor!

includesSquare: aChessSquare

	^(children collect: [:each | each square]) includes: aChessSquare!

orientation

	^orientation!

orientationParentNode

	^parentNode 
		ifNil: [] 
		ifNotNil: [:node | node parentNode]!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', orientation, ']'!

setTree: aChessMovementEngineStackTree orientation: orientationSymbol parentNode: treeNode

	tree := aChessMovementEngineStackTree.
	parentNode := treeNode.
	children := OrderedCollection new.
	orientation := orientationSymbol

!

treeKey

	^parentNode treeKey, orientation! !
!ChessEngineOrientationTreeNode categoriesForMethods!
includesSquare:!public! !
orientation!private! !
orientationParentNode!public! !
printOn:!public! !
setTree:orientation:parentNode:!private! !
treeKey!public! !
!

!ChessEngineOrientationTreeNode class methodsFor!

newOn: aChessMovementEngineStackTree orientation: orientationSymbol parentNode: treeNode

	^self new setTree: aChessMovementEngineStackTree orientation: orientationSymbol parentNode: treeNode! !
!ChessEngineOrientationTreeNode class categoriesForMethods!
newOn:orientation:parentNode:!public! !
!

