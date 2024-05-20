"Filed out from Dolphin Smallalk"!

ChessParser subclass: #ChessPgnParser
	instanceVariableNames: 'gameProperties whitePositions blackPositions pgnMoves parsedMoves'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPgnParser guid: (GUID fromString: '{5b668773-df2d-4d5c-91eb-7033dbd1730e}')!
ChessPgnParser comment: ''!
!ChessPgnParser categoriesForClass!Unclassified! !
!ChessPgnParser methodsFor!

blackPieceAt: aSymbol ifNone: aBlock

	^blackPositions at: aSymbol ifAbsent: aBlock!

buildGameFor: aChessPgnGameExecutor

	self buildPgnListFor: aChessPgnGameExecutor.

	self buildMovesModelFor: aChessPgnGameExecutor.!

buildMovesModelFor: aChessPgnGameExecutor
	| chessboard |

	chessboard := aChessPgnGameExecutor newInitialChessboard.
	pgnMoves keysAndValuesDo: [:index :eachArray | | pgnWhiteMove pgnBlackMove |
		pgnWhiteMove := eachArray at: 2.
		pgnBlackMove := eachArray at: 3.
		(eachArray == pgnMoves last)
		ifFalse: [
			self calculateWhiteCoordinatesFrom: pgnWhiteMove on: chessboard. 
			self calculateBlackCoordinatesFrom: pgnBlackMove on: chessboard.
		]
		ifTrue: ["self parseResult"].
	].
	chessboard := aChessPgnGameExecutor newInitialChessboard.
	parsedMoves keysAndValuesDo: [:index :eachArray | | move |
		move := aChessPgnGameExecutor annotateMoveFrom: eachArray first to: eachArray second on: chessboard.
		aChessPgnGameExecutor performMove: move on: chessboard.
	].
!

buildPgnListFor: aChessPgnGameExecutor

	self parse.

	aChessPgnGameExecutor setPgnMoves: pgnMoves!

calculateBlackCastleCoordinatesFrom: pgnBlackMove on: aChessboard
	| king rook |

	king :=  aChessboard pieceAtCoordinate: #e8.
	((pgnBlackMove occurrencesOf: $O) = 2)
	ifTrue: [rook := aChessboard pieceAtCoordinate: #h8.
		self moveBlackPieceFrom: king currentChessSquare coordinate to: #g8.
		self moveBlackPieceFrom: rook currentChessSquare coordinate to: #f8.
		parsedMoves 
			add: (Array with: #e8 with: #g8)"; 
			add: (Array with: #h8 with: #f8)".
		aChessboard movePieceFromCoordiante: #e8 to: #g8.
		aChessboard movePieceFromCoordiante: #h8 to: #f8.
		] 
	ifFalse: [rook := aChessboard pieceAtCoordinate: #a8.
		self moveBlackPieceFrom: king currentChessSquare coordinate to: #c8.
		self moveBlackPieceFrom: rook currentChessSquare coordinate to: #d8.
		parsedMoves 
			add: (Array with: #e8 with: #c8)"; 
			add: (Array with: #a8 with: #d8)".
		aChessboard movePieceFromCoordiante: #e8 to: #c8.
		aChessboard movePieceFromCoordiante: #a8 to: #d8.]!

calculateBlackCoordinatesFrom: pgnBlackMove on: aChessboard
	^pgnBlackMove first isUppercase
	ifFalse: [self calculateBlackPawnCoordinatesFrom: pgnBlackMove on: aChessboard] 
	ifTrue: [self calculateBlackPieceCoordinatesFrom: pgnBlackMove on: aChessboard]!

calculateBlackPawnCoordinatesFrom: pgnWhiteMove on: aChessboard
	| isCapture pgnMove |

	pgnMove := (pgnWhiteMove includes: $+) ifTrue: [pgnWhiteMove allButLast asSymbol] ifFalse: [pgnWhiteMove].
	isCapture := '*x*' match: pgnWhiteMove.
	isCapture
	ifFalse: [ | piecesDictionary pieces piece |
		piecesDictionary := aChessboard blackPawnsOnFile: pgnMove first asString.
		pieces := (piecesDictionary select: [:eachPiece | (eachPiece squaresScopeFrom: eachPiece currentChessSquare) includes: (pgnMove asSymbol asChessSquareIn: systemRoot)]) asOrderedCollection.
		pieces size = 0 ifTrue: [self error: 'No Pawn found to move to [', pgnMove ,']'].
		pieces size = 1 ifFalse: [self error: 'Not implemented yet'].
		piece := pieces last.
		self moveBlackPieceFrom: piece currentChessSquare coordinate to: pgnMove asSymbol.
		parsedMoves add: (Array with: piece currentChessSquare coordinate with: pgnMove asSymbol).
		aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: pgnMove asSymbol]
	ifTrue: [ | piecesDictionary pieces piece targetSquareCoordinate |
		targetSquareCoordinate := (pgnMove subStrings: $x) last asSymbol.
		piecesDictionary := aChessboard blackPawnsOnFile: pgnMove first asString.
		pieces := (piecesDictionary select: [:eachPiece | (eachPiece squaresScopeFrom: eachPiece currentChessSquare) includes: (targetSquareCoordinate asChessSquareIn: systemRoot)]) asOrderedCollection.
		pieces size = 0 ifTrue: [self error: 'No Pawn found to move to [', pgnMove ,']'].
		pieces size = 1 ifFalse: [self error: 'Not implemented yet'].
		piece := pieces last.
		self moveBlackPieceFrom: piece currentChessSquare coordinate to: targetSquareCoordinate.
		parsedMoves add: (Array with: piece currentChessSquare coordinate with: targetSquareCoordinate).
		aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: targetSquareCoordinate.
	]
	!

calculateBlackPieceCoordinatesFrom: pgnBlackMove on: aChessboard
	| targetCoordinate pieceName pieces piece |

	('*O*' match: pgnBlackMove) ifTrue: [^self calculateBlackCastleCoordinatesFrom: pgnBlackMove on: aChessboard].
	('*x*' match: pgnBlackMove)
	ifFalse: [targetCoordinate := pgnBlackMove allButFirst asSymbol.
		pieceName := pgnBlackMove first asString]
	ifTrue: [targetCoordinate := (pgnBlackMove subStrings: $x) last asSymbol.
		pieceName := (pgnBlackMove subStrings: $x) first asString.].
	(targetCoordinate includes: $+) ifTrue: [targetCoordinate := targetCoordinate allButLast asSymbol].
	pieceName size = 2 ifTrue: [self error: 'Not implemented yet'].
	pieces  := (aChessboard blackPiecesPgnNamed: pieceName) asOrderedCollection.
	targetCoordinate size = 3 ifTrue: [targetCoordinate := targetCoordinate allButFirst asSymbol].
	pieces := (pieces select: [:eachPiece | eachPiece isValidMoveFrom: eachPiece currentChessSquare to: (targetCoordinate asChessSquareIn: systemRoot)]) asOrderedCollection.
	pieces size > 1 
	ifTrue: [
		pieces := pieces select: [:eachPiece | eachPiece currentChessSquare coordinate first = pgnBlackMove second or:[eachPiece currentChessSquare coordinate second = pgnBlackMove second]].
	].
	piece := pieces last.
	self moveBlackPieceFrom: piece currentChessSquare coordinate to: targetCoordinate.
	parsedMoves add: (Array with: piece currentChessSquare coordinate with: targetCoordinate).
	aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: targetCoordinate.
	!

calculateWhiteCastleCoordinatesFrom: pgnWhiteMove on: aChessboard
	| king rook |

	king :=  aChessboard pieceAtCoordinate: #e1.
	((pgnWhiteMove occurrencesOf: $O) = 2)
	ifTrue: [rook := aChessboard pieceAtCoordinate: #h1.
		self moveWhitePieceFrom: king currentChessSquare coordinate to: #g1.
		self moveWhitePieceFrom: rook currentChessSquare coordinate to: #f1.
		parsedMoves 
			add: (Array with: #e1 with: #g1)"; 
			add: (Array with: #h1 with: #f1)".
		aChessboard movePieceFromCoordiante: #e1 to: #g1.
		aChessboard movePieceFromCoordiante: #h1 to: #f1.
		] 
	ifFalse: [rook := aChessboard pieceAtCoordinate: #a1.
		self moveWhitePieceFrom: king currentChessSquare coordinate to: #c1.
		self moveWhitePieceFrom: rook currentChessSquare coordinate to: #d1.
		parsedMoves 
			add: (Array with: #e1 with: #c1)"; 
			add: (Array with: #a1 with: #d1)".
		aChessboard movePieceFromCoordiante: #e1 to: #c1.
		aChessboard movePieceFromCoordiante: #a1 to: #d1.]
!

calculateWhiteCoordinatesFrom: pgnWhiteMove on: aChessboard
	^pgnWhiteMove first isUppercase
	ifFalse: [self calculateWhitePawnCoordinatesFrom: pgnWhiteMove on: aChessboard] 
	ifTrue: [self calculateWhitePieceCoordinatesFrom: pgnWhiteMove on: aChessboard]!

calculateWhitePawnCoordinatesFrom: pgnWhiteMove on: aChessboard
	| isCapture pgnMove |

	pgnMove := (pgnWhiteMove includes: $+) ifTrue: [pgnWhiteMove allButLast asSymbol] ifFalse: [pgnWhiteMove].
	isCapture := '*x*' match: pgnWhiteMove.
	isCapture
	ifFalse: [ | piecesDictionary pieces piece |
		piecesDictionary := aChessboard whitePawnsOnFile: pgnMove first asString.
		pieces := (piecesDictionary select: [:eachPiece | (eachPiece squaresScopeFrom: eachPiece currentChessSquare) includes: (pgnMove asSymbol asChessSquareIn: systemRoot)]) asOrderedCollection.
		pieces size = 0 ifTrue: [self error: 'No Pawn found to move to [', pgnMove ,']'].
		pieces size = 1 ifFalse: [self error: 'Not implemented yet'].
		piece := pieces last.
		self moveWhitePieceFrom: piece currentChessSquare coordinate to: pgnMove asSymbol.
		parsedMoves add: (Array with: piece currentChessSquare coordinate with: pgnMove asSymbol).
		aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: pgnMove asSymbol]
	ifTrue: [ | piecesDictionary pieces piece targetSquareCoordinate |
		targetSquareCoordinate := (pgnMove subStrings: $x) last asSymbol.
		piecesDictionary := aChessboard whitePawnsOnFile: pgnMove first asString.
		pieces := (piecesDictionary select: [:eachPiece | (eachPiece squaresScopeFrom: eachPiece currentChessSquare) includes: (targetSquareCoordinate asChessSquareIn: systemRoot)]) asOrderedCollection.
		pieces size = 0 ifTrue: [self error: 'No Pawn found to move to [', pgnMove ,']'].
		pieces size = 1 ifFalse: [self error: 'Not implemented yet'].
		piece := pieces last.
		self moveWhitePieceFrom: piece currentChessSquare coordinate to: targetSquareCoordinate.
		parsedMoves add: (Array with: piece currentChessSquare coordinate with: targetSquareCoordinate).
		aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: targetSquareCoordinate.
	]
	!

calculateWhitePieceCoordinatesFrom: pgnWhiteMove on: aChessboard
	| targetCoordinate pieceName pieces piece |

	('*O*' match: pgnWhiteMove) ifTrue: [^self calculateWhiteCastleCoordinatesFrom: pgnWhiteMove on: aChessboard].
	('*x*' match: pgnWhiteMove)
	ifFalse: [targetCoordinate := pgnWhiteMove allButFirst asSymbol.
		pieceName := pgnWhiteMove first asString]
	ifTrue: [targetCoordinate := (pgnWhiteMove subStrings: $x) last asSymbol.
		pieceName := (pgnWhiteMove subStrings: $x) first asString.].
	(targetCoordinate includes: $+) ifTrue: [targetCoordinate := targetCoordinate allButLast asSymbol].
	pieceName size = 2 ifTrue: [self error: 'Not implemented yet'].
	pieces  := (aChessboard whitePiecesPgnNamed: pieceName) asOrderedCollection.
	targetCoordinate size = 3 ifTrue: [targetCoordinate := targetCoordinate allButFirst asSymbol].
	pieces := (pieces select: [:eachPiece | eachPiece isValidMoveFrom: eachPiece currentChessSquare to: (targetCoordinate asChessSquareIn: systemRoot)]) asOrderedCollection.
	pieces size > 1
	ifTrue: [
		pieces := pieces select: [:eachPiece | eachPiece currentChessSquare coordinate first = pgnWhiteMove second or:[eachPiece currentChessSquare coordinate second = pgnWhiteMove second]].
	].
	piece := pieces last.
	self moveWhitePieceFrom: piece currentChessSquare coordinate to: targetCoordinate.
	parsedMoves add: (Array with: piece currentChessSquare coordinate with: targetCoordinate).
	aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: targetCoordinate.!

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

numberOfMoves

	^pgnMoves size!

parse
	self parseGameData.
	self parseGameMoves.
!

parseGameData
	| isMoveSecttion |
	gameProperties := Dictionary new.
	isMoveSecttion := false.
	[isMoveSecttion not and: [parserStream atEnd not]] whileTrue: [ | propertyName propertyValue currentPosition |
			parserStream upTo: $[.
			parserStream skipWhile: [:ch | ch == Character space].
			propertyName := parserStream upTo: Character space.
			parserStream upTo: $".
			propertyValue := parserStream upTo: $".
			propertyName notEmpty ifTrue: [gameProperties at: propertyName put: propertyValue].
			currentPosition := parserStream position.
			parserStream upTo: $[.
			parserStream atEnd ifTrue: [isMoveSecttion := true].
			parserStream position: currentPosition.
	].
!

parseGameMoves
	pgnMoves := OrderedCollection new.
	parserStream next.
	[parserStream atEnd not] whileTrue: 
			[| moveNumber whiteMove blackMove |
			moveNumber := (parserStream upTo: $.) copyWithout: Character lf; copyWithout: Character cr.
			(parserStream peek = Character space) ifTrue: [parserStream upTo: Character space].
			whiteMove := (parserStream upTo: Character space) copyWithout: Character lf; copyWithout: Character cr.
			blackMove := (parserStream upTo: Character space) copyWithout: Character lf; copyWithout: Character cr.
			pgnMoves add: (Array with: moveNumber with: whiteMove with: blackMove).
	].

!

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
!ChessPgnParser categoriesForMethods!
blackPieceAt:ifNone:!pieces-black!public! !
buildGameFor:!chess game!parser!public! !
buildMovesModelFor:!chess game!parser!public! !
buildPgnListFor:!chess game!parser!public! !
calculateBlackCastleCoordinatesFrom:on:!chess game!public! !
calculateBlackCoordinatesFrom:on:!chess game!public! !
calculateBlackPawnCoordinatesFrom:on:!chess game!public! !
calculateBlackPieceCoordinatesFrom:on:!chess game!public! !
calculateWhiteCastleCoordinatesFrom:on:!chess game!public! !
calculateWhiteCoordinatesFrom:on:!chess game!public! !
calculateWhitePawnCoordinatesFrom:on:!chess game!public! !
calculateWhitePieceCoordinatesFrom:on:!chess game!public! !
moveBlackPieceFrom:to:!pieces-black!public! !
moveWhitePieceFrom:to:!pieces-white!public! !
numberOfMoves!public! !
parse!parser!public! !
parseGameData!parser!public! !
parseGameMoves!parser!public! !
propertyNamed:!public! !
setInitialPositions!private! !
setRoot:pgnString:!private! !
whitePieceAt:ifNone:!pieces-white!public! !
!

!ChessPgnParser class methodsFor!

newOn: aSystemRoot pgnString: pgnString

	^self new setRoot: aSystemRoot pgnString: pgnString! !
!ChessPgnParser class categoriesForMethods!
newOn:pgnString:!public! !
!

