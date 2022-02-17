"Filed out from Dolphin Smallalk"!

ChessTacticConcept subclass: #ChessFork
	instanceVariableNames: 'from to'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessFork guid: (GUID fromString: '{06055c43-ee96-499a-9e42-f0812f4036c7}')!
ChessFork comment: ''!
!ChessFork categoriesForClass!Unclassified! !
!ChessFork methodsFor!

originAndTargetSquaresDo: aBlock

	aBlock value: from value: to!

setFrom: originSquare to: targetSquares

	from := originSquare.
	to := targetSquares!

sourceSquareIs: aChessSquare

	^from == aChessSquare!

targetSquaresIncludes: aChessSquare

	^to includes: aChessSquare! !
!ChessFork categoriesForMethods!
originAndTargetSquaresDo:!public! !
setFrom:to:!private! !
sourceSquareIs:!public! !
targetSquaresIncludes:!public! !
!

!ChessFork class methodsFor!

from: originSquare to: targetSquares

	^self new setFrom: originSquare to: targetSquares! !
!ChessFork class categoriesForMethods!
from:to:!public! !
!

