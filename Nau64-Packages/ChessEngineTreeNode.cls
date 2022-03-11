"Filed out from Dolphin Smallalk"!

Object subclass: #ChessEngineTreeNode
	instanceVariableNames: 'tree square orientation movementEngine parentNode children'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEngineTreeNode guid: (GUID fromString: '{1ef7548b-5f4a-479b-a1a2-3311b5fef504}')!
ChessEngineTreeNode comment: ''!
!ChessEngineTreeNode categoriesForClass!Unclassified! !
!ChessEngineTreeNode methodsFor!

addChildNode: aChessMovementEngineStackTreeNode

	^children add: aChessMovementEngineStackTreeNode!

allParents

	^self allParentsOn: OrderedCollection new!

allParentsOn: anOrderedCollection

	parentNode ifNil: [^anOrderedCollection].

	anOrderedCollection add: parentNode.

	^parentNode allParentsOn: anOrderedCollection!

allParentsSquares

	^self allParents collect: [:each | each square]!

children

	^children!

expand

	children notEmpty ifTrue: [^self].

	self halt.!

hasChildren

	^children notEmpty!

parentNode

	^parentNode!

printNodeOn: aStream 

	aStream cr.

	1 to: self treeLevel do: [:idx | aStream tab].

	aStream nextPutAll: square printName.

	children do: [:each | each printNodeOn: aStream].!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', square printName, ']'!

setTree: aChessMovementEngineStackTree from: aChessSquare orientation: orientationSymbol movementEngine: aChessMovementEngine parentNode: treeNode

	tree := aChessMovementEngineStackTree.
	movementEngine := aChessMovementEngine.
	parentNode := treeNode.
	children := OrderedCollection new.
	square := aChessSquare.
	orientation := orientationSymbol

!

square

	^square!

squaresDo: aBlock

	movementEngine squaresDo: aBlock!

treeLevel

	parentNode ifNil: [^1].

	^1 + parentNode treeLevel! !
!ChessEngineTreeNode categoriesForMethods!
addChildNode:!public! !
allParents!public! !
allParentsOn:!public! !
allParentsSquares!public! !
children!public! !
expand!public! !
hasChildren!public! !
parentNode!public! !
printNodeOn:!public! !
printOn:!public! !
setTree:from:orientation:movementEngine:parentNode:!private! !
square!public! !
squaresDo:!public! !
treeLevel!public! !
!

!ChessEngineTreeNode class methodsFor!

newOn: aChessMovementEngineStackTree from: aChessSquare orientation: orientationSymbol movementEngine: aChessMovementEngint parentNode: treeNode

	^self new setTree: aChessMovementEngineStackTree from: aChessSquare  orientation: orientationSymbol movementEngine: aChessMovementEngint parentNode: treeNode! !
!ChessEngineTreeNode class categoriesForMethods!
newOn:from:orientation:movementEngine:parentNode:!public! !
!

