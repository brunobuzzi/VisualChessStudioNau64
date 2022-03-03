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

	aChessMove setCategoriesFrom:  aChessboard.

	lastMove ifNotNil: [
		(self lastMoveIsBlackEnPassantEnablerFrom: aChessMove from to: aChessMove to) ifTrue: [aChessMove addEnPassantCategory].
		(self lastMoveIsWhiteEnPassantEnablerFrom: aChessMove from to: aChessMove to) ifTrue: [aChessMove addEnPassantCategory].
	].

	treeRoots ifNil: [treeRoots := OrderedCollection new].

	self addChild: aChessMove parentNode: lastMove.
	
	lastMove := aChessMove.!

dettachNode: aChessMoveNode

	self dettachNodeChildrenOfNode: aChessMoveNode.

	aChessMoveNode chessMoveDo: [:chessMove | objectNodeMap removeKey: chessMove]!

dettachNodeChildrenOfNode: aChessMoveNode

	aChessMoveNode childrenDo: [:childNodes | childNodes do: [:eachNode | self dettachNode: eachNode]]!

isEmpty
	^treeRoots isEmpty!

lastMoveIsBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^lastMove isBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastMoveIsWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^lastMove isWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate!

lastSideToMoveOn: aChessboard

	^(lastMove isBlackOn: aChessboard) ifTrue: [#black] ifFalse: [#white]!

lookupNode: aChessMove

	^objectNodeMap lookup: aChessMove!

newNodeParent: parentNodeOrNil move: aChessMove

	^ChessMoveNode newOn: self move: aChessMove parentNode: parentNodeOrNil!

nextSideToMoveOn: aChessboard

	^(lastMove isBlackOn: aChessboard) ifTrue: [#white] ifFalse: [#black]!

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
dettachNode:!private!tree operations! !
dettachNodeChildrenOfNode:!private!tree operations! !
isEmpty!public! !
lastMoveIsBlackEnPassantEnablerFrom:to:!move operations!public! !
lastMoveIsWhiteEnPassantEnablerFrom:to:!move operations!public! !
lastSideToMoveOn:!move operations!public! !
lookupNode:!private! !
newNodeParent:move:!public!tree operations! !
nextSideToMoveOn:!move operations!public! !
redoFirstMoveOn:!public! !
redoNextMoveOn:!public! !
remove:ifAbsent:!public!tree operations! !
setGame:!private! !
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

