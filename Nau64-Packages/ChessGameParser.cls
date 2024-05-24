"Filed out from Dolphin Smallalk"!

ChessParser subclass: #ChessGameParser
	instanceVariableNames: 'gameProperties whitePositions blackPositions parsedMoves'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGameParser guid: (GUID fromString: '{bf5c7ec3-1fb2-4dee-b96d-ae42fc3e24d5}')!
ChessGameParser comment: ''!
!ChessGameParser categoriesForClass!Unclassified! !
!ChessGameParser methodsFor!

blackPieceAt: aSymbol ifNone: aBlock

	^blackPositions at: aSymbol ifAbsent: aBlock!

moveBlackPieceFrom: originSymbol to: targetSymbol
	| piece |
	piece := self blackPieceAt: originSymbol ifNone: [self error: 'Piece not found'].
	blackPositions removeKey: originSymbol.
	blackPositions at: targetSymbol put: piece.!

moveWhitePieceFrom: originSymbol to: targetSymbol
	| piece |
	piece := self whitePieceAt: originSymbol ifNone: [self error: 'Piece not found'].
	whitePositions removeKey: originSymbol.
	whitePositions at: targetSymbol put: piece.!

parse
	self parseGameData.
	self parseGameMoves.
!

parseGameData

	self subclassResponsibility!

parseGameMoves

	self subclassResponsibility!

propertyNamed: aString

	^gameProperties at: aString ifAbsent: []!

setInitialPositions
	whitePositions := Dictionary new.
	blackPositions := Dictionary new.

	whitePositions at: #a1 put: #T.
	whitePositions at: #b1 put: #N.
	whitePositions at: #c1 put: #B.
	whitePositions at: #d1 put: #Q.
	whitePositions at: #e1 put: #K.
	whitePositions at: #f1 put: #B.
	whitePositions at: #g1 put: #N.
	whitePositions at: #h1 put: #T.
	#(#a2 #b2 #c2 #d2 #e2 #f2 #g2 #h2) do: [:e | whitePositions at: e put: #P.].

	blackPositions at: #a8 put: #T.
	blackPositions at: #b8 put: #N.
	blackPositions at: #c8 put: #B.
	blackPositions at: #d8 put: #Q.
	blackPositions at: #e8 put: #K.
	blackPositions at: #f8 put: #B.
	blackPositions at: #g8 put: #N.
	blackPositions at: #h8 put: #T.
	#(#a7 #b7 #c7 #d7 #e7 #f7 #g7 #h7) do: [:e | blackPositions at: e put: #P.].!

setRoot: aSystemRoot pgnString: pgnString

	systemRoot := aSystemRoot.
	parserStream := pgnString readStream.
	parsedMoves := OrderedCollection new.
	self setInitialPositions.
!

whitePieceAt: aSymbol ifNone: aBlock

	^whitePositions at: aSymbol ifAbsent: aBlock! !
!ChessGameParser categoriesForMethods!
blackPieceAt:ifNone:!pieces-black!public! !
moveBlackPieceFrom:to:!pieces-black!public! !
moveWhitePieceFrom:to:!pieces-white!public! !
parse!parser!public! !
parseGameData!parser!public! !
parseGameMoves!parser!public! !
propertyNamed:!public! !
setInitialPositions!private! !
setRoot:pgnString:!private! !
whitePieceAt:ifNone:!pieces-white!public! !
!

