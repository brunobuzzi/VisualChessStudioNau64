"Filed out from Dolphin Smallalk"!

Object subclass: #ChessOrientationVector
	instanceVariableNames: 'piece southOrNorth eastOrWest'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessOrientationVector guid: (GUID fromString: '{50315640-4454-4080-8263-f5ad34009e23}')!
ChessOrientationVector comment: ''!
!ChessOrientationVector categoriesForClass!Unclassified! !
!ChessOrientationVector methodsFor!

fileSign
	^eastOrWest ifNil: [0] ifNotNil: [eastOrWest fileSign]!

isCompatibleWithBishop

	^southOrNorth notNil and: [eastOrWest notNil]!

isCompatibleWithQueen

	^true!

isCompatibleWithRook

	^(southOrNorth notNil and: [eastOrWest isNil]) or: [southOrNorth isNil and:[eastOrWest notNil]]!

isPieceCompatible

	^piece movesAreCompatibleWith: self!

nextSquaresFrom: aChessSquare do: aBlock
	| squares |

	self isPieceCompatible ifFalse: [^self].

	squares := OrderedCollection new.
	
	1 to: 7 do: [:shift |
		aChessSquare 
			nextFile: (shift * self fileSign) 
			nextRank: (shift * self rankSign)
			onSuccessDo: [:square | squares add: square] 
			onErrorDo: [:ex | ]].

	squares do: aBlock!

rankSign
	^southOrNorth ifNil: [0] ifNotNil: [southOrNorth rankSign]!

rookBateryOrientations

	southOrNorth ifNotNil: [:orientation | ^Array with: ChessWestOrientation new with: ChessEastOrientation new].

	eastOrWest ifNotNil: [:orientation | ^Array with: ChessSouthOrientation new with: ChessNorthOrientation new].
	
	self error: 'No orientation set for this vector'!

setEast

	eastOrWest := ChessEastOrientation new.!

setNorth

	southOrNorth := ChessNorthOrientation new.!

setPiece: aChessPiece

	piece := aChessPiece!

setSouth

	southOrNorth := ChessSouthOrientation new.!

setWest

	eastOrWest := ChessWestOrientation new.!

updateToEast

	eastOrWest := ChessEastOrientation new.!

updateToNorth

	southOrNorth := ChessNorthOrientation new.!

updateToSouth

	southOrNorth := ChessSouthOrientation new.!

updateToWest

	eastOrWest := ChessWestOrientation new.! !
!ChessOrientationVector categoriesForMethods!
fileSign!public! !
isCompatibleWithBishop!piece compatibility!public! !
isCompatibleWithQueen!piece compatibility!public! !
isCompatibleWithRook!piece compatibility!public! !
isPieceCompatible!piece compatibility!public! !
nextSquaresFrom:do:!public!squares iteration! !
rankSign!public! !
rookBateryOrientations!public!tactics! !
setEast!private! !
setNorth!private! !
setPiece:!private! !
setSouth!private! !
setWest!private! !
updateToEast!orientation settings!public! !
updateToNorth!orientation settings!public! !
updateToSouth!orientation settings!public! !
updateToWest!orientation settings!public! !
!

!ChessOrientationVector class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 8663) asUtf16String fontName: 'Malgun Gothic'!

newAtEastFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToEast!

newAtNorthEastFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToNorth;
		updateToEast!

newAtNorthFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToNorth!

newAtNorthWestFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToNorth;
		updateToWest!

newAtSoutEastFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToSouth;
		updateToEast!

newAtSouthFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToSouth!

newAtSoutWestFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToSouth;
		updateToWest!

newAtWestFor: aChessPiece

	^(self newFor: aChessPiece)
		updateToWest!

newFor: aChessPiece

	^self new setPiece: aChessPiece!

newFor: aChessPiece orientation: aChessOrientation

	^aChessOrientation newVectorFor: aChessPiece

	! !
!ChessOrientationVector class categoriesForMethods!
icon!public! !
newAtEastFor:!public! !
newAtNorthEastFor:!public! !
newAtNorthFor:!public! !
newAtNorthWestFor:!public! !
newAtSoutEastFor:!public! !
newAtSouthFor:!public! !
newAtSoutWestFor:!public! !
newAtWestFor:!public! !
newFor:!public! !
newFor:orientation:!public! !
!

