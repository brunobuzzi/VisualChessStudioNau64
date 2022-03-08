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

add: aChessSquare to: aCollection

	(aCollection includes: aChessSquare) ifTrue: [^aChessSquare].

	aCollection add: aChessSquare!

atEastAdd: aChessSquare

	(squares at: #east ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atNorthAdd: aChessSquare

	(squares at: #north ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atNorthEastAdd: aChessSquare

	(squares at: #northEast ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atNorthWestAdd: aChessSquare

	(squares at: #northWest ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atSouthAdd: aChessSquare

	(squares at: #south ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atSouthEastAdd: aChessSquare

	(squares at: #southEast ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atSouthWestAdd: aChessSquare

	(squares at: #southWest ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atWestAdd: aChessSquare

	(squares at: #west ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

detectAbsolutePinSquaresFor: aChessSide
	| attackedPieces forkedSquares |

	attackedPieces := 0.
	forkedSquares := OrderedCollection new.
	self squaresDo: [:square | 
		aChessSide chessboardDo: [:chessboard |
			piece skewerPieceOn: chessboard from: square do: [].
			((chessboard squareNotEmptyAtCoordinate: square coordinate) and:[(chessboard pieceAt: square) isOppositeTo: aChessSide]) 
			ifTrue: [attackedPieces := attackedPieces + 1.
				forkedSquares add: square.].
		].
	].
	(attackedPieces <= 1) ifTrue: [^#()].
	^forkedSquares!

detectForkedSquaresFor: aChessSide
	| attackedPieces forkedSquares |

	attackedPieces := 0.
	forkedSquares := OrderedCollection new.
	self squaresDo: [:square | 
		aChessSide chessboardDo: [:chessboard |
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

includesAtEast: aChessSquare

	^(squares at: #east) includes: aChessSquare!

includesAtNorth: aChessSquare

	^(squares at: #north) includes: aChessSquare!

includesAtNorthEast: aChessSquare

	^(squares at: #northEast) includes: aChessSquare!

includesAtNorthWest: aChessSquare

	^(squares at: #northWest) includes: aChessSquare!

includesAtSouth: aChessSquare

	^(squares at: #south) includes: aChessSquare!

includesAtSouthEast: aChessSquare

	^(squares at: #southEast) includes: aChessSquare!

includesAtSouthWest: aChessSquare

	^(squares at: #southWest) includes: aChessSquare!

includesAtWest: aChessSquare

	^(squares at: #west) includes: aChessSquare!

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
add:to:!add element!public! !
atEastAdd:!add element!public! !
atNorthAdd:!add element!public! !
atNorthEastAdd:!add element!public! !
atNorthWestAdd:!add element!public! !
atSouthAdd:!add element!public! !
atSouthEastAdd:!add element!public! !
atSouthWestAdd:!add element!public! !
atWestAdd:!add element!public! !
detectAbsolutePinSquaresFor:!public!tactics searchs! !
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

