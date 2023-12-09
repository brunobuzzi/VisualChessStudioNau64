"Filed out from Dolphin Smallalk"!

Object subclass: #Nau64ChessSystemRoot
	instanceVariableNames: 'files ranks squares userPreferences'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Nau64ChessSystemRoot guid: (GUID fromString: '{117fffc0-6d08-4614-843c-b9de5f793445}')!
Nau64ChessSystemRoot comment: ''!
!Nau64ChessSystemRoot categoriesForClass!Unclassified! !
!Nau64ChessSystemRoot methodsFor!

allSquares

	^squares!

fenSquares
	| fenSquares |

	fenSquares := OrderedCollection new.
	fenSquares add: (OrderedCollection withAll: (self squaresAtRank: 8));
		add: (OrderedCollection withAll: (self squaresAtRank: 7));
		add: (OrderedCollection withAll: (self squaresAtRank: 6));
		add: (OrderedCollection withAll: (self squaresAtRank: 5));
		add: (OrderedCollection withAll: (self squaresAtRank: 4));
		add: (OrderedCollection withAll: (self squaresAtRank: 3));
		add: (OrderedCollection withAll: (self squaresAtRank: 2));
		add: (OrderedCollection withAll: (self squaresAtRank: 1)).
	^fenSquares!

getFile: aString
	^files at: aString ifAbsent: [self error: 'No Chess File [' , aString , ']']!

getRank: anInteger
	^ranks at: anInteger ifAbsent: [self error: 'No Chess File [' , anInteger printString , ']']!

setFiles
	files := Dictionary new.
	files
		at: 'a' put: (ChessFile newAon: self);
		at: 'b' put: (ChessFile newBon: self);
		at: 'c' put: (ChessFile newCon: self);
		at: 'd' put: (ChessFile newDon: self);
		at: 'e' put: (ChessFile newEon: self);
		at: 'f' put: (ChessFile newFon: self);
		at: 'g' put: (ChessFile newGon: self);
		at: 'h' put: (ChessFile newHon: self)!

setFilesRanksAndSquares
	self setFiles.
	self setRanks.
	self setSquares!

setRanks
	ranks := Dictionary new.
	ranks
		at: 1 put: (ChessRank new1On: self);
		at: 2 put: (ChessRank new2On: self);
		at: 3 put: (ChessRank new3On: self);
		at: 4 put: (ChessRank new4On: self);
		at: 5 put: (ChessRank new5On: self);
		at: 6 put: (ChessRank new6On: self);
		at: 7 put: (ChessRank new7On: self);
		at: 8 put: (ChessRank new8On: self)!

setSquares
	squares := Dictionary new.
	self squaresSymbolsCollection do: 
			[:symbolCoordinate |
			| square |
			square := ChessSquare
						newFile: (self getFile: symbolCoordinate first asString)
						rank: (self getRank: (Integer fromString: symbolCoordinate second asString))
						on: self.
			squares at: symbolCoordinate put: square]!

setUnicodeFontName: aFontName

	^userPreferences setUnicodeFontName: aFontName!

setUpRoot

	self setFilesRanksAndSquares.

	userPreferences := Nau64UserPreferences new.!

squareAt: aSymbol

	^squares at: aSymbol!

squareAtFile: aChessFile atRank: aChessRank

	^squares at: (aChessFile printName, aChessRank printName) asSymbol ifAbsent: [self error: 'ChessSquare does not exist']!

squareBlackColor

	^userPreferences squareBlackColor!

squaresAtFile: fileName

	^(squares select: [:chessSquare | chessSquare printFile = fileName]) asSortedCollection: [:a :b | a rankNumber <= b rankNumber]!

squaresAtRank: rankNumber

	^(squares select: [:chessSquare | chessSquare rankNumber = rankNumber]) asSortedCollection: [:a :b | a printFile <= b printFile]!

squaresDo: aBlock

	squares do: aBlock!

squaresSymbolsCollection
	^#(#a1 #a2 #a3 #a4 #a5 #a6 #a7 #a8 #b1 #b2 #b3 #b4 #b5 #b6 #b7 #b8 #c1 #c2 #c3 #c4 #c5 #c6 #c7 #c8 #d1 #d2 #d3 #d4 #d5 #d6 #d7 #d8 #e1 #e2 #e3 #e4 #e5 #e6 #e7 #e8 #f1 #f2 #f3 #f4 #f5 #f6 #f7 #f8 #g1 #g2 #g3 #g4 #g5 #g6 #g7 #g8 #h1 #h2 #h3 #h4 #h5 #h6 #h7 #h8)!

squareWhiteColor

	^userPreferences squareWhiteColor!

unicodeFontNameForPieces

	^userPreferences unicodeFontNameForPieces! !
!Nau64ChessSystemRoot categoriesForMethods!
allSquares!public!squares! !
fenSquares!public!squares! !
getFile:!files and ranks!public! !
getRank:!files and ranks!public! !
setFiles!files and ranks!private! !
setFilesRanksAndSquares!private! !
setRanks!files and ranks!private! !
setSquares!private!squares! !
setUnicodeFontName:!public!user preferences! !
setUpRoot!private! !
squareAt:!public!squares! !
squareAtFile:atRank:!public!squares! !
squareBlackColor!public!user preferences! !
squaresAtFile:!public!squares! !
squaresAtRank:!public!squares! !
squaresDo:!public!squares! !
squaresSymbolsCollection!private!squares! !
squareWhiteColor!public!user preferences! !
unicodeFontNameForPieces!public!user preferences! !
!

!Nau64ChessSystemRoot class methodsFor!

new

	^super new setUpRoot! !
!Nau64ChessSystemRoot class categoriesForMethods!
new!public! !
!

