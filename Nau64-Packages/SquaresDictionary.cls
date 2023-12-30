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

atOrientation: symbolOrientationName put: anOrderedCollection
	self validateOrientationName: symbolOrientationName.
	squares at: symbolOrientationName put: anOrderedCollection!

atSouthAdd: aChessSquare

	(squares at: #south ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atSouthEastAdd: aChessSquare

	(squares at: #southEast ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atSouthWestAdd: aChessSquare

	(squares at: #southWest ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

atWestAdd: aChessSquare

	(squares at: #west ifAbsentPut: [OrderedCollection new]) ifAbsentAdd: aChessSquare!

chessboardDo: monadicBlock

	piece chessboardDo: [:chessboard | monadicBlock value: chessboard]!

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

pieceDo: monadicBlock

	monadicBlock value: piece!

pruneUnreachableSquares

	piece pruneUnreacheableSquaresFrom: self
	!

pruneUnreachableSquaresFromSlidingPiece

	#(#north #south #west #east #northWest #northEast #southWest #southEast) do: [:direction | | prunedCollection existOtherPiece |
		prunedCollection := OrderedCollection new.
		existOtherPiece := false.
		(squares at: direction ifAbsent: [#()]) do: [:eachSquare | 
			existOtherPiece 
			ifFalse: [
				piece chessboardDo: [:chessboard | 
					chessboard 
						pieceAt: eachSquare 
						do: [:squarePiece | 
							(piece isOppositeSideTo: squarePiece) 
							ifTrue: [prunedCollection add: eachSquare. existOtherPiece := true]
							ifFalse: [existOtherPiece := true]] 
						ifAbsent: [prunedCollection add: eachSquare]
				].
			].
			squares at: direction put: prunedCollection.
		].
	].
	
	!

pruneUnreacheableSquaresFromBlackPawn

	#(#south #southWest #southEast ) do: [:direction | | prunedCollection |
		prunedCollection := OrderedCollection new.
		(squares at: direction ifAbsent: [#()]) do: [:eachSquare | 
			piece chessboardDo: [:chessboard | 
				chessboard 
					pieceAt: eachSquare 
					do: [:squarePiece | 
						(direction = #south) 
						ifFalse: [(piece isOppositeSideTo: squarePiece) ifTrue: [prunedCollection add: eachSquare]].
						] 
					ifAbsent: [(direction = #south) ifTrue: [prunedCollection add: eachSquare]]
			].
			squares at: direction put: prunedCollection.
		].
	].
	
	
	!

pruneUnreacheableSquaresFromKing

	#(#north #south #west #east #northWest #northEast #southWest #southEast) do: [:direction | | prunedCollection |
		prunedCollection := OrderedCollection new.
		(squares at: direction ifAbsent: [#()]) do: [:eachSquare | 
			piece chessboardDo: [:chessboard | 
				chessboard 
					pieceAt: eachSquare 
					do: [:squarePiece | 
						(piece isOppositeSideTo: squarePiece) ifTrue: [prunedCollection add: eachSquare]
						] 
					ifAbsent: [prunedCollection add: eachSquare]
			].

			squares at: direction put: prunedCollection.
		].
	].
	
	!

pruneUnreacheableSquaresFromKnight

	#(#northWest #northEast #southWest #southEast) do: [:direction | | prunedCollection |
		prunedCollection := OrderedCollection new.
		(squares at: direction ifAbsent: [#()]) do: [:eachSquare | 
			piece chessboardDo: [:chessboard | 
				chessboard 
					pieceAt: eachSquare 
					do: [:squarePiece | 
						(piece isOppositeSideTo: squarePiece) ifTrue: [prunedCollection add: eachSquare]
						] 
					ifAbsent: [prunedCollection add: eachSquare]
			].
			squares at: direction put: prunedCollection.
		].
	].
	
	!

pruneUnreacheableSquaresFromWhitePawn

	#(#north #northWest #northEast ) do: [:direction | | prunedCollection |
		prunedCollection := OrderedCollection new.
		(squares at: direction ifAbsent: [#()]) do: [:eachSquare | 
			piece chessboardDo: [:chessboard | 
				chessboard 
					pieceAt: eachSquare 
					do: [:squarePiece | 
						(direction = #north) 
						ifFalse: [(piece isOppositeSideTo: squarePiece) ifTrue: [prunedCollection add: eachSquare]].
						] 
					ifAbsent: [(direction = #north) ifTrue: [prunedCollection add: eachSquare]]
			].
			squares at: direction put: prunedCollection.
		].
	].
	
	!

remove: aChessSquare

	squares do: [:collection | collection remove: aChessSquare ifAbsent: []]!

setChessPiece: aChessPiece

	piece := aChessPiece.

	squares := Dictionary new.!

sizeAt: symbolOrientationName

	self validateOrientationName: symbolOrientationName.

	^(squares at: symbolOrientationName ifAbsent: [^0]) size!

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

squaresCollectionAndOrientationAtEastDo: aBlock

	aBlock value: (squares at: #east ifAbsent: [#()]) value: #east!

squaresCollectionAndOrientationAtNorthDo: aBlock

	aBlock value: (squares at: #north ifAbsent: [#()]) value: #north!

squaresCollectionAndOrientationAtNorthEastDo: aBlock

	aBlock value: (squares at: #northEast ifAbsent: [#()]) value: #northEast!

squaresCollectionAndOrientationAtNorthWestDo: aBlock

	aBlock value: (squares at: #northWest ifAbsent: [#()]) value: #northWest!

squaresCollectionAndOrientationAtSouthDo: aBlock

	aBlock value: (squares at: #south ifAbsent: [#()]) value: #south!

squaresCollectionAndOrientationAtSouthEastDo: aBlock

	aBlock value: (squares at: #southEast ifAbsent: [#()]) value: #southEast!

squaresCollectionAndOrientationAtSouthWestDo: aBlock

	aBlock value: (squares at: #southWest ifAbsent: [#()]) value: #southWest!

squaresCollectionAndOrientationAtWestDo: aBlock

	aBlock value: (squares at: #west ifAbsent: [#()]) value: #west!

squaresCollectionAndOrientationDo: aBlock

	self squaresCollectionAndOrientationAtNorthDo: aBlock.
	self squaresCollectionAndOrientationAtSouthDo: aBlock.
	self squaresCollectionAndOrientationAtEastDo: aBlock.
	self squaresCollectionAndOrientationAtWestDo: aBlock.
	self squaresCollectionAndOrientationAtNorthEastDo: aBlock.
	self squaresCollectionAndOrientationAtNorthWestDo: aBlock.
	self squaresCollectionAndOrientationAtSouthEastDo: aBlock.
	self squaresCollectionAndOrientationAtSouthWestDo: aBlock.!

squaresCollectionAtEastDo: aBlock

	aBlock value: (squares at: #east ifAbsent: [#()]) !

squaresCollectionAtNorthDo: aBlock

	aBlock value: (squares at: #north ifAbsent: [#()]) !

squaresCollectionAtNorthEastDo: aBlock

	aBlock value: (squares at: #northEast ifAbsent: [#()]) !

squaresCollectionAtNorthWestDo: aBlock

	aBlock value: (squares at: #northWest ifAbsent: [#()]) !

squaresCollectionAtSouthDo: aBlock

	aBlock value: (squares at: #south ifAbsent: [#()]) !

squaresCollectionAtSouthEastDo: aBlock

	aBlock value: (squares at: #southEast ifAbsent: [#()]) !

squaresCollectionAtSouthWestDo: aBlock

	aBlock value: (squares at: #southWest ifAbsent: [#()]) !

squaresCollectionAtWestDo: aBlock

	aBlock value: (squares at: #west ifAbsent: [#()]) !

squaresCollectionDo: aBlock

	self squaresCollectionAtNorthDo: aBlock.
	self squaresCollectionAtSouthDo: aBlock.
	self squaresCollectionAtEastDo: aBlock.
	self squaresCollectionAtWestDo: aBlock.

	self squaresCollectionAtNorthEastDo: aBlock.
	self squaresCollectionAtNorthWestDo: aBlock.
	self squaresCollectionAtSouthEastDo: aBlock.
	self squaresCollectionAtSouthWestDo: aBlock.
!

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
	^size!

validateOrientationName: symbolOrientationName
	(#(#south #north #west #east #southWest #southEast #northEast #northWest)
		includes: symbolOrientationName) ifFalse: [self error: 'Invalid Orientation']!

viewSquares

	^self! !
!SquaresDictionary categoriesForMethods!
add:to:!add element!public! !
atEastAdd:!add element!public! !
atNorthAdd:!add element!public! !
atNorthEastAdd:!add element!public! !
atNorthWestAdd:!add element!public! !
atOrientation:put:!add element!public! !
atSouthAdd:!add element!public! !
atSouthEastAdd:!add element!public! !
atSouthWestAdd:!add element!public! !
atWestAdd:!add element!public! !
chessboardDo:!public! !
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
pieceDo:!public!tactics searchs! !
pruneUnreachableSquares!enumerating!new framework!public! !
pruneUnreachableSquaresFromSlidingPiece!enumerating!new framework!public! !
pruneUnreacheableSquaresFromBlackPawn!enumerating!new framework!public! !
pruneUnreacheableSquaresFromKing!enumerating!new framework!public! !
pruneUnreacheableSquaresFromKnight!enumerating!new framework!public! !
pruneUnreacheableSquaresFromWhitePawn!enumerating!new framework!public! !
remove:!public!set operations! !
setChessPiece:!private! !
sizeAt:!add element!public! !
squaresAnySatisfy:!enumerating!public! !
squaresAtEastDo:!enumerating!public! !
squaresAtNorthDo:!enumerating!public! !
squaresAtNorthEastDo:!enumerating!public! !
squaresAtNorthWestDo:!enumerating!public! !
squaresAtSouthDo:!enumerating!public! !
squaresAtSouthEastDo:!enumerating!public! !
squaresAtSouthWestDo:!enumerating!public! !
squaresAtWestDo:!enumerating!public! !
squaresCollectionAndOrientationAtEastDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationAtNorthDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationAtNorthEastDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationAtNorthWestDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationAtSouthDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationAtSouthEastDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationAtSouthWestDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationAtWestDo:!enumerating!new framework!public! !
squaresCollectionAndOrientationDo:!enumerating!new framework!public! !
squaresCollectionAtEastDo:!enumerating!public! !
squaresCollectionAtNorthDo:!enumerating!public! !
squaresCollectionAtNorthEastDo:!enumerating!public! !
squaresCollectionAtNorthWestDo:!enumerating!public! !
squaresCollectionAtSouthDo:!enumerating!public! !
squaresCollectionAtSouthEastDo:!enumerating!public! !
squaresCollectionAtSouthWestDo:!enumerating!public! !
squaresCollectionAtWestDo:!enumerating!public! !
squaresCollectionDo:!enumerating!public! !
squaresDo:!enumerating!public! !
squaresSize!enumerating!public! !
validateOrientationName:!add element!public! !
viewSquares!public! !
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

