"Filed out from Dolphin Smallalk"!

Object subclass: #ChessSquare
	instanceVariableNames: 'systemRoot file rank'
	classVariableNames: ''
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

isBlackEnPassantRank

	^self rankNumber = 5!

isEqualTo: aChessSquare

	^self printFile = aChessSquare printFile and:[self rankNumber = aChessSquare rankNumber]!

isWhite

	^self isBlack not

!

isWhiteEnPassantRank

	^self rankNumber = 4!

name
	^self printFile, self printRank!

neutralBitmap

	^Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\verde_escaqueNegro.bmp'!

nextFile: fileShift nextRank: rankShift onSuccessDo: aBlock onErrorDo: monadicBlock
	| nextSquare |
	[nextSquare := systemRoot squareAtFile: (file next: fileShift) atRank: (rank next: rankShift)] on: Error
		do: [:ex | ^monadicBlock value: ex].
	aBlock value: nextSquare!

notEqualTo: aChessSquare

	^self printFile ~= aChessSquare printFile or:[self rankNumber ~= aChessSquare rankNumber]!

oppositeBitmap

	^self isBlack 
		ifFalse: [Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\azul_escaqueNegro.bmp'] 
		ifTrue: [Bitmap fromFile: FileLocator imageRelative basePath , 'Ajedrez\azul_escaqueBlanco.bmp']!

printFile

	^file printName!

printName
	^self printFile, self printRank!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', self printName, ']'!

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

setRoot: aSystemRoot file: aChessFile rank: aChessRank 

	systemRoot := aSystemRoot.
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
isBlackEnPassantRank!public! !
isEqualTo:!comparisons!public! !
isWhite!public! !
isWhiteEnPassantRank!public! !
name!public! !
neutralBitmap!public! !
nextFile:nextRank:onSuccessDo:onErrorDo:!public! !
notEqualTo:!comparisons!public! !
oppositeBitmap!public! !
printFile!public! !
printName!public! !
printOn:!public! !
printRank!public! !
rankIsEqualTo:!comparisons!public! !
rankIsGreaterThan:!comparisons!public! !
rankNumber!public! !
setFile:rank:!private! !
setRoot:file:rank:!private! !
symbolDirectionFor:!comparisons!public! !
!

!ChessSquare class methodsFor!

icon
	^Icon fromFile: (FileLocator imageRelative basePath, 'Ajedrez\squeare.ico')!

newFile: aChessFile rank: aChessRank on: aSystemRoot

	^self new setRoot: aSystemRoot file: aChessFile rank: aChessRank! !
!ChessSquare class categoriesForMethods!
icon!public! !
newFile:rank:on:!public! !
!

