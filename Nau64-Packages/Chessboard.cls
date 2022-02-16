"Filed out from Dolphin Smallalk"!

Object subclass: #Chessboard
	instanceVariableNames: 'squares orientation squareSize blackSide whiteSide pieces'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Chessboard guid: (GUID fromString: '{225a5e19-20b8-44e4-84d2-baedf2967205}')!
Chessboard comment: ''!
!Chessboard categoriesForClass!Kernel-Objects! !
!Chessboard methodsFor!

allAttackedSquaresByBlackDo: aBlock

	^blackSide allAttackedSquaresDo: aBlock!

allAttackedSquaresByWhiteDo: aBlock

	^whiteSide allAttackedSquaresDo: aBlock!

blackBishops

	^pieces select: [:each | each isBishop and: [each isBlack]]!

blackKing

	^pieces select: [:each | each isKing and: [each isBlack]]!

blackKnights

	^pieces select: [:each | each isKnight and: [each isBlack]]!

blackPawns

	^pieces select: [:each | each isPawn and: [each isBlack]]!

blackPieces

	^pieces select: [:each | each isBlack]!

blackPiecesDo: aBlock

	^self blackPieces do: aBlock!

blackPiecesSize

	^(pieces select: [:each | each isBlack]) size!

blackQueens

	^pieces select: [:each | each isQueen and: [each isBlack]]!

blackRooks

	^pieces select: [:each | each isRook and: [each isBlack]]!

blackSideDo: aBlock

	aBlock value: blackSide!

currentChessSquareFor: aChessPiece

	pieces keysAndValuesDo: [:symbol :piece | (piece == aChessPiece) ifTrue: [^symbol asChessSquare]].

	self error: 'Piece not found'!

halfSquareSize
	^squareSize // 2!

isReversed

	^orientation == #reversed!

movePieceFromCoordiante: originSymbolCoordiante to: targetSymbolCoordinate
	| originPiece targetPiece |

	originPiece := self pieceAtCoordinate: originSymbolCoordiante.
	targetPiece := self pieceAtCoordinate: targetSymbolCoordinate.

	targetPiece ifNotNil: [self removePieceAtCoordiante: targetSymbolCoordinate].

	originPiece ifNil: [^self error: 'No such Chess Piece'].

	self removePieceAtCoordiante: originSymbolCoordiante.

	self pieceAtCoordinate: targetSymbolCoordinate put: originPiece.
	!

newPiece: pieceClass isBlack: aBoolean at: aChessSquare
	| newPiece |

	newPiece := pieceClass newOn: (aBoolean ifTrue: [blackSide] ifFalse: [whiteSide]).

	self pieceAt: aChessSquare put: newPiece!

oppositeSideOf: aChessPiece

	^aChessPiece isWhite ifTrue: [blackSide] ifFalse: [whiteSide]!

pieceAt: aChessSquare

	^self pieceAt: aChessSquare ifAbsent: []!

pieceAt: aChessSquare do: aMonadicValuable ifAbsent: aNiladicValuable 
	| piece |
	piece := self pieceAt: aChessSquare ifAbsent: [^aNiladicValuable value].
	aMonadicValuable value: piece!

pieceAt: aChessSquare ifAbsent: aBlock

	^pieces at: aChessSquare name ifAbsent: aBlock!

pieceAt: aChessSquare put: aChessPiece

	^pieces at: aChessSquare name asSymbol put: aChessPiece!

pieceAtCoordinate: symbolCoordinate 

	^pieces at: symbolCoordinate ifAbsent: []!

pieceAtCoordinate: symbolCoordinate put: aChessPiece

	^pieces at: symbolCoordinate put: aChessPiece!

piecesDo: aBlock

	pieces do: aBlock!

piecesSize

	^pieces size!

printEncoded!

removePieceAt: aChessSquare

	^pieces removeKey: aChessSquare name ifAbsent: []!

removePieceAtCoordiante: symbolCoordiante

	^pieces removeKey: symbolCoordiante ifAbsent: []!

setBlackPaws

	pieces
		at: #a7 put: (Pawn newOn: blackSide);
		at: #b7 put: (Pawn newOn: blackSide);
		at: #c7 put: (Pawn newOn: blackSide);
		at: #d7 put: (Pawn newOn: blackSide);
		at: #e7 put: (Pawn newOn: blackSide);
		at: #f7 put: (Pawn newOn: blackSide);
		at: #g7 put: (Pawn newOn: blackSide);
		at: #h7 put: (Pawn newOn: blackSide).!

setBlackPieces

	self setBlackPaws.

	pieces
		at: #a8 put: (Rook newOn: blackSide);
		at: #b8 put: (Knight newOn: blackSide);
		at: #c8 put: (Bishop newOn: blackSide);
		at: #d8 put: (Queen newOn: blackSide);
		at: #e8 put: (King newOn: blackSide);
		at: #f8 put: (Bishop newOn: blackSide);
		at: #g8 put: (Knight newOn: blackSide);
		at: #h8 put: (Rook newOn: blackSide).!

setPawns

	self setWhitePaws.
	self setBlackPaws.!

setPieces
	self setSquares.

	self setWhitePieces.
	self setBlackPieces.!

setSquares

	squares := ChessSquare allSquares.
	orientation := #normal.
	squareSize := 60.
	pieces := Dictionary new.

	blackSide := ChessSideBlack newOn: self.
	whiteSide := ChessSideWhite newOn: self.
!

setWhitePaws

	pieces
		at: #a2 put: (Pawn newOn: whiteSide);
		at: #b2 put: (Pawn newOn: whiteSide);
		at: #c2 put: (Pawn newOn: whiteSide);
		at: #d2 put: (Pawn newOn: whiteSide);
		at: #e2 put: (Pawn newOn: whiteSide);
		at: #f2 put: (Pawn newOn: whiteSide);
		at: #g2 put: (Pawn newOn: whiteSide);
		at: #h2 put: (Pawn newOn: whiteSide).!

setWhitePieces

	self setWhitePaws.
	pieces
		at: #a1 put: (Rook newOn: whiteSide);
		at: #b1 put: (Knight newOn: whiteSide);
		at: #c1 put: (Bishop newOn: whiteSide);
		at: #d1 put: (Queen newOn: whiteSide);
		at: #e1 put: (King newOn: whiteSide);
		at: #f1 put: (Bishop newOn: whiteSide);
		at: #g1 put: (Knight newOn: whiteSide);
		at: #h1 put: (Rook newOn: whiteSide).!

squareFor: aPiece

	pieces keysAndValuesDo: [:symbol :piece | (aPiece == piece) ifTrue:[^symbol asChessSquare]].

	self error: 'No such Piece'!

squareIsEmptyAtCoordinate:  symbolCoordinate

	^(pieces includesKey: symbolCoordinate) not!

squareNotEmptyAtCoordinate: symbolCoordinate

	^pieces includesKey: symbolCoordinate!

squaresDo: aBlock

	squares do: aBlock!

squareSize
	^squareSize!

toggleOrientation

	(orientation == #normal) ifTrue: [^orientation := #reversed].

	orientation := #normal!

whiteBishops

	^pieces select: [:each | each isBishop and: [each isWhite]]!

whiteKing

	^pieces select: [:each | each isKing and: [each isWhite]]!

whiteKnights

	^pieces select: [:each | each isKnight and: [each isWhite]]!

whitePawns

	^pieces select: [:each | each isPawn and: [each isWhite]]!

whitePieces

	^pieces reject: [:each | each isBlack]!

whitePiecesDo: aBlock

	^self whitePieces do: aBlock!

whitePiecesSize

	^(pieces reject: [:each | each isBlack]) size!

whiteQueens

	^pieces select: [:each | each isQueen and: [each isWhite]]!

whiteRooks

	^pieces select: [:each | each isRook and: [each isWhite]]!

whiteSideDo: aBlock

	aBlock value: whiteSide! !
!Chessboard categoriesForMethods!
allAttackedSquaresByBlackDo:!public! !
allAttackedSquaresByWhiteDo:!public! !
blackBishops!pieces-black!public! !
blackKing!pieces-black!public! !
blackKnights!pieces-black!public! !
blackPawns!pieces-black!public! !
blackPieces!pieces-black!public! !
blackPiecesDo:!pieces-black!public! !
blackPiecesSize!pieces-black!public! !
blackQueens!pieces-black!public! !
blackRooks!pieces-black!public! !
blackSideDo:!pieces-black!public! !
currentChessSquareFor:!iteration!public! !
halfSquareSize!public! !
isReversed!public! !
movePieceFromCoordiante:to:!chessboard contents!public! !
newPiece:isBlack:at:!public! !
oppositeSideOf:!iteration!public! !
pieceAt:!chessboard contents!public! !
pieceAt:do:ifAbsent:!public! !
pieceAt:ifAbsent:!chessboard contents!public! !
pieceAt:put:!chessboard contents!public! !
pieceAtCoordinate:!chessboard contents!public! !
pieceAtCoordinate:put:!chessboard contents!public! !
piecesDo:!iteration!public! !
piecesSize!public! !
printEncoded!public! !
removePieceAt:!chessboard contents!public! !
removePieceAtCoordiante:!chessboard contents!public! !
setBlackPaws!private! !
setBlackPieces!private! !
setPawns!private! !
setPieces!private! !
setSquares!private! !
setWhitePaws!private! !
setWhitePieces!private! !
squareFor:!chessboard contents!public! !
squareIsEmptyAtCoordinate:!chessboard contents!public! !
squareNotEmptyAtCoordinate:!chessboard contents!public! !
squaresDo:!iteration!public! !
squareSize!public! !
toggleOrientation!public! !
whiteBishops!pieces-white!public! !
whiteKing!pieces-white!public! !
whiteKnights!pieces-white!public! !
whitePawns!pieces-white!public! !
whitePieces!pieces-white!public! !
whitePiecesDo:!pieces-white!public! !
whitePiecesSize!pieces-white!public! !
whiteQueens!pieces-white!public! !
whiteRooks!pieces-white!public! !
whiteSideDo:!pieces-black!public! !
!

!Chessboard class methodsFor!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\chess_icon-icons.com_65163.ico')!

newEmpty

	^super new setSquares!

newWithAllPieces
	^self new setPieces!

newWithPawns
	^self newEmpty setPawns! !
!Chessboard class categoriesForMethods!
icon!public! !
newEmpty!public! !
newWithAllPieces!public! !
newWithPawns!public! !
!

