"Filed out from Dolphin Smallalk"!

Object subclass: #ChessEnginePieceStackTree
	instanceVariableNames: 'piece originSquare chessboard roots objectNodeMap level'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEnginePieceStackTree guid: (GUID fromString: '{be8f61e4-7324-4646-9f73-ce107d41d633}')!
ChessEnginePieceStackTree comment: ''!
!ChessEnginePieceStackTree categoriesForClass!Unclassified! !
!ChessEnginePieceStackTree methodsFor!

addChild: aChessSquare parentNode: aChessEngineOrientationTreeNode level: anInteger
	| squareNode moveEngine |

	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: aChessSquare.
	squareNode := ChessEngineSquareTreeNode
				newOn: self
				from: aChessSquare
				movementEngine: moveEngine
				parentNode: aChessEngineOrientationTreeNode.
	aChessEngineOrientationTreeNode addChildNode: squareNode.

	moveEngine squaresAndOrientationDo: [:squares :orientationSymbol | self addChildren: squares fromOrientation: orientationSymbol parentNode: squareNode level: anInteger + 1].!

addChildren: squareCollection fromOrientation: orientationSymbol parentNode: aChessEngineSquareTreeNode level: anInteger
	| orientationNode |

	anInteger >= level ifTrue: [^self].

	squareCollection isEmpty ifTrue: [^self].
	orientationNode := self
				createTreeOrientationNodesFrom: aChessEngineSquareTreeNode square
				fromOrientation: orientationSymbol
				parentNode: aChessEngineSquareTreeNode.
	squareCollection do: [:square | self addChild: square parentNode: orientationNode level: anInteger].
	"objectNodeMap at: orientationNode treeKey put: orientationNode."
	aChessEngineSquareTreeNode addChildNode: orientationNode!

asDolphinTreeModel
	| treeModel |

	treeModel := TreeModel withRoots: roots.
	
	self preOrderDo: [:node | treeModel add: node asChildOf: node parentNode].

	^treeModel!

childrenOf: aTreeNode
	^aTreeNode isNil ifTrue: [roots] ifFalse: [aTreeNode children]!

childrenOfNode: aNode

	^aNode children!

createTopNodeAndChildren
	| moveEngine treeNode |

	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: originSquare.
	treeNode := ChessEngineSquareTreeNode
				newOn: self
				from: originSquare
				movementEngine: moveEngine
				parentNode: nil.
	roots add: treeNode.

	"objectNodeMap at: originSquare printName asSymbol put: treeNode."

	moveEngine squaresAndOrientationDo: [:squares :orientationSymbol | self addChildren: squares fromOrientation: orientationSymbol parentNode: treeNode level: 1].

!

createTreeOrientationNodesFrom: aChessSquare fromOrientation: orientationSymbol parentNode: parentNode 
	| moveEngine treeNode |
	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: aChessSquare.
	treeNode := ChessEngineOrientationTreeNode
				newOn: self
				orientation: orientationSymbol
				parentNode: parentNode.
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

increaseTreeLevel
	| maxNodeLevel |

	maxNodeLevel := (objectNodeMap collect: [:each | each treeLevel]) asSortedCollection last.

	objectNodeMap do: [:node | 
		(node treeLevel = maxNodeLevel) 
		ifTrue: [node squaresDo: [:square | self addChild: square parentNode: node square]]
	].!

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

printTree
	| aStream |

	aStream := String new writeStream.
	self printTreeOn: aStream.
	^aStream contents !

printTreeOn: aStream

	roots do: [:each | each printNodeOn: aStream].!

setPiece: aChessPiece from: aChessSquare on: aChessboard
	
	roots := OrderedCollection new.
	objectNodeMap := Dictionary new.
	piece := aChessPiece.
	originSquare := aChessSquare.
	chessboard := aChessboard.
	level := 3.

	self createTopNodeAndChildren.
	
! !
!ChessEnginePieceStackTree categoriesForMethods!
addChild:parentNode:level:!build tree!public! !
addChildren:fromOrientation:parentNode:level:!build tree!public! !
asDolphinTreeModel!public! !
childrenOf:!public! !
childrenOfNode:!public! !
createTopNodeAndChildren!build tree!private! !
createTreeOrientationNodesFrom:fromOrientation:parentNode:!build tree!public! !
expandSquare:!public! !
expantUpToLevel:!public! !
getChildrenOf:!public! !
getNodeFor:!public! !
increaseTreeLevel!public! !
increaseTreeLevelTo:!public! !
lookupNode:!private! !
preOrderDo:!public! !
preOrderDo:on:!public! !
printTree!public! !
printTreeOn:!public! !
setPiece:from:on:!build tree!private! !
!

!ChessEnginePieceStackTree class methodsFor!

newOn: aChessPiece from: aChessSquare on: aChessboard

	^self new setPiece: aChessPiece from: aChessSquare on: aChessboard! !
!ChessEnginePieceStackTree class categoriesForMethods!
newOn:from:on:!public! !
!

