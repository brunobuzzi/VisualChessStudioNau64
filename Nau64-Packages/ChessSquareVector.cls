"Filed out from Dolphin Smallalk"!

ChessVector subclass: #ChessSquareVector
	instanceVariableNames: 'sourceSquare targetSquare orientationVector'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSquareVector guid: (GUID fromString: '{47a760f4-19dc-4bb9-9876-8f8b07020464}')!
ChessSquareVector comment: ''!
!ChessSquareVector categoriesForClass!Unclassified! !
!ChessSquareVector methodsFor!

isCompatibleWithBishop

	^orientationVector isCompatibleWithBishop!

isCompatibleWithQueen

	^orientationVector isCompatibleWithQueen!

isCompatibleWithRook

	^orientationVector isCompatibleWithRook!

isSlidingVector

	((sourceSquare rankIsEqualTo: targetSquare) or: [sourceSquare fileIsEqualTo: targetSquare]) ifTrue: [^true].

	orientationVector nextSquaresFrom: sourceSquare do: [:square | 
		(targetSquare isEqualTo: square) ifTrue: [^true].
	].

	^false!

orientationIsEast
	^orientationVector isEast!

orientationIsNorth
	^orientationVector isNorth!

orientationIsNorthEast
	^orientationVector isNorthEast!

orientationIsNorthWest
	^orientationVector isNorthWest!

orientationIsSouth
	^orientationVector isSouth!

orientationIsSouthEast
	^orientationVector isSouthEast!

orientationIsSouthWest
	^orientationVector isSouthWest!

orientationIsWest
	^orientationVector isWest!

setSourcePiece: sourceChessSquare targetPiece: targetChessSquare

	sourceSquare := sourceChessSquare.
	targetSquare := targetChessSquare.
	orientationVector := ChessOrientationVector newFrom: sourceSquare to: targetSquare! !
!ChessSquareVector categoriesForMethods!
isCompatibleWithBishop!piece compatibility!public! !
isCompatibleWithQueen!piece compatibility!public! !
isCompatibleWithRook!piece compatibility!public! !
isSlidingVector!public! !
orientationIsEast!public! !
orientationIsNorth!public! !
orientationIsNorthEast!public! !
orientationIsNorthWest!public! !
orientationIsSouth!public! !
orientationIsSouthEast!public! !
orientationIsSouthWest!public! !
orientationIsWest!public! !
setSourcePiece:targetPiece:!private! !
!

!ChessSquareVector class methodsFor!

from: sourceChessPiece to: targetChessPiece

	^self new setSourcePiece: sourceChessPiece targetPiece: targetChessPiece!

icon

	^TextTileIcon text: (Character codePoint: 11246) asUtf16String fontName: 'Malgun Gothic'! !
!ChessSquareVector class categoriesForMethods!
from:to:!public! !
icon!public! !
!

