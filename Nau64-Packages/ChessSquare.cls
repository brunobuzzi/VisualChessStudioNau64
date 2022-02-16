"Filed out from Dolphin Smallalk"!

Object subclass: #ChessSquare
	instanceVariableNames: 'file rank'
	classVariableNames: 'AllSquares ValidMoves'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSquare guid: (GUID fromString: '{8f251f63-d488-47a2-8a0c-9ef278194bb4}')!
ChessSquare comment: ''!
!ChessSquare categoriesForClass!Kernel-Objects! !
!ChessSquare methodsFor!

= aChessSquare

	^self class == aChessSquare class and: [self printFile = aChessSquare printFile and:[self rankNumber = aChessSquare rankNumber]]!

bitmap

	"^self isBlack 
		ifTrue: [Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\azul_escaqueNegro.bmp'] 
		ifFalse: [Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\azul_escaqueBlanco.bmp']"

	^self isBlack 
		ifTrue: [Bitmap fromFile: FileLocator imageRelative basePath , 'icons\black_square_01.bmp'] 
		ifFalse: [Bitmap fromFile: FileLocator imageRelative basePath , 'icons\white_square_01.bmp']!

calculatePositionAt: aChessboard

	^aChessboard calculatePositionForFile: file rank: rank!

coordinate
	^self name asSymbol!

fileIsEqualTo: aChessSquare

	^file isEqualTo: aChessSquare fileNumber!

fileIsGreaterThan: aChessSquare

	^file isGreaterThan: aChessSquare fileNumber!

fileNumber

	^file number!

isBlack

	^((#('a' 'c' 'e' 'g') includes: file name) and: [rank number odd]) or: [(#('b' 'd' 'f' 'h') includes: file name) and: [rank number even]]

!

isEqualTo: aChessSquare

	^self printFile = aChessSquare printFile and:[self rankNumber = aChessSquare rankNumber]!

isWhite

	^self isBlack not

!

name
	^self printFile, self printRank!

neutralBitmap

	^Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\verde_escaqueNegro.bmp'!

nextFile: fileShift nextRank: rankShift onSuccessDo: aBlock onErrorDo: monadicBlock
	| nextSquare |
	[nextSquare := self class file: (file next: fileShift) rank: (rank next: rankShift)] on: Error
		do: [:ex | ^monadicBlock value: ex].
	aBlock value: nextSquare!

notEqualTo: aChessSquare

	^self printFile ~= aChessSquare printFile or:[self rankNumber ~= aChessSquare rankNumber]!

oppositeBitmap

	^self isBlack 
		ifFalse: [Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\azul_escaqueNegro.bmp'] 
		ifTrue: [Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\azul_escaqueBlanco.bmp']!

orientationVectorTo: aChessSquare do: aBlock
	| orientationVector |

	orientationVector := ChessOrientationVector new.
	(self isEqualTo: aChessSquare) ifTrue: [^self error: 'Cannot calculate direction for the same chess squares' ].
	(self rankIsGreaterThan: aChessSquare) ifTrue: [orientationVector updateToSouth].
	(aChessSquare rankIsGreaterThan: self) ifTrue: [orientationVector updateToNorth].

	(self fileIsGreaterThan: aChessSquare) ifTrue: [orientationVector updateToEast].
	(aChessSquare fileIsGreaterThan: self) ifTrue: [orientationVector updateToWest].

	aBlock value: orientationVector

!

printFile

	^file printName!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', self printFile, self printRank, ']'!

printRank

	^rank printName!

rankIsEqualTo: aChessSquare

	^rank isEqualTo: aChessSquare rankNumber!

rankIsGreaterThan: aChessSquare

	^rank isGreaterThan: aChessSquare rankNumber!

rankNumber

	^rank number!

setFile: aChessFile rank: aChessRank 

	file := aChessFile.
	rank := aChessRank!

symbolDirectionFor: aChessSquare
	| direction |

	direction := String new writeStream.
	(self isEqualTo: aChessSquare) ifTrue: [^#none].
	(self rankIsGreaterThan: aChessSquare) ifTrue: [direction nextPutAll: #south].
	(aChessSquare rankIsGreaterThan: self) ifTrue: [direction nextPutAll: #north].

	(self fileIsGreaterThan: aChessSquare) ifTrue: [direction nextPutAll: #east].
	(aChessSquare fileIsGreaterThan: self) ifTrue: [direction nextPutAll: #west].

	^direction contents

! !
!ChessSquare categoriesForMethods!
=!public! !
bitmap!public! !
calculatePositionAt:!public! !
coordinate!public! !
fileIsEqualTo:!comparisons!public! !
fileIsGreaterThan:!comparisons!public! !
fileNumber!public! !
isBlack!public! !
isEqualTo:!comparisons!public! !
isWhite!public! !
name!public! !
neutralBitmap!public! !
nextFile:nextRank:onSuccessDo:onErrorDo:!public! !
notEqualTo:!comparisons!public! !
oppositeBitmap!public! !
orientationVectorTo:do:!comparisons!public! !
printFile!public! !
printOn:!public! !
printRank!public! !
rankIsEqualTo:!comparisons!public! !
rankIsGreaterThan:!comparisons!public! !
rankNumber!public! !
setFile:rank:!private! !
symbolDirectionFor:!comparisons!public! !
!

!ChessSquare class methodsFor!

allSquares

	^AllSquares!

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

file: aChessFile rank: aChessRank

	^self squareAt: (aChessFile printName, aChessRank printName) asSymbol!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\squeare.ico')!

initializeAllSquares

	AllSquares :=Dictionary new.
	#(#a1 #a2 #a3 #a4 #a5 #a6 #a7 #a8 #b1 #b2 #b3 #b4 #b5 #b6 #b7 #b8 #c1 #c2 #c3 #c4 #c5 #c6 #c7 #c8 #d1 #d2 #d3 #d4 #d5 #d6 #d7 #d8 #e1 #e2 #e3 #e4 #e5 #e6 #e7 #e8 #f1 #f2 #f3 #f4 #f5 #f6 #f7 #f8 #g1 #g2 #g3 #g4 #g5 #g6 #g7 #g8 #h1 #h2 #h3 #h4 #h5 #h6 #h7 #h8) 
		do: [:symbolCoordinate | | square |
			square := ChessSquare file: (ChessFile getFile: symbolCoordinate first asString) rank: (ChessRank getRank: (Integer fromString: symbolCoordinate second asString)).
			AllSquares at: symbolCoordinate put: square].
!

initializeValidMoves

	ValidMoves := Dictionary new.
	ValidMoves 
		at: #a1 put: self validMovesForA1;
		at: #a2 put: self validMovesForA2;
		at: #a3 put: self validMovesForA3;
		at: #a4 put: self validMovesForA4;
		at: #a5 put: self validMovesForA5;
		at: #a6 put: self validMovesForA6;
		at: #a7 put: self validMovesForA7;
		at: #a8 put: self validMovesForA8;
		at: #b1 put: self validMovesForB1;
		at: #b2 put: self validMovesForB2;
		at: #b3 put: self validMovesForB3;
		at: #b4 put: self validMovesForB4;
		at: #b5 put: self validMovesForB5;
		at: #b6 put: self validMovesForB6;
		at: #b7 put: self validMovesForB7;
		at: #b8 put: self validMovesForB8;
		at: #c1 put: self validMovesForC1;
		at: #c2 put: self validMovesForC2;		
		at: #c3 put: self validMovesForC3;
		at: #c4 put: self validMovesForC4;
		at: #c5 put: self validMovesForC5;
		at: #c6 put: self validMovesForC6;
		at: #c7 put: self validMovesForC7;
		at: #c8 put: self validMovesForC8;
		at: #d1 put: self validMovesForD1;
		at: #d2 put: self validMovesForD2;
		at: #d3 put: self validMovesForD3;
		at: #d4 put: self validMovesForD4;
		at: #d5 put: self validMovesForD5;		
		at: #d6 put: self validMovesForD6;
		at: #d7 put: self validMovesForD7;
		at: #d8 put: self validMovesForD8;
		at: #e1 put: self validMovesForE1;
		at: #e2 put: self validMovesForE2;
		at: #e3 put: self validMovesForE3;
		at: #e4 put: self validMovesForE4;
		at: #e5 put: self validMovesForE5;
		at: #e6 put: self validMovesForE6;
		at: #e7 put: self validMovesForE7;
		at: #e8 put: self validMovesForE8;
		at: #f1 put: self validMovesForF1;
		at: #f2 put: self validMovesForF2;
		at: #f3 put: self validMovesForF3;
		at: #f4 put: self validMovesForF4;
		at: #f5 put: self validMovesForF5;
		at: #f6 put: self validMovesForF6;
		at: #f7 put: self validMovesForF7;
		at: #f8 put: self validMovesForF8;
		at: #g1 put: self validMovesForG1;
		at: #g2 put: self validMovesForG2;
		at: #g3 put: self validMovesForG3;
		at: #g4 put: self validMovesForG4;
		at: #g5 put: self validMovesForG5;
		at: #g6 put: self validMovesForG6;
		at: #g7 put: self validMovesForG7;
		at: #g8 put: self validMovesForG8;
		at: #h1 put: self validMovesForH1;
		at: #h2 put: self validMovesForH2;
		at: #h3 put: self validMovesForH3;
		at: #h4 put: self validMovesForH4;
		at: #h5 put: self validMovesForH5;
		at: #h6 put: self validMovesForH6;
		at: #h7 put: self validMovesForH7;
		at: #h8 put: self validMovesForH8;
		yourself!

squareAt: aSymbol

	^AllSquares at: aSymbol!

validMovesForA1
	| validMoves |

	validMoves := Dictionary new.
	validMoves at: Queen name put: #(#a1 #a2 #a3 #a4 #a5 #a6 #a7 #a8 #b1 #c1 #d1 #e1 #f1 #g1 #h1 #b2 #c3 #d4 #e5 #f6 #g7 #h8);
		at: King name put: #(#a1 #a2 #b1 #b2);
		at: Rook name put: #(#a1 #a2 #a3 #a4 #a5 #a6 #a7 #a8 #b1 #c1 #d1 #e1 #f1 #g1 #h1);
		yourself! !
!ChessSquare class categoriesForMethods!
allSquares!public! !
fenSquares!public! !
file:rank:!public! !
icon!public! !
initializeAllSquares!public! !
initializeValidMoves!public!valid moves! !
squareAt:!public! !
validMovesForA1!public!valid moves! !
!

