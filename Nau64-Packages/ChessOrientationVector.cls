"Filed out from Dolphin Smallalk"!

ChessVector subclass: #ChessOrientationVector
	instanceVariableNames: 'southOrNorth eastOrWest'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessOrientationVector guid: (GUID fromString: '{50315640-4454-4080-8263-f5ad34009e23}')!
ChessOrientationVector comment: ''!
!ChessOrientationVector categoriesForClass!Unclassified! !
!ChessOrientationVector methodsFor!

fileSign
	^eastOrWest ifNil: [0] ifNotNil: [eastOrWest fileSign]!

icon
	| point |
	point := self unicodeValue.
	^TextTileIcon text: (Character codePoint: point) asUtf16String fontName: 'Malgun Gothic'!

intialize!

isCompatibleWithBishop

	^southOrNorth notNil and: [eastOrWest notNil]!

isCompatibleWithQueen

	^self isCompatibleWithRook or: [self isCompatibleWithBishop]!

isCompatibleWithRook

	^(southOrNorth notNil and: [eastOrWest isNil]) or: [southOrNorth isNil and:[eastOrWest notNil]]!

isEast

	^southOrNorth isNil and: [eastOrWest isEast]!

isNorth

	^eastOrWest isNil and: [southOrNorth isNorth]!

isNorthEast

	^southOrNorth isNorth and: [eastOrWest isEast]!

isNorthWest

	^southOrNorth isNorth and: [eastOrWest isWest]!

isPinCompatibleOnDiagonalWithOrientationNamed: aSymbol

	(#(#south #north #west #east) includes: aSymbol) ifTrue: [^false].

	self isSouthEast ifTrue: [^aSymbol == #northWest or: [aSymbol = #southEast]].
	self isSouthWest ifTrue: [^aSymbol == #northEast or: [aSymbol = #southWest]].

	self isNorthEast ifTrue: [^aSymbol == #southWest or: [aSymbol = #northEast]].
	self isNorthWest ifTrue: [^aSymbol == #southEast or: [aSymbol = #northWest]].

	self error: 'No diagonal orientation not supported'

	"aSymbol --> #south, #north, #west, #east, #northEast, #northWest, #southEast, #southWest"

	"southOrNorth --> #south | #north
	eastOrWest --> #east | #west "!

isPinCompatibleOnNonDiagonalWithOrientationNamed: aSymbol

	(self isSouth or: [self isNorth]) ifTrue: [^southOrNorth pinCompatibleOrientations includes: aSymbol].

	(self isEast or: [self isWest]) ifTrue: [^eastOrWest pinCompatibleOrientations includes: aSymbol].

	self error: 'No diagonal orientation not supported'

	"aSymbol --> #south, #north, #west, #east, #northEast, #northWest, #southEast, #southWest"

	"southOrNorth --> #south | #north | nil
	eastOrWest --> #east | #west | nil"!

isPinCompatibleWithOrientationNamed: aSymbol

	^(southOrNorth notNil and: [eastOrWest notNil]) 
	ifTrue: [self isPinCompatibleOnDiagonalWithOrientationNamed: aSymbol]
	ifFalse: [self isPinCompatibleOnNonDiagonalWithOrientationNamed: aSymbol]

	"aSymbol --> #south, #north, #west, #east, #northEast, #northWest, #southEast, #southWest"

	"southOrNorth --> #south | #north | nil
	eastOrWest --> #east | #west | nil"


!

isSouth

	^eastOrWest isNil and: [southOrNorth isSouth]!

isSouthEast

	^southOrNorth isSouth and: [eastOrWest isEast]!

isSouthWest

	^southOrNorth isSouth and: [eastOrWest isWest]!

isWest

	^southOrNorth isNil and: [eastOrWest isWest]!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', self vectorName, ']'!

rankSign
	^southOrNorth ifNil: [0] ifNotNil: [southOrNorth rankSign]!

unicodeValue

	self isNorth ifTrue: [^8657].
	self isSouth ifTrue: [^8659].
	self isWest ifTrue: [^8656].
	self isEast ifTrue: [^8658].
	self isNorthWest ifTrue: [^8662].
	self isNorthEast ifTrue: [^8663].
	self isSouthWest ifTrue: [^8665].
	self isSouthEast ifTrue: [^8664].
	self error: 'Bad Orientation Vector'!

updateOrientationForSource: sourceChessSquare target: targetChessSquare

	(sourceChessSquare rankIsGreaterThan: targetChessSquare) ifTrue: [self updateToSouth].
	(targetChessSquare rankIsGreaterThan: sourceChessSquare) ifTrue: [self updateToNorth].

	(sourceChessSquare fileIsGreaterThan: targetChessSquare) ifTrue: [self updateToWest].
	(targetChessSquare fileIsGreaterThan: sourceChessSquare) ifTrue: [self updateToEast].!

updateToEast

	eastOrWest := ChessEastOrientation new.!

updateToNorth

	southOrNorth := ChessNorthOrientation new.!

updateToSouth

	southOrNorth := ChessSouthOrientation new.!

updateToWest

	eastOrWest := ChessWestOrientation new.!

vectorName

	self isNorth ifTrue: [^#north].
	self isSouth ifTrue: [^#south].
	self isWest ifTrue: [^#west].
	self isEast ifTrue: [^#east].
	self isNorthWest ifTrue: [^#northWest].
	self isNorthEast ifTrue: [^#northEast].
	self isSouthWest ifTrue: [^#southWest].
	self isSouthEast ifTrue: [^#southEast].

	self error: 'Bad Orientation Vector'! !
!ChessOrientationVector categoriesForMethods!
fileSign!new framework!public!squares iteration! !
icon!new framework!public! !
intialize!public! !
isCompatibleWithBishop!public!squares iteration! !
isCompatibleWithQueen!public!squares iteration! !
isCompatibleWithRook!public!squares iteration! !
isEast!new framework!public!testing! !
isNorth!new framework!public!testing! !
isNorthEast!new framework!public!testing! !
isNorthWest!new framework!public!testing! !
isPinCompatibleOnDiagonalWithOrientationNamed:!new framework!public! !
isPinCompatibleOnNonDiagonalWithOrientationNamed:!new framework!public! !
isPinCompatibleWithOrientationNamed:!new framework!public! !
isSouth!new framework!public!testing! !
isSouthEast!new framework!public!testing! !
isSouthWest!new framework!public!testing! !
isWest!new framework!public!testing! !
printOn:!public! !
rankSign!new framework!public!squares iteration! !
unicodeValue!new framework!public! !
updateOrientationForSource:target:!public! !
updateToEast!orientation settings!public! !
updateToNorth!orientation settings!public! !
updateToSouth!orientation settings!public! !
updateToWest!orientation settings!public! !
vectorName!new framework!public! !
!

!ChessOrientationVector class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 8663) asUtf16String fontName: 'Malgun Gothic'!

new

	^super new intialize!

newAtEastFor: aChessSquare
	^(self newFor: aChessSquare) updateToEast!

newAtNorthEastFor: aChessSquare
	^(self newFor: aChessSquare)
		updateToNorth;
		updateToEast!

newAtNorthFor: aChessSquare
	^(self newFor: aChessSquare) updateToNorth!

newAtNorthWestFor: aChessSquare
	^(self newFor: aChessSquare)
		updateToNorth;
		updateToWest!

newAtSoutEastFor: aChessSquare
	^(self newFor: aChessSquare)
		updateToSouth;
		updateToEast!

newAtSouthFor: aChessSquare
	^(self newFor: aChessSquare) updateToSouth!

newAtSoutWestFor: aChessSquare
	^(self newFor: aChessSquare)
		updateToSouth;
		updateToWest!

newAtWestFor: aChessSquare
	^(self newFor: aChessSquare) updateToWest!

newEast
	^self new updateToEast!

newFor: aChessPiece
	^self new sourcePiece: aChessPiece!

newFor: aChessPiece orientation: aChessOrientation

	^aChessOrientation newVectorFor: aChessPiece

	!

newFrom:  sourceChessSquare to: targetChessSquare
	| orientationVector |

	orientationVector := self new.
	(sourceChessSquare isEqualTo: targetChessSquare) ifTrue: [^self error: 'An orientation vector for the same chess squares is useless' ].

	orientationVector updateOrientationForSource: sourceChessSquare target: targetChessSquare.

	^orientationVector!

newNorth
	^self new updateToNorth!

newNorthEast
	^self new 
		updateToNorth;
		updateToEast!

newNorthWest
	^self new 
		updateToNorth;
		updateToWest!

newSouth
	^self new updateToSouth!

newSouthEast
	^self new 
		updateToSouth;
		updateToEast!

newSouthWest
	^self new 
		updateToSouth;
		updateToWest!

newWest
	^self new updateToWest! !
!ChessOrientationVector class categoriesForMethods!
icon!public! !
new!new framework!public! !
newAtEastFor:!public! !
newAtNorthEastFor:!public! !
newAtNorthFor:!public! !
newAtNorthWestFor:!public! !
newAtSoutEastFor:!public! !
newAtSouthFor:!public! !
newAtSoutWestFor:!public! !
newAtWestFor:!public! !
newEast!new framework!public! !
newFor:!public! !
newFor:orientation:!public! !
newFrom:to:!public! !
newNorth!new framework!public! !
newNorthEast!new framework!public! !
newNorthWest!new framework!public! !
newSouth!new framework!public! !
newSouthEast!new framework!public! !
newSouthWest!new framework!public! !
newWest!new framework!public! !
!

