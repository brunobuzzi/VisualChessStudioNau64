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

addChildNode: aChessMovementEngineStackTreeNode

	^children add: aChessMovementEngineStackTreeNode!

children

	^children!

expand

	children notEmpty ifTrue: [^self].

	self halt.!

hasChildren

	^children notEmpty!

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

	^square!

squaresDo: aBlock

	movementEngine squaresDo: aBlock!

treeLevel

	parentNode ifNil: [^1].

	^1 + parentNode treeLevel! !
!ChessMovementEngineStackTreeNode categoriesForMethods!
addChildNode:!public! !
children!public! !
expand!public! !
hasChildren!public! !
parentNode!public! !
printOn:!public! !
setTree:from:movementEngine:parentNode:!private! !
square!public! !
squaresDo:!public! !
treeLevel!public! !
!

!ChessMovementEngineStackTreeNode class methodsFor!

newOn: aChessMovementEngineStackTree from: aChessSquare movementEngine: aChessMovementEngint parentNode: treeNode

	^self new setTree: aChessMovementEngineStackTree from: aChessSquare  movementEngine: aChessMovementEngint parentNode: treeNode! !
!ChessMovementEngineStackTreeNode class categoriesForMethods!
newOn:from:movementEngine:parentNode:!public! !
!

