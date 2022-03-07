"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMovementEngineStackTree
	instanceVariableNames: 'piece originSquare chessboard roots objectNodeMap'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMovementEngineStackTree guid: (GUID fromString: '{be8f61e4-7324-4646-9f73-ce107d41d633}')!
ChessMovementEngineStackTree comment: ''!
!ChessMovementEngineStackTree categoriesForClass!Unclassified! !
!ChessMovementEngineStackTree methodsFor!

addChild: aChessSquare parentNode: parentChessSquare
	| childNode parentNode |

	parentNode := self lookupNode: parentChessSquare.
	childNode := self createTreeNodesFrom: aChessSquare parentNode: parentNode.
	"(objectNodeMap includesKey: aChessSquare) ifTrue: [^self]."
	objectNodeMap at: aChessSquare put: childNode.
	parentChessSquare 
		ifNotNil: [(self lookupNode: parentChessSquare) addChildNode: childNode]
		ifNil: [roots add: childNode].!

asDolphinTreeModel
	| treeModel |

	treeModel := TreeModel withRoots: roots.
	
	self preOrderDo: [:node | treeModel add: node asChildOf: node parentNode].

	^treeModel!

childrenOf: aTreeNode
	^aTreeNode isNil ifTrue: [roots] ifFalse: [aTreeNode children]!

childrenOfNode: aNode

	^aNode children!

createTreeNodesFrom: aChessSquare parentNode: parentNode
	| moveEngine treeNode |
	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: aChessSquare.
	treeNode := ChessMovementEngineStackTreeNode newOn: self from: aChessSquare movementEngine: moveEngine parentNode: parentNode.
	^treeNode!

expandSquare: aChessSquare
	| node | 

	node := self lookupNode: aChessSquare.
	

	!

expantUpToLevel: anInteger

	!

getChildrenOf: aChessSquare
	| node |
	node := self getNodeFor: aChessSquare.
	^(self childrenOfNode: node) collect: [:each | each square]!

getNodeFor: aNode

	^(self lookupNode: aNode square) ifNil: [self errorNotFound: aNode]!

includesSquare: aChessSquare

	^objectNodeMap includesKey: aChessSquare!

increaseTreeLevelTo: anInteger


	self preOrderDo: [:node | 
		node hasChildren 
			ifFalse: [(node treeLevel  <= anInteger)
				ifTrue: [node squaresDo: [:square | self addChild: square parentNode: node square]]]

	].
!

lookupNode: aChessSquare

	^objectNodeMap lookup: aChessSquare!

preOrderDo: aMonadicValuable 
	"Evaluate the <monadicValuable> argument for each of the elements of the receiver. Answers
	the receiver. The elements are enumerated using a 'pre-order' or 'depth-first' traversal
	where the parent is visited before the children."

	roots do: [:each | self preOrderDo: aMonadicValuable on: each]!

preOrderDo: aMonadicValuable on: aTreeNode

	aMonadicValuable value: aTreeNode.

	(self childrenOf: aTreeNode) do: [:treeNode | self preOrderDo: aMonadicValuable on: treeNode]!

setPiece: aChessPiece from: aChessSquare on: aChessboard
	| moveEngine |

	roots := OrderedCollection new.
	objectNodeMap := Dictionary new.
	piece := aChessPiece.
	originSquare := aChessSquare.
	chessboard := aChessboard.

	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: originSquare.

	self addChild: aChessSquare parentNode: nil.
	moveEngine squaresDo: [:square | self addChild: square parentNode: aChessSquare].
! !
!ChessMovementEngineStackTree categoriesForMethods!
addChild:parentNode:!public! !
asDolphinTreeModel!public! !
childrenOf:!public! !
childrenOfNode:!public! !
createTreeNodesFrom:parentNode:!public! !
expandSquare:!public! !
expantUpToLevel:!public! !
getChildrenOf:!public! !
getNodeFor:!public! !
includesSquare:!public! !
increaseTreeLevelTo:!public! !
lookupNode:!private! !
preOrderDo:!public! !
preOrderDo:on:!public! !
setPiece:from:on:!private! !
!

!ChessMovementEngineStackTree class methodsFor!

newOn: aChessPiece from: aChessSquare on: aChessboard

	^self new setPiece: aChessPiece from: aChessSquare on: aChessboard! !
!ChessMovementEngineStackTree class categoriesForMethods!
newOn:from:on:!public! !
!

