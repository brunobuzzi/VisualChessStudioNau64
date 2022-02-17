"Filed out from Dolphin Smallalk"!

Object subclass: #Nau64ChessSystemRoot
	instanceVariableNames: 'files ranks squares'
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
	| all fenSquares |

	all := self allSquares.
	fenSquares := OrderedCollection new.
	fenSquares add: (OrderedCollection withAll: (#(#a8 #b8 #c8 #d8 #e8 #f8 #g8 #h8) collect: [:each | all at: each]));
		add: (OrderedCollection withAll: (#(#a7 #b7 #c7 #d7 #e7 #f7 #g7 #h7) collect: [:each | all at: each]));
		add: (OrderedCollection withAll: (#(#a6 #b6 #c6 #d6 #e6 #f6 #g6 #h6) collect: [:each | all at: each]));
		add: (OrderedCollection withAll: (#(#a5 #b5 #c5 #d5 #e5 #f5 #g5 #h5) collect: [:each | all at: each]));
		add: (OrderedCollection withAll: (#(#a4 #b4 #c4 #d4 #e4 #f4 #g4 #h4) collect: [:each | all at: each]));
		add: (OrderedCollection withAll: (#(#a3 #b3 #c3 #d3 #e3 #f3 #g3 #h3) collect: [:each | all at: each]));
		add: (OrderedCollection withAll: (#(#a2 #b2 #c2 #d2 #e2 #f2 #g2 #h2) collect: [:each | all at: each]));
		add: (OrderedCollection withAll: (#(#a1 #b1 #c1 #d1 #e1 #f1 #g1 #h1) collect: [:each | all at: each])).
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

	squares := Dictionary new.
	#(#a1 #a2 #a3 #a4 #a5 #a6 #a7 #a8 #b1 #b2 #b3 #b4 #b5 #b6 #b7 #b8 #c1 #c2 #c3 #c4 #c5 #c6 #c7 #c8 #d1 #d2 #d3 #d4 #d5 #d6 #d7 #d8 #e1 #e2 #e3 #e4 #e5 #e6 #e7 #e8 #f1 #f2 #f3 #f4 #f5 #f6 #f7 #f8 #g1 #g2 #g3 #g4 #g5 #g6 #g7 #g8 #h1 #h2 #h3 #h4 #h5 #h6 #h7 #h8) 
		do: [:symbolCoordinate | | square |
			square := ChessSquare newFile: (self getFile: symbolCoordinate first asString) rank: (self getRank: (Integer fromString: symbolCoordinate second asString)) on: self.
			squares at: symbolCoordinate put: square].!

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

squareAt: aSymbol

	^squares at: aSymbol!

squareAtFile: aChessFile atRank: aChessRank

	^squares at: (aChessFile printName, aChessRank printName) asSymbol ifAbsent: [self error: 'ChessSquare does not exist']! !
!Nau64ChessSystemRoot categoriesForMethods!
allSquares!public! !
fenSquares!public! !
getFile:!public! !
getRank:!public! !
setFiles!private! !
setFilesRanksAndSquares!private! !
setRanks!private! !
squareAt:!public! !
squareAtFile:atRank:!public! !
!

!Nau64ChessSystemRoot class methodsFor!

new

	^super new setFilesRanksAndSquares! !
!Nau64ChessSystemRoot class categoriesForMethods!
new!public! !
!

