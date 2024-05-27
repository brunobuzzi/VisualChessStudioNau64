"Filed out from Dolphin Smallalk"!

ChessPieceDictionary subclass: #OrientationDictionary
	instanceVariableNames: 'orientations'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
OrientationDictionary guid: (GUID fromString: '{e084e7f8-2963-4f35-9014-dd31ca2f67d4}')!
OrientationDictionary comment: ''!
!OrientationDictionary categoriesForClass!Unclassified! !
!OrientationDictionary methodsFor!

atEastAdd: aChessObject

	(orientations at: #east ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

atNorthAdd: aChessObject

	(orientations at: #north ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

atNorthEastAdd: aChessObject

	(orientations at: #northEast ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

atNorthWestAdd: aChessObject

	(orientations at: #northWest ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

atOrientation: orientationSymbol add: anChessObject

	self validateOrientationName: orientationSymbol.
	(orientations at: orientationSymbol ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: anChessObject!

atOrientation: symbolOrientationName put: anOrderedCollection

	self validateOrientationName: symbolOrientationName.
	orientations at: symbolOrientationName put: anOrderedCollection!

atSouthAdd: aChessObject

	(orientations at: #south ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

atSouthEastAdd: aChessObject

	(orientations at: #southEast ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

atSouthWestAdd: aChessObject

	(orientations at: #southWest ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

atWestAdd: aChessObject

	(orientations at: #west ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessObject!

collectionAndOrientationAtEastDo: aBlock

	aBlock value: (orientations at: #east ifAbsent: [#()]) value: #east!

collectionAndOrientationAtNorthDo: aBlock

	aBlock value: (orientations at: #north ifAbsent: [#()]) value: #north!

collectionAndOrientationAtNorthEastDo: aBlock

	aBlock value: (orientations at: #northEast ifAbsent: [#()]) value: #northEast!

collectionAndOrientationAtNorthWestDo: aBlock

	aBlock value: (orientations at: #northWest ifAbsent: [#()]) value: #northWest!

collectionAndOrientationAtSouthDo: aBlock

	aBlock value: (orientations at: #south ifAbsent: [#()]) value: #south!

collectionAndOrientationAtSouthEastDo: aBlock

	aBlock value: (orientations at: #southEast ifAbsent: [#()]) value: #southEast!

collectionAndOrientationAtSouthWestDo: aBlock

	aBlock value: (orientations at: #southWest ifAbsent: [#()]) value: #southWest!

collectionAndOrientationAtWestDo: aBlock

	aBlock value: (orientations at: #west ifAbsent: [#()]) value: #west!

collectionAndOrientationDo: aBlock

	self collectionAndOrientationAtNorthDo: aBlock.
	self collectionAndOrientationAtSouthDo: aBlock.
	self collectionAndOrientationAtEastDo: aBlock.
	self collectionAndOrientationAtWestDo: aBlock.
	self collectionAndOrientationAtNorthEastDo: aBlock.
	self collectionAndOrientationAtNorthWestDo: aBlock.
	self collectionAndOrientationAtSouthEastDo: aBlock.
	self collectionAndOrientationAtSouthWestDo: aBlock.!

collectionAtEastDo: aBlock

	aBlock value: (orientations at: #east ifAbsent: [#()]) !

collectionAtNorthDo: aBlock

	aBlock value: (orientations at: #north ifAbsent: [#()]) !

collectionAtNorthEastDo: aBlock

	aBlock value: (orientations at: #northEast ifAbsent: [#()]) !

collectionAtNorthWestDo: aBlock

	aBlock value: (orientations at: #northWest ifAbsent: [#()]) !

collectionAtSouthDo: aBlock

	aBlock value: (orientations at: #south ifAbsent: [#()]) !

collectionAtSouthEastDo: aBlock

	aBlock value: (orientations at: #southEast ifAbsent: [#()]) !

collectionAtSouthWestDo: aBlock

	aBlock value: (orientations at: #southWest ifAbsent: [#()]) !

collectionAtWestDo: aBlock

	aBlock value: (orientations at: #west ifAbsent: [#()]) !

collectionsDo: aBlock

	self collectionAtNorthDo: aBlock.
	self collectionAtSouthDo: aBlock.
	self collectionAtEastDo: aBlock.
	self collectionAtWestDo: aBlock.

	self collectionAtNorthEastDo: aBlock.
	self collectionAtNorthWestDo: aBlock.
	self collectionAtSouthEastDo: aBlock.
	self collectionAtSouthWestDo: aBlock.
!

detectForkedSquaresFor: aChessSide
	| attackedPieces forkedSquares |

	attackedPieces := 0.
	forkedSquares := OrderedCollection new.
	self squaresDo: [:square | 
		piece chessboardDo: [:chessboard |
			((chessboard squareNotEmptyAtCoordinate: square coordinate) and:[(chessboard pieceAt: square) isOppositeTo: aChessSide]) 
			ifTrue: [attackedPieces := attackedPieces + 1.
				forkedSquares add: square.].
		].
	].
	(attackedPieces <= 1) ifTrue: [^#()].
	^forkedSquares!

difference: aSquaresDictionary
	| newSquareDictionary |

	newSquareDictionary := SquaresDictionary on: piece.

	self squaresAtSouthDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atSouthAdd: each]].
	self squaresAtNorthDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atNorthAdd: each]].
	self squaresAtEastDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atEastAdd: each]].
	self squaresAtWestDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atWestAdd: each]].
	self squaresAtSouthWestDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atSouthWestAdd: each]].
	self squaresAtSouthEastDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atSouthEastAdd: each]].
	self squaresAtNorthWestDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atNorthWestAdd: each]].
	self squaresAtNorthEastDo: [:each | (aSquaresDictionary includes: each) ifFalse: [newSquareDictionary atNorthEastAdd: each]].

	^newSquareDictionary!

includes: aChessSquare

	self squaresDo: [:each | (each isEqualTo: aChessSquare) ifTrue: [^true]].

	^false!

includesAll: aCollection

	self squaresDo: [:each | (aCollection includes: each) ifFalse: [^false]].

	^true!

includesAtEast: aChessObject

	^(orientations at: #east) includes: aChessObject!

includesAtNorth: aChessObject

	^(orientations at: #north) includes: aChessObject!

includesAtNorthEast: aChessObject

	^(orientations at: #northEast) includes: aChessObject!

includesAtNorthWest: aChessObject

	^(orientations at: #northWest) includes: aChessObject!

includesAtSouth: aChessObject

	^(orientations at: #south) includes: aChessObject!

includesAtSouthEast: aChessObject

	^(orientations at: #southEast) includes: aChessObject!

includesAtSouthWest: aChessObject

	^(orientations at: #southWest) includes: aChessObject!

includesAtWest: aChessObject

	^(orientations at: #west) includes: aChessObject!

intersection: aSquaresDictionary
	| newSquareDictionary |

	newSquareDictionary := SquaresDictionary on: piece.

	self squaresAtSouthDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atSouthAdd: each]].
	self squaresAtNorthDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atNorthAdd: each]].
	self squaresAtEastDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atEastAdd: each]].
	self squaresAtWestDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atWestAdd: each]].
	self squaresAtSouthWestDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atSouthWestAdd: each]].
	self squaresAtSouthEastDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atSouthEastAdd: each]].
	self squaresAtNorthWestDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atNorthWestAdd: each]].
	self squaresAtNorthEastDo: [:each | (aSquaresDictionary includes: each) ifTrue: [newSquareDictionary atNorthEastAdd: each]].

	^newSquareDictionary!

isEmpty

	^orientations allSatisfy: [:collection | collection isEmpty]!

orientationAnySatisfy: aBlock

	self orientationDo: [:each | (aBlock value: each) ifTrue: [^true]].

	^false!

orientationAtEastDo: aBlock

	(orientations at: #east ifAbsent: [#()]) do: aBlock!

orientationAtNorthDo: aBlock

	(orientations at: #north ifAbsent: [#()]) do: aBlock!

orientationAtNorthEastDo: aBlock

	(orientations at: #northEast ifAbsent: [#()]) do: aBlock!

orientationAtNorthWestDo: aBlock

	(orientations at: #northWest ifAbsent: [#()]) do: aBlock!

orientationAtSouthDo: aBlock

	(orientations at: #south ifAbsent: [#()]) do: aBlock!

orientationAtSouthEastDo: aBlock

	(orientations at: #southEast ifAbsent: [#()]) do: aBlock!

orientationAtSouthWestDo: aBlock

	(orientations at: #southWest ifAbsent: [#()]) do: aBlock!

orientationAtWestDo: aBlock

	(orientations at: #west ifAbsent: [#()]) do: aBlock!

orientationsDo: aBlock

	self orientationAtNorthDo: aBlock.
	self orientationAtSouthDo: aBlock.
	self orientationAtEastDo: aBlock.
	self orientationAtWestDo: aBlock.
	self orientationAtNorthEastDo: aBlock.
	self orientationAtNorthWestDo: aBlock.
	self orientationAtSouthEastDo: aBlock.
	self orientationAtSouthWestDo: aBlock.!

orientationsSize

	^orientations keys size!

remove: aChessSquare

	orientations do: [:collection | collection remove: aChessSquare ifAbsent: []]!

remove: aChessSquare ifAbsent: aNiladicValuable 
	^Error notYetImplemented!

setChessPiece: aChessPiece

	super setChessPiece: aChessPiece.

	orientations := Dictionary new.!

sizeAt: symbolOrientationName

	self validateOrientationName: symbolOrientationName.

	^(orientations at: symbolOrientationName ifAbsent: [^0]) size!

totalSize
	| size |

	size := 0.
	orientations do: [:collection | size := size + collection size].

	^size
	!

validateOrientationName: symbolOrientationName
	(#(#south #north #west #east #southWest #southEast #northEast #northWest)
		includes: symbolOrientationName) ifFalse: [self error: 'Invalid Orientation']! !
!OrientationDictionary categoriesForMethods!
atEastAdd:!add element!public! !
atNorthAdd:!add element!public! !
atNorthEastAdd:!add element!public! !
atNorthWestAdd:!add element!public! !
atOrientation:add:!add element!public! !
atOrientation:put:!add element!public! !
atSouthAdd:!add element!public! !
atSouthEastAdd:!add element!public! !
atSouthWestAdd:!add element!public! !
atWestAdd:!add element!public! !
collectionAndOrientationAtEastDo:!enumerating!new framework!public! !
collectionAndOrientationAtNorthDo:!enumerating!new framework!public! !
collectionAndOrientationAtNorthEastDo:!enumerating!new framework!public! !
collectionAndOrientationAtNorthWestDo:!enumerating!new framework!public! !
collectionAndOrientationAtSouthDo:!enumerating!new framework!public! !
collectionAndOrientationAtSouthEastDo:!enumerating!new framework!public! !
collectionAndOrientationAtSouthWestDo:!enumerating!new framework!public! !
collectionAndOrientationAtWestDo:!enumerating!new framework!public! !
collectionAndOrientationDo:!enumerating!new framework!public! !
collectionAtEastDo:!enumerating!public! !
collectionAtNorthDo:!enumerating!public! !
collectionAtNorthEastDo:!enumerating!public! !
collectionAtNorthWestDo:!enumerating!public! !
collectionAtSouthDo:!enumerating!public! !
collectionAtSouthEastDo:!enumerating!public! !
collectionAtSouthWestDo:!enumerating!public! !
collectionAtWestDo:!enumerating!public! !
collectionsDo:!enumerating!public! !
detectForkedSquaresFor:!public!tactics searchs! !
difference:!public!set operations! !
includes:!public!searching! !
includesAll:!public!searching! !
includesAtEast:!public!searching! !
includesAtNorth:!public!searching! !
includesAtNorthEast:!public!searching! !
includesAtNorthWest:!public!searching! !
includesAtSouth:!public!searching! !
includesAtSouthEast:!public!searching! !
includesAtSouthWest:!public!searching! !
includesAtWest:!public!searching! !
intersection:!public!searching!set operations! !
isEmpty!public!set operations! !
orientationAnySatisfy:!enumerating!public! !
orientationAtEastDo:!enumerating!public! !
orientationAtNorthDo:!enumerating!public! !
orientationAtNorthEastDo:!enumerating!public! !
orientationAtNorthWestDo:!enumerating!public! !
orientationAtSouthDo:!enumerating!public! !
orientationAtSouthEastDo:!enumerating!public! !
orientationAtSouthWestDo:!enumerating!public! !
orientationAtWestDo:!enumerating!public! !
orientationsDo:!enumerating!public! !
orientationsSize!enumerating!public! !
remove:!public!set operations! !
remove:ifAbsent:!public! !
setChessPiece:!private! !
sizeAt:!add element!public! !
totalSize!enumerating!public! !
validateOrientationName:!add element!public! !
!

