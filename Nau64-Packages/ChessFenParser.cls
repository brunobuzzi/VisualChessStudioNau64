"Filed out from Dolphin Smallalk"!

ChessParser subclass: #ChessFenParser
	instanceVariableNames: 'entries map properties'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessFenParser guid: (GUID fromString: '{c4cb03ad-9af2-4950-a227-19279538dbde}')!
ChessFenParser comment: ''!
!ChessFenParser categoriesForClass!Kernel-Objects! !
!ChessFenParser methodsFor!

assertFormat: aBlock
	aBlock value ifFalse: [self error: 'unexpected format']!

deployOn: aChessboard 

	map keysAndValuesDo: [:symbolCoordinate :fenPiece |  | pieceClass |
		pieceClass := self pieceClassFor: fenPiece.
		aChessboard newPiece: pieceClass isBlack: fenPiece isLowerCase at: (systemRoot squareAt: symbolCoordinate)
	].!

enPassantTargetSquare

	^properties at: #enPassantSquare ifAbsent: []!

fullMoveNumber

	^properties at: #fullMoveNumber ifAbsent: [0]!

halfMoveClock

	^properties at: #halfMoveClock ifAbsent: [0]!

isEnabledBlackKingSideCastle

	^properties at: #blackKingSideCastle ifAbsent: [false]!

isEnabledBlackQueenSideCastle

	^properties at: #blackQueenSideCastle ifAbsent: [false]!

isEnabledWhiteKingSideCastle

	^properties at: #whiteKingSideCastle ifAbsent: [false]!

isEnabledWhiteQueenSideCastle

	^properties at: #whiteQueenSideCastle ifAbsent: [false]!

parse
	| fenFields |

	fenFields := parserStream contents subStrings: ' '.
	self assert: [fenFields size = 6].
	
	self parsePiecesFrom: (fenFields at: 1).
	self parseSideToMoveFrom: (fenFields at: 2).
	self parseCastleAvailabilityFrom: (fenFields at: 3).
	self parseEnPassantTargetFrom: (fenFields at: 4).
	self parseHalfMoveClockFrom: (fenFields at: 5).
	self parseFullMoveNumberFrom: (fenFields at: 6).


!

parseCastleAvailabilityFrom: aString

	(aString includes: $K) ifTrue: [properties at: #whiteKingSideCastle put: true].
	(aString includes: $Q) ifTrue: [properties at: #whiteQueenSideCastle put: true].
	
	(aString includes: $k) ifTrue: [properties at: #blackKingSideCastle put: true].
	(aString includes: $q) ifTrue: [properties at: #blackQueenSideCastle put: true].!

parseEnPassantTargetFrom: aString

	(aString ~= '-') ifTrue: [properties at: #enPassantSquare put: aString asSymbol]!

parseFullMoveNumberFrom: aString

	properties at: #fullMoveNumber put: (Integer fromString: aString)!

parseHalfMoveClockFrom: aString

	properties at: #halfMoveClock put: (Integer fromString: aString)!

parseLine: fenRankString atRank: integerRank
	| squares files |
	files := #('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h').
	squares := 0.
	fenRankString do: [:char | | convertedValue file |
		char isDigit 
		ifTrue: [convertedValue := Integer fromString: char asAnsiString.
				squares := squares + convertedValue.
		]
		ifFalse: [file := files at: squares + 1.
			squares := squares + 1.
			map at: (file, integerRank printString) asSymbol put: char.
		]
	].!

parsePiecesFrom: aString
	| ranks |

	ranks := (aString subStrings: '/') reverse.
	self assertFormat: [ranks size = 8].
	ranks keysAndValuesDo: [:rank :line | self parseLine: line atRank: rank].!

parseSideToMoveFrom: aString

	self assert: [aString = 'w' or: [aString = 'b']].

	(aString = 'w') ifTrue: [properties at: #sideToMove put: #white].
	(aString = 'b') ifTrue: [properties at: #sideToMove put: #black].
!

pieceClassFor: aCharacter 
	(aCharacter asUppercase = $P) ifTrue: [^Pawn].
	(aCharacter asUppercase = $K) ifTrue: [^King].
	(aCharacter asUppercase = $Q) ifTrue: [^Queen].
	(aCharacter asUppercase = $R) ifTrue: [^Rook].
	(aCharacter asUppercase = $B) ifTrue: [^Bishop].
	(aCharacter asUppercase = $N) ifTrue: [^Knight ].
	self error: 'No fen piece code for [', aCharacter asString,']'
!

setRoot: aSystemRoot fenString: aString

	systemRoot := aSystemRoot.
	parserStream := aString readStream.
	entries := Dictionary new.
	map := Dictionary new.
	properties := Dictionary new.
	self parse.!

sideToMove

	^properties at: #sideToMove ifAbsent: [self error: 'no side to move']! !
!ChessFenParser categoriesForMethods!
assertFormat:!public! !
deployOn:!public! !
enPassantTargetSquare!properties!public! !
fullMoveNumber!properties!public! !
halfMoveClock!properties!public! !
isEnabledBlackKingSideCastle!properties!public! !
isEnabledBlackQueenSideCastle!properties!public! !
isEnabledWhiteKingSideCastle!properties!public! !
isEnabledWhiteQueenSideCastle!properties!public! !
parse!public! !
parseCastleAvailabilityFrom:!public! !
parseEnPassantTargetFrom:!public! !
parseFullMoveNumberFrom:!public! !
parseHalfMoveClockFrom:!public! !
parseLine:atRank:!public! !
parsePiecesFrom:!public! !
parseSideToMoveFrom:!public! !
pieceClassFor:!public! !
setRoot:fenString:!private! !
sideToMove!public! !
!

!ChessFenParser class methodsFor!

newOn: aSystemRoot fenString: fenString

	^self new setRoot: aSystemRoot fenString: fenString! !
!ChessFenParser class categoriesForMethods!
newOn:fenString:!public! !
!

