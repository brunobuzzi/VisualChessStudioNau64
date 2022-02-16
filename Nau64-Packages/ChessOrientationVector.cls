"Filed out from Dolphin Smallalk"!

Object subclass: #ChessOrientationVector
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

nextSquaresFrom: aChessSquare do: aBlock
	| squares |

	squares := OrderedCollection new.
	
	1 to: 7 do: [:shift |
		aChessSquare 
			nextFile: (shift * self fileSign) 
			nextRank: (shift * self rankSign)
			onSuccessDo: [:square | squares add: square] 
			onErrorDo: [:ex | ]].

	squares do: aBlock!

nextSquaresFrom: aChessSquare on: aChessboard do: aBlock
	| squares reachedPieces |

	reachedPieces := 0.
	squares := OrderedCollection new.
	
	1 to: 7 do: [:shift |
		aChessSquare 
			nextFile: (shift * self fileSign) 
			nextRank: (shift * self rankSign)
			onSuccessDo: [:square | (aChessboard squareNotEmptyAtCoordinate: square coordinate) ifTrue: [reachedPieces := reachedPieces + 1].
								reachedPieces <= 1 ifTrue: [squares add: square]] 
			onErrorDo: [:ex | ]].

	squares do: aBlock!

rankSign
	^southOrNorth ifNil: [0] ifNotNil: [southOrNorth rankSign]!

setEast

	eastOrWest := ChessEastOrientation new.!

setNorth

	southOrNorth := ChessNorthOrientation new.!

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
nextSquaresFrom:do:!public! !
nextSquaresFrom:on:do:!public! !
rankSign!public! !
setEast!private! !
setNorth!private! !
setSouth!private! !
setWest!private! !
updateToEast!public! !
updateToNorth!public! !
updateToSouth!public! !
updateToWest!public! !
!

!ChessOrientationVector class methodsFor!

newEast

	^self new setEast!

newNorth

	^self new setNorth!

newSouth

	^self new setSouth!

newWest

	^self new setWest! !
!ChessOrientationVector class categoriesForMethods!
newEast!public! !
newNorth!public! !
newSouth!public! !
newWest!public! !
!

