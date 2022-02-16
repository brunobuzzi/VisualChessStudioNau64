"Filed out from Dolphin Smallalk"!

Object subclass: #SquaresDictionary
	instanceVariableNames: 'squares piece'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SquaresDictionary guid: (GUID fromString: '{48a2cf70-b5dd-462d-a064-6e0690cf8202}')!
SquaresDictionary comment: ''!
!SquaresDictionary categoriesForClass!Unclassified! !
!SquaresDictionary methodsFor!

atEastAdd: aChessSquare

	(squares at: #east ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atEastPut: aCollection

	squares at: #east put: aCollection!

atNorthAdd: aChessSquare

	(squares at: #north ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atNorthEastAdd: aChessSquare

	(squares at: #northEast ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atNorthEastPut: aCollection

	squares at: #northEast put: aCollection!

atNorthPut: aCollection

	squares at: #north put: aCollection!

atNorthWestAdd: aChessSquare

	(squares at: #northWest ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atNorthWestPut: aCollection

	squares at: #northWest put: aCollection!

atSouthAdd: aChessSquare

	(squares at: #south ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atSouthEastAdd: aChessSquare

	(squares at: #southEast ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atSouthEastPut: aCollection

	squares at: #southEast put: aCollection!

atSouthPut: aCollection

	squares at: #south put: aCollection!

atSouthWestAdd: aChessSquare

	(squares at: #southWest ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atSouthWestPut: aCollection

	squares at: #southWest put: aCollection!

atWestAdd: aChessSquare

	(squares at: #west ifAbsentPut: [OrderedCollection new]) add: aChessSquare!

atWestPut: aCollection

	squares at: #west put: aCollection!

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

	^squares allSatisfy: [:collection | collection isEmpty]!

remove: aChessSquare

	squares do: [:collection | collection remove: aChessSquare ifAbsent: []]!

setChessPiece: aChessPiece

	piece := aChessPiece.

	squares := Dictionary new.!

squaresAnySatisfy: aBlock

	self squaresDo: [:each | (aBlock value: each) ifTrue: [^true]].

	^false!

squaresAtEastDo: aBlock

	(squares at: #east ifAbsent: [#()]) do: aBlock!

squaresAtNorthDo: aBlock

	(squares at: #north ifAbsent: [#()]) do: aBlock!

squaresAtNorthEastDo: aBlock

	(squares at: #northEast ifAbsent: [#()]) do: aBlock!

squaresAtNorthWestDo: aBlock

	(squares at: #northWest ifAbsent: [#()]) do: aBlock!

squaresAtSouthDo: aBlock

	(squares at: #south ifAbsent: [#()]) do: aBlock!

squaresAtSouthEastDo: aBlock

	(squares at: #southEast ifAbsent: [#()]) do: aBlock!

squaresAtSouthWestDo: aBlock

	(squares at: #southWest ifAbsent: [#()]) do: aBlock!

squaresAtWestDo: aBlock

	(squares at: #west ifAbsent: [#()]) do: aBlock!

squaresDo: aBlock

	self squaresAtNorthDo: aBlock.
	self squaresAtSouthDo: aBlock.
	self squaresAtEastDo: aBlock.
	self squaresAtWestDo: aBlock.
	self squaresAtNorthEastDo: aBlock.
	self squaresAtNorthWestDo: aBlock.
	self squaresAtSouthEastDo: aBlock.
	self squaresAtSouthWestDo: aBlock.!

squaresSize
	| size |
	size := 0.

	self squaresDo: [:each | size := size + 1].

	^size! !
!SquaresDictionary categoriesForMethods!
atEastAdd:!add element!public! !
atEastPut:!public!put collection! !
atNorthAdd:!add element!public! !
atNorthEastAdd:!add element!public! !
atNorthEastPut:!public!put collection! !
atNorthPut:!public!put collection! !
atNorthWestAdd:!add element!public! !
atNorthWestPut:!public!put collection! !
atSouthAdd:!add element!public! !
atSouthEastAdd:!add element!public! !
atSouthEastPut:!public!put collection! !
atSouthPut:!public!put collection! !
atSouthWestAdd:!add element!public! !
atSouthWestPut:!public!put collection! !
atWestAdd:!add element!public! !
atWestPut:!public!put collection! !
difference:!public!set operations! !
includes:!public!searching! !
includesAll:!public!searching! !
intersection:!public!searching!set operations! !
isEmpty!public!set operations! !
remove:!public!set operations! !
setChessPiece:!private! !
squaresAnySatisfy:!enumerating!public! !
squaresAtEastDo:!enumerating!public! !
squaresAtNorthDo:!enumerating!public! !
squaresAtNorthEastDo:!enumerating!public! !
squaresAtNorthWestDo:!enumerating!public! !
squaresAtSouthDo:!enumerating!public! !
squaresAtSouthEastDo:!enumerating!public! !
squaresAtSouthWestDo:!enumerating!public! !
squaresAtWestDo:!enumerating!public! !
squaresDo:!enumerating!public! !
squaresSize!enumerating!public! !
!

!SquaresDictionary class methodsFor!

icon

	^Icon fromId: 'SystemDictionary.ico'!

on: aChessPiece

	^self new setChessPiece: aChessPiece! !
!SquaresDictionary class categoriesForMethods!
icon!public! !
on:!public! !
!

