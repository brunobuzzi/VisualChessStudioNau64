"Filed out from Dolphin Smallalk"!

Object subclass: #ChessSide
	instanceVariableNames: 'chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSide guid: (GUID fromString: '{40355e9d-4755-4839-85ec-7540b069cd63}')!
ChessSide comment: ''!
!ChessSide categoriesForClass!Unclassified! !
!ChessSide methodsFor!

anyPawnAtEnPassantMoveFrom: aSymbol 
	
	^self isBlack 
	ifTrue: [self anyBlackPawnAtEnPassantMoveFrom: aSymbol] 
	ifFalse: [self anyWhitePawnAtEnPassantMoveFrom: aSymbol]!

chessboardDo: aBlock

	aBlock value: chessboard!

codePointFor: aChessPiece

	self subclassResponsibility!

currentChessSquareFor: aChessPiece

	^chessboard currentChessSquareFor: aChessPiece!

defaultColor

	self subclassResponsibility!

isBlack
	^false!

isChecked
	
	^self king isChecked!

isStaledMated
	| staleMate |

	staleMate := true.
	self piecesDo: [:piece | piece squaresToMoveDo: [:square | staleMate := false]].

	^staleMate!

isStillInCheckAfterMoveFrom: originChessSquare to: targetChessSquare
	"At this point we know that the move is already valid"
	| isChecked targetPiece |

	targetPiece := chessboard pieceAt: targetChessSquare ifAbsent: [].

	chessboard movePieceFromCoordiante: originChessSquare coordinate to: targetChessSquare coordinate.
	
	isChecked := self king isChecked.

	chessboard movePieceFromCoordiante: targetChessSquare coordinate to: originChessSquare coordinate.
	targetPiece notNil ifTrue: [chessboard pieceAt: targetChessSquare put: targetPiece].

	^isChecked!

isWhite
	^false!

king
	self piecesDo: [:each | each isKing ifTrue: [^each ]].
	self error: 'King not found'!

oppositePiecesDo: aBlock

	self subclassResponsibility!

oppositeSideName

	^self subclassResponsibility!

opppositeSlidingPiecesDo: aBlock

	self oppositePiecesDo: [:piece | piece isSlidingPiece ifTrue: [aBlock value: piece]]!

piecesDo: aBlock

	self subclassResponsibility!

promote: aPawn at: symbolSquare to: promotableChessClass
	| currentSquare |

	(aPawn validPromotionClasses includes: promotableChessClass) ifFalse: [self error: 'Can not promote: [', promotableChessClass name, ']'].

	currentSquare := aPawn currentChessSquare.
	chessboard removePieceAt: currentSquare.

	aPawn chessSideDo: [:chessSide | 
		chessboard pieceAt: (self systemRoot squareAt: symbolSquare) put: (promotableChessClass newOn: chessSide)
	].!

setChessboard: aChessBoard

	chessboard := aChessBoard.!

sideName

	^self subclassResponsibility!

slidingPiecesDo: aBlock

	self piecesDo: [:piece | piece isSlidingPiece ifTrue: [aBlock value: piece]]!

squareSize

	^chessboard squareSize!

squaresToMoveDo: aBlock
	| squares |

	squares := OrderedCollection new.
	self piecesDo: [:piece | piece squaresToMoveDo: [:square | squares add: square]].

	squares do: aBlock!

systemRoot

	^chessboard systemRoot! !
!ChessSide categoriesForMethods!
anyPawnAtEnPassantMoveFrom:!public! !
chessboardDo:!public! !
codePointFor:!public! !
currentChessSquareFor:!public! !
defaultColor!public! !
isBlack!public! !
isChecked!public! !
isStaledMated!public! !
isStillInCheckAfterMoveFrom:to:!public! !
isWhite!public! !
king!public! !
oppositePiecesDo:!public! !
oppositeSideName!public! !
opppositeSlidingPiecesDo:!public! !
piecesDo:!public! !
promote:at:to:!public! !
setChessboard:!private! !
sideName!public! !
slidingPiecesDo:!public! !
squareSize!public! !
squaresToMoveDo:!public! !
systemRoot!private! !
!

!ChessSide class methodsFor!

filePrefix

	^'bblackcellw'!

icon
	^Boolean icon!

newOn: aChessBoard

	^self new setChessboard: aChessBoard! !
!ChessSide class categoriesForMethods!
filePrefix!public! !
icon!public! !
newOn:!public! !
!

