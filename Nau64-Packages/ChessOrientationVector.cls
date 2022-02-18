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
isCompatibleWithBishop!public! !
isCompatibleWithQueen!public! !
isCompatibleWithRook!public! !
isPieceCompatible!public! !
nextSquaresFrom:do:!public! !
rankSign!public! !
setEast!private! !
setNorth!private! !
setPiece:!private! !
setSouth!private! !
setWest!private! !
updateToEast!public! !
updateToNorth!public! !
updateToSouth!public! !
updateToWest!public! !
!

!ChessOrientationVector class methodsFor!

newFor: aChessPiece

	^self new setPiece: aChessPiece! !
!ChessOrientationVector class categoriesForMethods!
newFor:!public! !
!

