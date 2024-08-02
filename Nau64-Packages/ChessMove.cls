"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMove
	instanceVariableNames: 'list from to categories pgnPiece pieceIsWhite'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMove guid: (GUID fromString: '{0c860303-9721-4ac4-a233-829e9b5e5348}')!
ChessMove comment: ''!
!ChessMove categoriesForClass!Kernel-Objects! !
!ChessMove methodsFor!

addEnPassantCategoryEnabled: aChessMove
	categories add: (ChessEnPassantEnablerMove newOn: self enabler: aChessMove)!

from

	^from!

index

	^list indexOf: self!

isBlackCurrentSideMovingOn: aChessboard

	^(aChessboard pieceAtCoordinate: from) isBlack!

isBlackEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^((from second = $2 and: [to second = $4]) 
			and: [((originCoordinate first asciiValue - 1) = to first asciiValue) 
				or: [(originCoordinate first asciiValue + 1) = to first asciiValue]]) 
		and: [targetCoordinate first = to first]!

isBlackOn: aChessboard

	^(aChessboard squareIsEmptyAtCoordinate: to)
	ifFalse: [(aChessboard pieceAtCoordinate: to) isBlack]
	ifTrue: [(aChessboard pieceAtCoordinate: from) isBlack]!

isCastle

	^categories anySatisfy: [:each | each isCastle]!

isEnPassantEnabler
	^categories anySatisfy: [:each | each isEnPassantEnabler]!

isPromotion
	^categories anySatisfy: [:each | each isPromotion]!

isWhiteEnPassantEnabledFrom: originCoordinate to: targetCoordinate

	^((from second = $7 and: [to second = $5]) 
			and: [((originCoordinate first asciiValue - 1) = to first asciiValue) 
				or: [(originCoordinate first asciiValue + 1) = to first asciiValue]]) 
		and: [targetCoordinate first = to first].
	!

isWhiteOn: aChessboard

	^(aChessboard squareIsEmptyAtCoordinate: to)
	ifFalse: [(aChessboard pieceAtCoordinate: to) isWhite]
	ifTrue: [(aChessboard pieceAtCoordinate: from) isWhite]!

performPieceSwitchFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard withPostActionOn: aChessGameExecutor

	(categories isEmpty or: [categories allSatisfy: [:each | each isEnPassantEnabler]])
	ifTrue: [aChessboard movePieceFromCoordiante: from to: to]
	ifFalse: [categories do: [:each | each performPieceSwitchFrom: from to: to on: aChessboard withPostActionOn: aChessGameExecutor]].

	aChessGameExecutor disableCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard.

	
!

performPieceSwitchFrom: originSymbolCoordiante to: targetSymbolCoordinate on: aChessboard withPostActionOn: aChessGame presenter: aPresenter

	categories isEmpty 
	ifTrue: [aChessboard movePieceFromCoordiante: from to: to]
	ifFalse: [categories do: [:each | each performPieceSwitchFrom: from to: to on: aChessboard withPostActionOn: aChessGame presenter: aPresenter]].

	aChessGame disableCastleForPieceMovedFrom: originSymbolCoordiante on: aChessboard.

	
!

pgnPiece
	^pgnPiece!

pgnPiece: aString
	pgnPiece := aString!

pieceIsWhite

	^pieceIsWhite!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', pgnPiece, from, '>>', to, ']'!

printPgn
	| stream |

	stream := WriteStream on: String new.
	self printPgnOn: stream.
	^stream contents!

printPgnOn: aStream

	aStream nextPutAll: pgnPiece, to!

promotion
	^categories detect: [:each | each isPromotion]!

redoOn: aChessboard
	(categories reject: [:each | each isEnPassantEnabler]) isEmpty
		ifTrue: [^aChessboard movePieceFromCoordiante: from to: to].
	categories do: [:each | each redoOn: aChessboard]!

setCategoriesFrom: aChessboard 
	| originPiece targetPiece |

	originPiece := aChessboard pieceAtCoordinate: from.
	targetPiece := aChessboard pieceAtCoordinate: to.
	targetPiece ifNotNil: [categories add: (ChessCaptureMove newOn: self capturedPiece: targetPiece)].
	"WHITE CASTLE"
	(from = #e1 and: [originPiece isKing and:[originPiece isWhite and:[to = #g1]]]) ifTrue: [^categories add: (ChessKingSideCastleMove newOn: self)].
	(from = #e1 and: [originPiece isKing and:[originPiece isWhite and:[to = #c1]]]) ifTrue: [^categories add: (ChessQueenSideCastleMove newOn: self)].
	"BLACK CASTLE"
	(from = #e8 and: [originPiece isKing and:[originPiece isBlack and:[to = #g8]]]) ifTrue: [^categories add: (ChessKingSideCastleMove newOn: self)].
	(from = #e8 and: [originPiece isKing and:[originPiece isBlack and:[to = #c8]]]) ifTrue: [^categories add: (ChessQueenSideCastleMove newOn: self)].
	"PROMOTION"
	(originPiece isPawn and: [originPiece isWhite and: [to second = $8]]) ifTrue: [^categories add: (ChessPromotionMove newOn: self)].
	(originPiece isPawn and: [originPiece isBlack and: [to second = $1]]) ifTrue: [^categories add: (ChessPromotionMove newOn: self)].
	"EN-PASSANT ENABLER"
	((originPiece isPawn and: [originPiece isWhite]) and: [from second = $2 and: [to second = $4]]) ifTrue: [^categories add: (ChessEnPassantEnablerMove newOn: self)].
	((originPiece isPawn and: [originPiece isBlack]) and: [from second = $7 and: [to second = $5]]) ifTrue: [^categories add: (ChessEnPassantEnablerMove newOn: self)].
	"EN-PASSANT CAPTURE"
	list lastMoveIsEnPassantEnabler 
	ifTrue: [
		"WHITE CAPTURE"
		((originPiece isWhite and: [(from second = $5) and: [to second = $6]]) and: [(aChessboard systemRoot lateralFilesOf: to first) includes: from first])
		ifTrue: [^categories add: (ChessEnPassantCaptureMove newOn: self enabler: list lastMove)].
		"BLACK CAPTURE"
		((originPiece isWhite and: [(from second = $5) and: [to second = $6]]) and: [(aChessboard systemRoot lateralFilesOf: to first) includes: from first])
		ifTrue: [^categories add: (ChessEnPassantCaptureMove newOn: self enabler: list lastMove)].
	].

!

setList: aChessMoveList from: originCoordinate to: targetCoordinate

	list := aChessMoveList.
	from := originCoordinate.
	to := targetCoordinate.
	categories := OrderedCollection new.!

setPieceBlack

	pieceIsWhite := false!

setPieceWhite

	pieceIsWhite := true!

to

	^to!

undoOn: aChessboard

	self assert: [pgnPiece = (aChessboard pieceAtCoordinate: to) pgnStringForNotation].

	categories isEmpty ifTrue: [^aChessboard movePieceFromCoordiante: to to: from].

	categories do: [:each | each undoOn: aChessboard]! !
!ChessMove categoriesForMethods!
addEnPassantCategoryEnabled:!public! !
from!public! !
index!public! !
isBlackCurrentSideMovingOn:!public! !
isBlackEnPassantEnabledFrom:to:!en passant!public! !
isBlackOn:!public! !
isCastle!public! !
isEnPassantEnabler!public! !
isPromotion!public! !
isWhiteEnPassantEnabledFrom:to:!en passant!public! !
isWhiteOn:!public! !
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
performPieceSwitchFrom:to:on:withPostActionOn:presenter:!public! !
pgnPiece!accessing!public! !
pgnPiece:!accessing!public! !
pieceIsWhite!accessing!public! !
printOn:!public! !
printPgn!public! !
printPgnOn:!public! !
promotion!public! !
redoOn:!public! !
setCategoriesFrom:!public! !
setList:from:to:!private! !
setPieceBlack!accessing!public! !
setPieceWhite!accessing!public! !
to!public! !
undoOn:!public! !
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

