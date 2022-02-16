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
			square := ChessSquare newFile: (ChessFile getFile: symbolCoordinate first asString) rank: (ChessRank getRank: (Integer fromString: symbolCoordinate second asString)).
			AllSquares at: symbolCoordinate put: square].
!

newFile: aChessFile rank: aChessRank

	^self new setFile: aChessFile rank: aChessRank!

squareAt: aSymbol

	^AllSquares at: aSymbol! !
!ChessSquare class categoriesForMethods!
allSquares!public! !
fenSquares!public! !
file:rank:!public! !
icon!public! !
initializeAllSquares!public! !
newFile:rank:!public! !
squareAt:!public! !
!

