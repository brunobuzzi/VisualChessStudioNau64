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
	(objectNodeMap includesKey: aChessSquare) ifTrue: [^self].
	objectNodeMap at: aChessSquare put: childNode.
	parentChessSquare 
		ifNotNil: [(self lookupNode: parentChessSquare) addChildNode: childNode]
		ifNil: [roots add: childNode]!

asDolphinTreeModel
	| treeModel |

	treeModel := TreeModel withRoots: (roots collect: [:each | each square]).
	
	self preOrderDo: [:node | treeModel add: node square asChildOf: (self getNodeFor: node) parentNode].

	^treeModel!

childrenOf: aChessSquare

	^aChessSquare isNil
		ifTrue: [roots]
		ifFalse: [self getChildrenOf: aChessSquare]!

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

lookupNode: aChessSquare

	^objectNodeMap lookup: aChessSquare!

preOrderDo: aMonadicValuable 
	"Evaluate the <monadicValuable> argument for each of the elements of the receiver. Answers
	the receiver. The elements are enumerated using a 'pre-order' or 'depth-first' traversal
	where the parent is visited before the children."

	roots do: [:each | self preOrderDo: aMonadicValuable on: each]!

preOrderDo: aMonadicValuable on: aChessSquare

	aMonadicValuable value: aChessSquare.

	(self childrenOf: aChessSquare) do: [:square | self preOrderDo: aMonadicValuable on: square]!

setPiece: aChessPiece from: aChessSquare on: aChessboard
	| moveEngine |

	roots := OrderedCollection new.
	objectNodeMap := Dictionary new.
	piece := aChessPiece.
	originSquare := aChessSquare.
	chessboard := aChessboard.

	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: originSquare.
	moveEngine squaresDo: [:square | self addChild: square parentNode: nil]
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

