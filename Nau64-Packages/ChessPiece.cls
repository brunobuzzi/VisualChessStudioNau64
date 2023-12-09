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

bateryOrientationsFrom: aChessOrientationVector do: aBlock

!

blackCodePoint

	^self class blackCodePoint!

canBeMovedToValidCoordinate: symbolCoordinate on: aChessboard

	^(aChessboard squareIsEmptyAtCoordinate: symbolCoordinate) or: 
		[(aChessboard squareNotEmptyAtCoordinate: symbolCoordinate) and: [self isOppositeSideTo: (aChessboard pieceAtCoordinate: symbolCoordinate)]]!

chessboardDo: aBlock

	self chessSideDo: [:aChessSide | aChessSide chessboardDo: aBlock]!

chessSideDo: aBlock

	aBlock value: chessSide!

codePoint

	^chessSide codePointFor: self!

defaultColor

	^chessSide defaultColor!

fenString

	self subclassResponsibility!

forceNumberAt: aChessSquare

	^chessSide forceNumberAt: aChessSquare!

generateSquaresScopeFrom: aChessSquareScope

	self subclassResponsibility!

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

isOppositeTo: aChessSide

	^(chessSide == aChessSide) not!

isPawn

	^false!

isQueen

	^false!

isRook

	^false!

isSameSideAs: aChessPiece

	"aChessPieceOrNil ifNil: [^false]." "ugly/buggy code removed"

	^(aChessPiece isBlack and: [self isBlack]) or: [aChessPiece isWhite and: [self isWhite]]!

isSecureToAttack: aChessSquare on: aChessboard 
	| forceNumber |

	forceNumber := self forceNumberAt: aChessSquare.

	^self isBlack ifTrue: [forceNumber < 0] ifFalse: [forceNumber > 0]!

isSlidingPiece

	^false!

isWhite

	^chessSide isWhite!

king
	^chessSide king!

movesAreCompatibleWith: aChessOrientationVector

	^false!

oppositeSideDo: aMonadicValuable 

	self isBlack 
	ifTrue: [chessSide chessboardDo: [:chessboard | chessboard whiteSideDo: aMonadicValuable]] 
	ifFalse: [chessSide chessboardDo: [:chessboard | chessboard blackSideDo: aMonadicValuable]]!

oppositeSideName
	^chessSide oppositeSideName!

orientationsDo: aBlock

	self orientations do: aBlock!

pieceCode
	^self class pieceCode!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: ' [', chessSide sideName, ']'!

setSide: aChessSide

	chessSide := aChessSide!

sideName
	^chessSide sideName!

slidingPieceAt: pieceChessSquare canReachSkippingOnePiece: targetChessSquare on: aChessboard
	^self newMovementEngine slidingPieceAt: pieceChessSquare canReachSkippingOnePiece: targetChessSquare on: aChessboard!

squareSize

	^chessSide squareSize!

systemRoot

	^chessSide systemRoot!

whiteCodePoint

	^self class whiteCodePoint! !
!ChessPiece categoriesForMethods!
bateryOrientationsFrom:do:!public!tactics! !
blackCodePoint!public!unicode! !
canBeMovedToValidCoordinate:on:!public!testing! !
chessboardDo:!public! !
chessSideDo:!public! !
codePoint!public!unicode! !
defaultColor!public!testing! !
fenString!public! !
forceNumberAt:!public! !
generateSquaresScopeFrom:!new framework!public! !
isBishop!public!testing! !
isBlack!public!testing! !
isCheckMatedOn:!public! !
isKing!public!testing! !
isKnight!public!testing! !
isOppositeSideTo:!public! !
isOppositeTo:!public! !
isPawn!public!testing! !
isQueen!public!testing! !
isRook!public!testing! !
isSameSideAs:!public! !
isSecureToAttack:on:!public! !
isSlidingPiece!public! !
isWhite!public!testing! !
king!public! !
movesAreCompatibleWith:!public! !
oppositeSideDo:!public! !
oppositeSideName!public! !
orientationsDo:!new framework!public! !
pieceCode!public! !
printOn:!public! !
setSide:!private! !
sideName!public! !
slidingPieceAt:canReachSkippingOnePiece:on:!public! !
squareSize!public! !
systemRoot!private! !
whiteCodePoint!public!unicode! !
!

!ChessPiece class methodsFor!

blackCodePoint

	^9812!

filePrefix

	^'piece'!

icon
	"^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\b',self filePrefix , 'w.ico')"

	^TextTileIcon text: (Character codePoint: self blackCodePoint) asUtf16String fontName: 'Malgun Gothic'!

newOn: aChessSide

	^self new setSide: aChessSide!

pieceCode

	self subclassResponsibility!

whiteCodePoint

	self subclassResponsibility! !
!ChessPiece class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
icon!public! !
newOn:!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

