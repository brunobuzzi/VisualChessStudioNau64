"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMoveTreeList
	instanceVariableNames: 'game treeRoots lastMove objectNodeMap'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMoveTreeList guid: (GUID fromString: '{9f66465d-3c5a-4566-9118-943845fc4f32}')!
ChessMoveTreeList comment: ''!
!ChessMoveTreeList categoriesForClass!Unclassified! !
!ChessMoveTreeList methodsFor!

addChild: aChessMove parentNode: parentChessMove
	| childNode parentNode |

	parentNode := self lookupNode: parentChessMove.
	childNode := self newNodeParent: parentNode move: aChessMove.
	objectNodeMap at: aChessMove put: childNode.
	parentChessMove 
		ifNotNil: [(self lookupNode: parentChessMove) addChildNode: childNode]
		ifNil: [treeRoots add: childNode]!

annotateMove: aChessMove on: aChessboard
	| originPiece targetPiece |

	aChessMove setCategoriesFrom:  aChessboard.

	"lastMove ifNotNil: [
		(self lastMoveIsBlackEnPassantEnabledFrom: aChessMove from to: aChessMove to) ifTrue: [aChessMove addEnPassantCategoryEnabled: lastMove].
		(self lastMoveIsWhiteEnPassantEnabledFrom: aChessMove from to: aChessMove to) ifTrue: [aChessMove addEnPassantCategoryEnabled: lastMove].
	]."
	aChessMove pgnPiece: (aChessboard pieceAtCoordinate: aChessMove from) pgnStringForNotation.

	treeRoots ifNil: [treeRoots := OrderedCollection new].

	self addChild: aChessMove parentNode: lastMove.
"	(aChessMove from = #g2 and:[aChessMove to = #b7]) ifTrue: [self halt]."
	lastMove := aChessMove.!

childrenOf: anObject
	"Answer an <OrderedCollection> of the children of anObject within 
	the hierarchy managed by the receiver. If anObject is nil then answer
	the roots. If anObject does not exist in the receiver then raise a suitable 
	exception."

	^anObject isNil
		ifTrue: [treeRoots]
		ifFalse: [self getChildrenOf: anObject]!

childrenOfNode: node
	"Private - Answer an <OrderedCollection> of the child nodes of the <TreeNode>, node."

	^node children!

dettachNode: aChessMoveNode

	self dettachNodeChildrenOfNode: aChessMoveNode.

	aChessMoveNode chessMoveDo: [:chessMove | objectNodeMap removeKey: chessMove]!

dettachNodeChildrenOfNode: aChessMoveNode

	aChessMoveNode childrenDo: [:childNodes | childNodes do: [:eachNode | self dettachNode: eachNode]]!

getChildrenOf: anObject
	"Private - Answer an OrderedCollection of the children of anObject within 
	the hierarchy managed by the receiver. If anObject does not exist 
	in the receiver then raise a suitable exception."

	| node |
	node := self getNodeFor: anObject.
	^node children!

getNodeFor: anObject
	"Private - Answer the <TreeNode> that represents the <Object>, anObject, which
	must be an element of this tree model."

	^(self lookupNode: anObject) ifNil: [self errorNotFound: anObject]!

isEmpty
	^treeRoots isEmpty!

lastMove
	^lastMove!

lastMoveIsBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^lastMove isBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastMoveIsEnPassantEnabler

	lastMove ifNil: [^false].
	^lastMove isEnPassantEnabler!

lastMoveIsWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^lastMove isWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate!

lastSideToMoveOn: aChessboard

	lastMove ifNil: [^game initialSideToMove].
	^(lastMove isBlackOn: aChessboard) ifTrue: [#black] ifFalse: [#white]!

lookupNode: aChessMove

	^objectNodeMap lookup: aChessMove!

newNodeParent: parentNodeOrNil move: aChessMove

	^ChessMoveNode newOn: self move: aChessMove parentNode: parentNodeOrNil!

nextSideToMoveOn: aChessboard

	lastMove ifNil: [^game initialSideToMove].
	^(lastMove isBlackOn: aChessboard) ifTrue: [#white] ifFalse: [#black]!

preOrderDo: aMonadicValuable 
	"Evaluate the <monadicValuable> argument for each of the elements of the receiver. Answers
	the receiver. The elements are enumerated using a 'pre-order' or 'depth-first' traversal
	where the parent is visited before the children."

	treeRoots do: [:each | self preOrderDo: aMonadicValuable on: each]!

preOrderDo: aMonadicValuable on: anObject 

	aMonadicValuable value: anObject.
	(self childrenOf: anObject move) do: [:each | self preOrderDo: aMonadicValuable on: each]!

printMoves
	| stream |

	stream := WriteStream on: String new.
	self printMovesOn: stream.
	^stream contents!

printMovesOn: aStream
	| index |
	index := 1.
	self preOrderDo: [:eachNode | 
		aStream nextPutAll: index printString, '. '.
		eachNode move printPgnOn: aStream.
		aStream cr.
		index := index + 1.
	].!

redoFirstMoveOn: aChessboard 

	treeRoots isEmpty ifTrue: [^self].
	treeRoots first move redoOn: aChessboard.
	lastMove := treeRoots first move.!

redoNextMoveOn: aChessboard 
	| currentNode |

	lastMove ifNil: [^self redoFirstMoveOn: aChessboard].

	currentNode := self lookupNode: lastMove.
	currentNode firstChildDo: [:childNode | 
		childNode move redoOn: aChessboard.
		lastMove := childNode move.
	].

	!

remove: aChessMove ifAbsent: aBlock
	| node |

	node := self lookupNode: aChessMove.
	node ifNil: [^aBlock value].
	node parentNodeDo: [:parentNode | parentNode removeChildNode: node].

	self dettachNode: node!

setGame: aChessGame

	game := aChessGame.
	treeRoots := OrderedCollection new.
	objectNodeMap := Dictionary new.

!

treeRoots
	^treeRoots!

undoLastMoveOn: aChessboard
	| moveToRemove node |

	lastMove ifNil: [^self].
	moveToRemove := lastMove.
	moveToRemove undoOn: aChessboard.

	node := self lookupNode: moveToRemove.
	node parentNodeDo: [:parentNode | 
		parentNode ifNotNil: [lastMove := parentNode move] ifNil: [lastMove := nil].
	]
! !
!ChessMoveTreeList categoriesForMethods!
addChild:parentNode:!public!tree operations! !
annotateMove:on:!move operations!public! !
childrenOf:!private!tree operations! !
childrenOfNode:!private!tree operations! !
dettachNode:!private!tree operations! !
dettachNodeChildrenOfNode:!private!tree operations! !
getChildrenOf:!private!tree operations! !
getNodeFor:!private!tree operations! !
isEmpty!public! !
lastMove!public! !
lastMoveIsBlackEnPassantEnabledFrom:to:!move operations!public! !
lastMoveIsEnPassantEnabler!public! !
lastMoveIsWhiteEnPassantEnabledFrom:to:!move operations!public! !
lastSideToMoveOn:!move operations!public! !
lookupNode:!private!tree operations! !
newNodeParent:move:!public!tree operations! !
nextSideToMoveOn:!move operations!public! !
preOrderDo:!public!tree operations! !
preOrderDo:on:!private!tree operations! !
printMoves!move operations!public! !
printMovesOn:!move operations!public! !
redoFirstMoveOn:!public! !
redoNextMoveOn:!public! !
remove:ifAbsent:!public!tree operations! !
setGame:!private! !
treeRoots!private! !
undoLastMoveOn:!move operations!public! !
!

!ChessMoveTreeList class methodsFor!

icon

	^Icon fromId: 'TreeModelAbstract.ico'!

newOn: aChessGame

	^self new setGame: aChessGame ! !
!ChessMoveTreeList class categoriesForMethods!
icon!public! !
newOn:!public! !
!

