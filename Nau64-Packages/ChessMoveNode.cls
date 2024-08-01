"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMoveNode
	instanceVariableNames: 'tree parentNode children move'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMoveNode guid: (GUID fromString: '{7750e0cd-33a3-4b49-a9b4-3e0b083bf6b1}')!
ChessMoveNode comment: ''!
!ChessMoveNode categoriesForClass!Unclassified! !
!ChessMoveNode methodsFor!

addChildNode: aChessMoveNode

	^children add: aChessMoveNode!

chessMoveDo: monadicBlock

	monadicBlock value: move!

children

	^children!

firstChildDo: aBlock

	children isEmpty ifTrue: [^self].

	aBlock value: children first!

hasChildren

	^children notEmpty!

index
	| tempNode index |

	index := 1.
	tempNode := parentNode.
	[tempNode notNil] whileTrue: [
		tempNode := tempNode parentNode.
		index := index + 1.

	].
	
	^(index // 2) + 1

!

move

	^move!

object
	^move!

parentNode

	^parentNode!

parentNodeDo: monadicBlock

	monadicBlock value: parentNode!

printOn: aStream

	aStream nextPutAll: 'ChessNode('.
	move printOn: aStream.
	aStream nextPutAll: ')'.!

printPgn
	^move printPgn!

removeChildNode: aChessMoveNode

	children remove: aChessMoveNode ifAbsent: [self error: 'Node does not exist'].
	aChessMoveNode resetParent.
	^aChessMoveNode!

resetParent

	parentNode := nil!

setTree: aChessMoveTreeList move: aChessMove parentNode: aChessMoveNodeOrNil

	tree := aChessMoveTreeList.
	parentNode := aChessMoveNodeOrNil.
	children := OrderedCollection new.
	move := aChessMove! !
!ChessMoveNode categoriesForMethods!
addChildNode:!public! !
chessMoveDo:!public! !
children!public! !
firstChildDo:!public! !
hasChildren!public! !
index!public! !
move!public! !
object!public! !
parentNode!private! !
parentNodeDo:!public! !
printOn:!public! !
printPgn!public! !
removeChildNode:!public! !
resetParent!public! !
setTree:move:parentNode:!private! !
!

!ChessMoveNode class methodsFor!

newOn: aChessMoveTreeList move: aChessMove parentNode: aChessMoveNodeOrNil

	^self new setTree: aChessMoveTreeList move: aChessMove parentNode: aChessMoveNodeOrNil! !
!ChessMoveNode class categoriesForMethods!
newOn:move:parentNode:!public! !
!

