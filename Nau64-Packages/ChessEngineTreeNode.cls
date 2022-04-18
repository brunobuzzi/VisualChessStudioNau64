"Filed out from Dolphin Smallalk"!

Object subclass: #ChessEngineTreeNode
	instanceVariableNames: 'tree parentNode children'
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

childrenDo: aBlock

	children do: aBlock!

expand

	children notEmpty ifTrue: [^self].

	self halt.!

hasChildren

	^children notEmpty!

orientationParentNode
	self subclassResponsibility!

parentNode

	^parentNode!

treeLevel

	parentNode ifNil: [^1].

	^1 + parentNode treeLevel! !
!ChessEngineTreeNode categoriesForMethods!
addChildNode:!public! !
allParents!public! !
allParentsOn:!public! !
allParentsSquares!public! !
children!public! !
childrenDo:!public! !
expand!public! !
hasChildren!public! !
orientationParentNode!public! !
parentNode!public! !
treeLevel!public! !
!

