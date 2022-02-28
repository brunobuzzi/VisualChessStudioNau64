"Filed out from Dolphin Smallalk"!

ChessParser subclass: #ChessFenParser
	instanceVariableNames: 'fenStream entries map properties'
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

parse
	| fenFields |

	fenFields := fenStream contents subStrings: ' '.
	self assert: [fenFields size = 6].
	
	self parsePiecesFrom: (fenFields at: 1).
	self parseSideToMoveFrom: (fenFields at: 2).
	self parseCastleAvailabilityFrom: (fenFields at: 3).
	self parseEnPassantTargetFrom: (fenFields at: 4).
	self parseHalfmoveClockFrom: (fenFields at: 5).
	self parseFullmoveNnumberFrom: (fenFields at: 6).


!

parseCastleAvailabilityFrom: aString

	self halt!

parseEnPassantTargetFrom: aString

	self halt!

parseFullmoveNnumberFrom: aString

	self halt!

parseHalfmoveClockFrom: aString

	self halt!

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
	fenStream := aString readStream.
	entries := Dictionary new.
	map := Dictionary new.
	properties := Dictionary new.
	self parse.!

sideToMove

	^properties at: #sideToMove ifAbsent: [self error: 'no side to move']! !
!ChessFenParser categoriesForMethods!
assertFormat:!public! !
deployOn:!public! !
parse!public! !
parseCastleAvailabilityFrom:!public! !
parseEnPassantTargetFrom:!public! !
parseFullmoveNnumberFrom:!public! !
parseHalfmoveClockFrom:!public! !
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

