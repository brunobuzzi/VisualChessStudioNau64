"Filed out from Dolphin Smallalk"!

Object subclass: #ChessPiece
	instanceVariableNames: 'chessSide'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPiece guid: (GUID fromString: '{e62cc00d-9cc1-4589-9866-0b5a44803206}')!
ChessPiece comment: ''!
!ChessPiece categoriesForClass!Kernel-Objects! !
!ChessPiece methodsFor!

canBeMovedToValidCoordinate: symbolCoordinate on: aChessboard

	^(aChessboard squareIsEmptyAtCoordinate: symbolCoordinate) or: 
		[(aChessboard squareNotEmptyAtCoordinate: symbolCoordinate) and: [self isOppositeSideTo: (aChessboard pieceAtCoordinate: symbolCoordinate)]]!

fenString

	self subclassResponsibility!

forceNumberAt: aChessSquare

	^chessSide forceNumberAt: aChessSquare!

isBishop

	^false!

isBlack

	^chessSide isBlack!

isCheckMatedOn: aChessboard

	self shouldNotImplement!

isKing

	^false!

isKnight

	^false!

isOppositeSideTo: aChessPiece

	^(aChessPiece isBlack and: [self isWhite]) or: [aChessPiece isWhite and: [self isBlack]]!

isPawn

	^false!

isQueen

	^false!

isRook

	^false!

isSameSideTo: aChessPiece

	^(aChessPiece isBlack and: [self isBlack]) or: [aChessPiece isWhite and: [self isWhite]]!

isSecureToAttack: aChessSquare on: aChessboard 
	| forceNumber |

	forceNumber := self forceNumberAt: aChessSquare.

	^self isBlack ifTrue: [forceNumber < 0] ifFalse: [forceNumber > 0]!

isSlidingPiece

	^false!

isValidMoveFromCoordinate: originCoordinate to: targetCoordinate
	| rule |

	rule := self defaultMovementRuleClass newFor: self.

	^rule isValidOn: chessSide chessboard from: originCoordinate asChessSquare to: targetCoordinate asChessSquare
!

isWhite

	^chessSide isWhite!

pieceCode
	self subclassResponsibility!

setSide: aChessSide

	chessSide := aChessSide!

squareSize

	^chessSide squareSize! !
!ChessPiece categoriesForMethods!
canBeMovedToValidCoordinate:on:!public!testing! !
fenString!public! !
forceNumberAt:!public! !
isBishop!public!testing! !
isBlack!public!testing! !
isCheckMatedOn:!public! !
isKing!public!testing! !
isKnight!public!testing! !
isOppositeSideTo:!public! !
isPawn!public!testing! !
isQueen!public!testing! !
isRook!public!testing! !
isSameSideTo:!public! !
isSecureToAttack:on:!public! !
isSlidingPiece!public! !
isValidMoveFromCoordinate:to:!public! !
isWhite!public!testing! !
pieceCode!public! !
setSide:!private! !
squareSize!public! !
!

!ChessPiece class methodsFor!

filePrefix

	^'piece'!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\b',self filePrefix , 'w.ico')!

newOn: aChessSide

	^self new setSide: aChessSide! !
!ChessPiece class categoriesForMethods!
filePrefix!public! !
icon!public! !
newOn:!public! !
!

