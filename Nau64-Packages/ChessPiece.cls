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

absoluteXRaySquaresDo: aBlock
!

absoluteXRaySquaresFrom: aChessSquare do: aBlock
!

attackedSquaresDo: aBlock

	self validSquaresDo: aBlock!

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

isAbsolutePinned
	self oppositeSideDo: [:oppositeSide | 
		oppositeSide opppositeSlidingPiecesDo: [:piece | | pinnedPieces |
			pinnedPieces := piece pinnedPieces.
			pinnedPieces select: [:pin | (pin pinnedPieceIs: self) and: [pin isAbsolute]].
		]
	].

	^false!

isBishop

	^false!

isBlack

	^chessSide isBlack!

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

pgnString

	self subclassResponsibility!

pgnStringForNotation

	^self pgnString!

pieceCode
	^self class pieceCode!

pinnedPieces
	| pinnedPieces |

	self isSlidingPiece ifFalse: [^OrderedCollection new].
	pinnedPieces := OrderedCollection new.
	self chessboardDo:	[:aChessboard |
			self squaresScopeFrom: self currentChessSquare
				do: [:aSquaresDictionary | 
					aSquaresDictionary squaresCollectionAndOrientationDo: [:squareCollection :orientation | | oppositePieces halted pinnedPiece |
						oppositePieces := 0.
						halted := false.
						squareCollection do: [:chessSquare |
								aChessboard
									pieceAt: chessSquare
									do: [:piece |
										(piece isOppositeSideTo: self)
										ifTrue: [oppositePieces := oppositePieces + 1.
											oppositePieces = 1 ifTrue: [pinnedPiece := piece].
											(oppositePieces > 1 and: [halted not])
											ifTrue: [pinnedPieces add: (ChessPin newOnControl: self pinned: pinnedPiece target: piece orientation: orientation)]]
										ifFalse: [halted := true]
									]
									ifAbsent: []
						]
					]
				]
	].
	^pinnedPieces!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: ' [', chessSide sideName, ']'!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	self subclassResponsibility!

secureSquaresDo: aBlock

	self secureSquaresFrom: self currentChessSquare do: aBlock!

secureSquaresFrom: aChessSquare do: aBlock
	| attackedSquares |

	attackedSquares := OrderedCollection new.
	self oppositeSideDo: [:oppositeSide | 
		oppositeSide piecesDo: [:oppositePiece |
			oppositePiece validSquaresDo: [:square | attackedSquares add: square].
		].
	].

	self validSquaresDictionaryFrom: aChessSquare do: [:squaresDictionary |
		attackedSquares do: [:square | squaresDictionary remove: square].
		squaresDictionary squaresDo: aBlock
	]!

setSide: aChessSide

	chessSide := aChessSide!

sideName
	^chessSide sideName!

squareSize

	^chessSide squareSize!

squaresScopeDo: aBlock

	self squaresScopeFrom: self currentChessSquare do: aBlock!

squaresScopeFrom: aChessSquare

	self subclassResponsibility!

squaresScopeFrom: aChessSquare do: aBlock
	| aSquaresDictionary |
	aSquaresDictionary := self squaresScopeFrom: aChessSquare.
	aBlock value: aSquaresDictionary!

squaresScopeFromCoordiante: aSymbol

	^self squaresScopeFrom: (aSymbol asChessSquareIn: self systemRoot)!

squaresToMoveDo: aBlock

	self validSquaresDo: aBlock!

squaresToMoveFrom: aChessSquare do: aBlock

	self validSquaresDictionaryFrom: aChessSquare do: [:squaresDictionary | squaresDictionary squaresDo: aBlock]!

systemRoot

	^chessSide systemRoot!

validSquaresDictionaryFrom: aChessSquare do: aBlock
	| squaresDictionaryScope |

	squaresDictionaryScope := self squaresScopeFrom: aChessSquare.
	squaresDictionaryScope pruneUnreachableSquares.
	aBlock value: squaresDictionaryScope !

validSquaresDo: aBlock

	self validSquaresFrom: self currentChessSquare do: aBlock!

validSquaresFrom: aChessSquare do: aBlock

	self validSquaresDictionaryFrom: aChessSquare do: [:squaresDictionary | squaresDictionary squaresDo: aBlock]!

validSquaresSizeFrom: aChessSquare 
	| count |

	count := 0.

	self validSquaresFrom: aChessSquare do: [:each | count := count + 1].

	^count!

whiteCodePoint

	^self class whiteCodePoint!

xRaySquaresFrom: aChessSquare xRayCount: anInteger do: aBlock
!

xRaySquaresWithCount: anInteger do: aBlock
! !
!ChessPiece categoriesForMethods!
absoluteXRaySquaresDo:!new framework!public! !
absoluteXRaySquaresFrom:do:!new framework!public! !
attackedSquaresDo:!new framework!public! !
bateryOrientationsFrom:do:!public!tactics! !
blackCodePoint!public!unicode! !
canBeMovedToValidCoordinate:on:!public!testing! !
chessboardDo:!public! !
chessSideDo:!public! !
codePoint!public!unicode! !
defaultColor!public!testing! !
fenString!public! !
forceNumberAt:!public! !
isAbsolutePinned!new framework!public! !
isBishop!public!testing! !
isBlack!public!testing! !
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
pgnString!public! !
pgnStringForNotation!public! !
pieceCode!public! !
pinnedPieces!new framework!public! !
printOn:!public! !
pruneUnreacheableSquaresFrom:!new framework!public! !
secureSquaresDo:!new framework!public! !
secureSquaresFrom:do:!new framework!public! !
setSide:!private! !
sideName!public! !
squareSize!public! !
squaresScopeDo:!new framework!public! !
squaresScopeFrom:!new framework!public! !
squaresScopeFrom:do:!new framework!public! !
squaresScopeFromCoordiante:!new framework!public! !
squaresToMoveDo:!new framework!public! !
squaresToMoveFrom:do:!new framework!public! !
systemRoot!private! !
validSquaresDictionaryFrom:do:!new framework!public! !
validSquaresDo:!new framework!public! !
validSquaresFrom:do:!new framework!public! !
validSquaresSizeFrom:!new framework!public! !
whiteCodePoint!public!unicode! !
xRaySquaresFrom:xRayCount:do:!new framework!public! !
xRaySquaresWithCount:do:!new framework!public! !
!

!ChessPiece class methodsFor!

blackCodePoint

	^9812!

concreteClasses

	^OrderedCollection new 
		add: King;
		add: Knight;
		add: Pawn;
		add: Bishop;
		add: Queen;
		add: Rook;
		yourself
!

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
concreteClasses!public! !
filePrefix!public! !
icon!public! !
newOn:!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

