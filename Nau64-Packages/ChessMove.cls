"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMove
	instanceVariableNames: 'list from to categories'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMove guid: (GUID fromString: '{0c860303-9721-4ac4-a233-829e9b5e5348}')!
ChessMove comment: ''!
!ChessMove categoriesForClass!Kernel-Objects! !
!ChessMove methodsFor!

isBlackEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^((from second = $2 and: [to second = $4]) and: [((originCoordinate first asciiValue - 1) = to first asciiValue) or: [(originCoordinate first asciiValue + 1) = to first asciiValue]]) and: [targetCoordinate first = to first]!

isBlackOn: aChessboard

	^(aChessboard pieceAtCoordinate: to) isBlack!

isWhiteEnPassantEnablerFrom: originCoordinate to: targetCoordinate

	^((from second = $7 and: [to second = $5]) and: [((originCoordinate first asciiValue - 1) = to first asciiValue) or: [(originCoordinate first asciiValue + 1) = to first asciiValue]]) and: [targetCoordinate first = to first]!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', from, '>>', to, ']'!

setCategoriesFrom: aChessboard 
	| originPiece targetPiece |

	originPiece := aChessboard pieceAtCoordinate: from.
	targetPiece := aChessboard pieceAtCoordinate: to.
	targetPiece ifNotNil: [categories add: ChessCaptureMove new].

	(from = #e1 and: [originPiece isKing and:[originPiece isWhite and:[to = #g1]]]) ifTrue: [categories add: ChessKingSideCastleMove new].
	(from = #e1 and: [originPiece isKing and:[originPiece isWhite and:[to = #c1]]]) ifTrue: [categories add: ChessQueenSideCastleMove new].

	(from = #e8 and: [originPiece isKing and:[originPiece isBlack and:[to = #g8]]]) ifTrue: [categories add: ChessKingSideCastleMove new].
	(from = #e8 and: [originPiece isKing and:[originPiece isBlack and:[to = #c8]]]) ifTrue: [categories add: ChessQueenSideCastleMove new].

	(originPiece isPawn and: [originPiece isWhite and: [to second = $8]]) ifTrue: [categories add: ChessPromotionMove new].
	(originPiece isPawn and: [originPiece isBlack and: [to second = $1]]) ifTrue: [categories add: ChessPromotionMove new].


	

!

setList: aChessMoveList from: originCoordinate to: targetCoordinate

	list := aChessMoveList.
	from := originCoordinate.
	to := targetCoordinate.
	categories := OrderedCollection new.! !
!ChessMove categoriesForMethods!
isBlackEnPassantEnablerFrom:to:!public! !
isBlackOn:!public! !
isWhiteEnPassantEnablerFrom:to:!public! !
printOn:!public! !
setCategoriesFrom:!public! !
setList:from:to:!public! !
!

!ChessMove class methodsFor!

icon

	^Icon fromId: 'ValueConverter.ico'!

newOn: aChessMoveList from: originCoordinate to: targetCoordinate

	^self new setList: aChessMoveList from: originCoordinate to: targetCoordinate! !
!ChessMove class categoriesForMethods!
icon!public! !
newOn:from:to:!public! !
!

