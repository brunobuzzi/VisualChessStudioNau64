"Filed out from Dolphin Smallalk"!

ChessTacticConcept subclass: #ChessFork
	instanceVariableNames: 'currentPieceSquare from to'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessFork guid: (GUID fromString: '{06055c43-ee96-499a-9e42-f0812f4036c7}')!
ChessFork comment: ''!
!ChessFork categoriesForClass!Unclassified! !
!ChessFork methodsFor!

currentPieceSquareIs: aChessSquare

	^currentPieceSquare == aChessSquare!

originAndTargetSquaresDo: aBlock

	aBlock value: from value: to!

setCurrentPieceSquare: pieceSquare from: originSquare to: targetSquares

	currentPieceSquare := pieceSquare.
	from := originSquare.
	to := targetSquares!

setFrom: originSquare to: targetSquares

	from := originSquare.
	to := targetSquares!

sourceSquareIs: aChessSquare

	^from == aChessSquare!

targetSquaresIncludes: aChessSquare

	^to includes: aChessSquare!

targetSquaresIncludesAll: aCollection

	^aCollection allSatisfy: [:each | to includes: each]! !
!ChessFork categoriesForMethods!
currentPieceSquareIs:!public! !
originAndTargetSquaresDo:!public! !
setCurrentPieceSquare:from:to:!private! !
setFrom:to:!private! !
sourceSquareIs:!public! !
targetSquaresIncludes:!public! !
targetSquaresIncludesAll:!public! !
!

!ChessFork class methodsFor!

newFromCurrentSquare: pieceSquare from: originSquare to: targetSquares

	^self new setCurrentPieceSquare: pieceSquare from: originSquare to: targetSquares! !
!ChessFork class categoriesForMethods!
newFromCurrentSquare:from:to:!public! !
!

