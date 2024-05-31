"Filed out from Dolphin Smallalk"!

ChessGameParser subclass: #ChessPgnParser
	instanceVariableNames: 'pgnMoves result castlingCharacter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPgnParser guid: (GUID fromString: '{5b668773-df2d-4d5c-91eb-7033dbd1730e}')!
ChessPgnParser comment: 'PGN - portable game notation'!
!ChessPgnParser categoriesForClass!Unclassified! !
!ChessPgnParser methodsFor!

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
			self calculateCoordinatesFrom: pgnWhiteMove for: #white on: chessboard.
			self calculateCoordinatesFrom: pgnBlackMove for: #black on: chessboard.
		]
		ifTrue: [
			(eachArray first includes: $-) "resignation after Black last move"
			ifTrue: [result := eachArray first]
			ifFalse: [(eachArray third includes: $-) "resignation after White last move"
				ifTrue: [self calculateCoordinatesFrom: pgnWhiteMove for: #white on: chessboard.
					result := eachArray third]
				ifFalse: [self error: 'Bad last move parsing' ]
			].
		].
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
	((pgnBlackMove occurrencesOf: castlingCharacter) = 2)
	ifTrue: [rook := aChessboard pieceAtCoordinate: #h8.
		self moveBlackPieceFrom: king currentChessSquare coordinate to: #g8.
		self moveBlackPieceFrom: rook currentChessSquare coordinate to: #f8.
		parsedMoves 
			add: (Array with: #e8 with: #g8).
		aChessboard movePieceFromCoordiante: #e8 to: #g8.
		aChessboard movePieceFromCoordiante: #h8 to: #f8.
		] 
	ifFalse: [rook := aChessboard pieceAtCoordinate: #a8.
		self moveBlackPieceFrom: king currentChessSquare coordinate to: #c8.
		self moveBlackPieceFrom: rook currentChessSquare coordinate to: #d8.
		parsedMoves 
			add: (Array with: #e8 with: #c8).
		aChessboard movePieceFromCoordiante: #e8 to: #c8.
		aChessboard movePieceFromCoordiante: #a8 to: #d8.]!

calculateCastleCoordinatesFrom: pgnMove for: symbolChessSide on: aChessboard

	^symbolChessSide = #white
		ifTrue: [self calculateWhiteCastleCoordinatesFrom: pgnMove on: aChessboard]
		ifFalse: [self calculateBlackCastleCoordinatesFrom: pgnMove on: aChessboard]!

calculateCoordinatesFrom: pgnMove for: symbolChessSide on: aChessboard

	((pgnMove first = $0) or: [pgnMove first = $O]) "the official character for castle is uppercase letter O, not 0, but zero is somehow accepted"
	ifTrue: [castlingCharacter := pgnMove first].

	^(pgnMove first isUpperCase or: [pgnMove first = castlingCharacter]) 
	ifFalse: [self calculatePawnCoordinatesFrom: pgnMove for: symbolChessSide on: aChessboard] 
	ifTrue: [self calculatePieceCoordinatesFrom: pgnMove for: symbolChessSide on: aChessboard]!

calculatePawnCoordinatesFrom: pgnCompleMove for: symbolChessSide on: aChessboard
	| isCapture pgnMove |

	pgnMove := (pgnCompleMove includes: $+) ifTrue: [pgnCompleMove allButLast asSymbol] ifFalse: [pgnCompleMove].
	isCapture := '*x*' match: pgnCompleMove.
	isCapture
	ifFalse: [ | piecesDictionary pieces piece |
		piecesDictionary := self pawnsOnFile: pgnMove first asString for: symbolChessSide on: aChessboard.
		pieces := (piecesDictionary select: [:eachPiece | (eachPiece squaresScopeFrom: eachPiece currentChessSquare) includes: (pgnMove asSymbol asChessSquareIn: systemRoot)]) asOrderedCollection.
		pieces size = 0 ifTrue: [self error: 'No Pawn found to move to [', pgnMove ,']'].
		pieces size = 1 ifFalse: [self error: 'Not implemented yet'].
		piece := pieces last.
		self movePieceFor: symbolChessSide from: piece currentChessSquare coordinate to: pgnMove asSymbol.
		parsedMoves add: (Array with: piece currentChessSquare coordinate with: pgnMove asSymbol).
		aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: pgnMove asSymbol]
	ifTrue: [ | piecesDictionary pieces piece targetSquareCoordinate |
		targetSquareCoordinate := (pgnMove subStrings: $x) last asSymbol.
		piecesDictionary := self pawnsOnFile: pgnMove first asString for: symbolChessSide on: aChessboard.
		pieces := (piecesDictionary select: [:eachPiece | (eachPiece squaresScopeFrom: eachPiece currentChessSquare) includes: (targetSquareCoordinate asChessSquareIn: systemRoot)]) asOrderedCollection.
		pieces size = 0 ifTrue: [self error: 'No Pawn found to move to [', pgnMove ,']'].
		pieces size = 1 ifFalse: [self error: 'Not implemented yet'].
		piece := pieces last.
		self movePieceFor: symbolChessSide from: piece currentChessSquare coordinate to: targetSquareCoordinate.
		parsedMoves add: (Array with: piece currentChessSquare coordinate with: targetSquareCoordinate).
		aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: targetSquareCoordinate.
	]
	!

calculatePieceCoordinatesFrom: pgnMove for: symbolChessSide on: aChessboard
	| targetCoordinate pieceName pieces piece |

	('*', self castlingCharacterForMatching, '*' match: pgnMove) ifTrue: [^self calculateCastleCoordinatesFrom: pgnMove for: symbolChessSide on: aChessboard]. 
	('*x*' match: pgnMove)
	ifFalse: [targetCoordinate := pgnMove allButFirst asSymbol.
		pieceName := pgnMove first asString]
	ifTrue: [targetCoordinate := (pgnMove subStrings: $x) last asSymbol.
		pieceName := (pgnMove subStrings: $x) first asString.].
	(targetCoordinate includes: $+) ifTrue: [targetCoordinate := targetCoordinate allButLast asSymbol].
	pieceName size = 2 ifTrue: [self error: 'Not implemented yet'].
	pieces  := self piecesWithPgnName: pieceName for: symbolChessSide on: aChessboard. 
	targetCoordinate size = 3 ifTrue: [targetCoordinate := targetCoordinate allButFirst asSymbol].
	pieces := (pieces select: [:eachPiece | eachPiece isValidMoveFrom: eachPiece currentChessSquare to: (targetCoordinate asChessSquareIn: systemRoot)]) asOrderedCollection.
	pieces size > 1 
	ifTrue: [
		pieces := pieces select: [:eachPiece | eachPiece currentChessSquare coordinate first = pgnMove second or:[eachPiece currentChessSquare coordinate second = pgnMove second]].
	].
	piece := pieces last.
	self movePieceFor: symbolChessSide from: piece currentChessSquare coordinate to: targetCoordinate.
	parsedMoves add: (Array with: piece currentChessSquare coordinate with: targetCoordinate).
	aChessboard movePieceFromCoordiante: piece currentChessSquare coordinate to: targetCoordinate.
	!

calculateWhiteCastleCoordinatesFrom: pgnWhiteMove on: aChessboard
	| king rook |

	king :=  aChessboard pieceAtCoordinate: #e1.
	((pgnWhiteMove occurrencesOf: castlingCharacter) = 2)
	ifTrue: [rook := aChessboard pieceAtCoordinate: #h1.
		self moveWhitePieceFrom: king currentChessSquare coordinate to: #g1.
		self moveWhitePieceFrom: rook currentChessSquare coordinate to: #f1.
		parsedMoves 
			add: (Array with: #e1 with: #g1).
		aChessboard movePieceFromCoordiante: #e1 to: #g1.
		aChessboard movePieceFromCoordiante: #h1 to: #f1.
		] 
	ifFalse: [rook := aChessboard pieceAtCoordinate: #a1.
		self moveWhitePieceFrom: king currentChessSquare coordinate to: #c1.
		self moveWhitePieceFrom: rook currentChessSquare coordinate to: #d1.
		parsedMoves 
			add: (Array with: #e1 with: #c1).
		aChessboard movePieceFromCoordiante: #e1 to: #c1.
		aChessboard movePieceFromCoordiante: #a1 to: #d1.]
!

castlingCharacterForMatching

	castlingCharacter ifNil: [^'O'].
	^castlingCharacter asString!

movePieceFor: symbolChessSide from: fromCoordinate to: targetCoordinate

	^symbolChessSide = #white
		ifTrue: [self moveWhitePieceFrom: fromCoordinate to: targetCoordinate]
		ifFalse: [self moveBlackPieceFrom: fromCoordinate to: targetCoordinate]!

numberOfMoves

	^pgnMoves size!

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

pawnsOnFile: fileName for: symbolChessSide on: aChessboard

	^symbolChessSide = #white
		ifTrue: [aChessboard whitePawnsOnFile: fileName]
		ifFalse: [aChessboard blackPawnsOnFile: fileName ] !

piecesWithPgnName: pieceName for: symbolChessSide on: aChessboard

	^(symbolChessSide = #white
		ifTrue: [aChessboard whitePiecesPgnNamed: pieceName]
		ifFalse: [aChessboard blackPiecesPgnNamed: pieceName]) asOrderedCollection! !
!ChessPgnParser categoriesForMethods!
buildGameFor:!chess game!parser!public! !
buildMovesModelFor:!chess game!parser!public! !
buildPgnListFor:!chess game!parser!public! !
calculateBlackCastleCoordinatesFrom:on:!chess game!public! !
calculateCastleCoordinatesFrom:for:on:!chess game!public! !
calculateCoordinatesFrom:for:on:!chess game!public! !
calculatePawnCoordinatesFrom:for:on:!chess game!public! !
calculatePieceCoordinatesFrom:for:on:!chess game!public! !
calculateWhiteCastleCoordinatesFrom:on:!chess game!public! !
castlingCharacterForMatching!chess game!public! !
movePieceFor:from:to:!chess game!public! !
numberOfMoves!public! !
parseGameData!parser!public! !
parseGameMoves!parser!public! !
pawnsOnFile:for:on:!chess game!public! !
piecesWithPgnName:for:on:!chess game!public! !
!

!ChessPgnParser class methodsFor!

newOn: aSystemRoot pgnString: pgnString

	^self new setRoot: aSystemRoot pgnString: pgnString! !
!ChessPgnParser class categoriesForMethods!
newOn:pgnString:!public! !
!

