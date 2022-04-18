"Filed out from Dolphin Smallalk"!

Object subclass: #ChessEnginePieceStackTree
	instanceVariableNames: 'piece originSquare chessboard roots'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEnginePieceStackTree guid: (GUID fromString: '{be8f61e4-7324-4646-9f73-ce107d41d633}')!
ChessEnginePieceStackTree comment: ''!
!ChessEnginePieceStackTree categoriesForClass!Unclassified! !
!ChessEnginePieceStackTree methodsFor!

addChild: aChessSquare parentNode: aChessEngineOrientationTreeNode level: anInteger
	| squareNode moveEngine |

	aChessEngineOrientationTreeNode orientationParentNode 
	ifNotNil: [:orientationNode | (orientationNode includesSquare: aChessSquare) ifTrue: [^self]].

	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: aChessSquare.
	squareNode := ChessEngineSquareTreeNode
				newOn: self
				from: aChessSquare
				movementEngine: moveEngine
				parentNode: aChessEngineOrientationTreeNode.
	aChessEngineOrientationTreeNode addChildNode: squareNode.!

addChildren: squareCollection fromOrientation: orientationSymbol parentNode: aChessEngineSquareTreeNode level: anInteger
	| orientationNode |

	squareCollection isEmpty ifTrue: [^self].
	orientationNode := self
				createTreeOrientationNodesFrom: aChessEngineSquareTreeNode square
				fromOrientation: orientationSymbol
				parentNode: aChessEngineSquareTreeNode.
	squareCollection do: [:square | self addChild: square parentNode: orientationNode level: anInteger].
	orientationNode hasChildren 
	ifTrue: [aChessEngineSquareTreeNode addChildNode: orientationNode.
	].
!

asDolphinTreeModel
	| treeModel |

	treeModel := TreeModel withRoots: roots.
	
	self preOrderDo: [:node | treeModel add: node asChildOf: node parentNode].

	^treeModel!

childrenOf: aTreeNode
	^aTreeNode isNil ifTrue: [roots] ifFalse: [aTreeNode children]!

createChildrenFor: aChessSquare isRoot: aBoolean parentNode: parentNode
	| moveEngine treeNode |

	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: aChessSquare.
	treeNode := ChessEngineSquareTreeNode
				newOn: self
				from: aChessSquare
				movementEngine: moveEngine
				parentNode: parentNode.

	aBoolean ifTrue: [roots add: treeNode].

	moveEngine squaresAndOrientationDo: [:squares :orientationSymbol | self addChildren: squares fromOrientation: orientationSymbol parentNode: treeNode level: 1].

!

createTopNodeAndChildren
	
	self createChildrenFor: originSquare isRoot: true parentNode: nil!

createTreeChildrenForLevel: treeLevel

	(self squaresNodeByOrientationAtLevel: treeLevel) do: [:each | | moveEngine |
		moveEngine := piece newMovementEngineOn: self.
		moveEngine computeValidSquaresOn: chessboard from: each square.
		moveEngine squaresAndOrientationDo: [:squares :orientationSymbol | self addChildren: squares fromOrientation: orientationSymbol parentNode: each level: treeLevel].
	].!

createTreeOrientationNodesFrom: aChessSquare fromOrientation: orientationSymbol parentNode: parentNode 
	| moveEngine treeNode |
	moveEngine := piece newMovementEngineOn: self.
	moveEngine computeValidSquaresOn: chessboard from: aChessSquare.
	treeNode := ChessEngineOrientationTreeNode
				newOn: self
				orientation: orientationSymbol
				parentNode: parentNode.
	^treeNode!

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
	piece := aChessPiece.
	originSquare := aChessSquare.
	chessboard := aChessboard.

	self createTopNodeAndChildren.
	
	self createTreeChildrenForLevel: 2.!

squaresAtOrientationPath: orientantionCollection
	| result |
	
	result := OrderedCollection new.
	self squaresAtOrientationPath: orientantionCollection currentNodes: roots result: result.
	^result!

squaresAtOrientationPath: orientantionCollection currentNodes: currentSquareNodes result: anOrderedCollection

	orientantionCollection isEmpty ifTrue: [anOrderedCollection addAll: (currentSquareNodes collect: [:each | each square])].
	orientantionCollection do: [:orientantionSymbol | | orientationNodes |
		orientationNodes := OrderedCollection new.
		currentSquareNodes do: [:squareNode | 
			orientationNodes addAll: (squareNode childrenSelect: [:orientationNode | orientationNode orientation = orientantionSymbol]).
		].
		orientationNodes do: [:orientationNode | 
			self squaresAtOrientationPath: orientantionCollection allButFirst currentNodes: orientationNode children result: anOrderedCollection.
		].
	].
!

squaresNodeByOrientationAtLevel: integerTreeLevel
	| result |

	result := OrderedCollection new.
	roots do: [:squareNode | 
		squareNode childrenDo: [:orientationNode | 
			self squaresNodeByOrientationAtLevel: integerTreeLevel currentLevel: 1 currentOrientationNode: orientationNode collectedSquares: result.
		].
	].
	^result!

squaresNodeByOrientationAtLevel: integerTreeLevel currentLevel: currentLevel currentOrientationNode: anOrientationTreeNode collectedSquares: anOrderedCollection

	(integerTreeLevel <= 1) ifTrue: [^roots].

	anOrientationTreeNode childrenDo: [:squareNode | 
		(integerTreeLevel = (currentLevel + 1))
		ifTrue: [anOrderedCollection add: squareNode]
		ifFalse: [squareNode childrenDo: [:orientationNode | 
				self squaresNodeByOrientationAtLevel: integerTreeLevel currentLevel: currentLevel + 1currentOrientationNode: orientationNode collectedSquares: anOrderedCollection.
			].
		].
	].
	! !
!ChessEnginePieceStackTree categoriesForMethods!
addChild:parentNode:level:!build tree!public! !
addChildren:fromOrientation:parentNode:level:!build tree!public! !
asDolphinTreeModel!public! !
childrenOf:!public! !
createChildrenFor:isRoot:parentNode:!build tree!private! !
createTopNodeAndChildren!build tree!private! !
createTreeChildrenForLevel:!build tree!private! !
createTreeOrientationNodesFrom:fromOrientation:parentNode:!build tree!public! !
preOrderDo:!public! !
preOrderDo:on:!public! !
printTree!public! !
printTreeOn:!public! !
setPiece:from:on:!build tree!private! !
squaresAtOrientationPath:!public! !
squaresAtOrientationPath:currentNodes:result:!public! !
squaresNodeByOrientationAtLevel:!build tree!public! !
squaresNodeByOrientationAtLevel:currentLevel:currentOrientationNode:collectedSquares:!build tree!public! !
!

!ChessEnginePieceStackTree class methodsFor!

newOn: aChessPiece from: aChessSquare on: aChessboard

	^self new setPiece: aChessPiece from: aChessSquare on: aChessboard! !
!ChessEnginePieceStackTree class categoriesForMethods!
newOn:from:on:!public! !
!

