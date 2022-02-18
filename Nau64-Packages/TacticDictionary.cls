"Filed out from Dolphin Smallalk"!

Object subclass: #TacticDictionary
	instanceVariableNames: 'tactics'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
TacticDictionary guid: (GUID fromString: '{eca1ace1-c308-4988-aedc-923596f0486e}')!
TacticDictionary comment: ''!
!TacticDictionary categoriesForClass!Unclassified! !
!TacticDictionary methodsFor!

add: aChessTacticConcept to: aChessPiece

	(tactics includesKey: aChessPiece) ifFalse: [tactics at: aChessPiece put: OrderedCollection new].

	(tactics at: aChessPiece) add: aChessTacticConcept!

detectForkFromCurrentSquare: aChessSquare from: forkSquare to: forkedSquares

	tactics keysAndValuesDo: [:piece :forkCollection | 
		forkCollection do: [:fork | 
			((fork currentPieceSquareIs: aChessSquare) and: [(fork sourceSquareIs: forkSquare) and: [fork targetSquaresIncludesAll: forkedSquares]]) ifTrue: [^fork].
		]. 
	].

	^nil!

detectTacticFrom: aChessSquare !

initialize

	super initialize.

	tactics := Dictionary new.!

keysAndValuesDo: aBlock

	tactics keysAndValuesDo: aBlock! !
!TacticDictionary categoriesForMethods!
add:to:!public! !
detectForkFromCurrentSquare:from:to:!public! !
detectTacticFrom:!public! !
initialize!public! !
keysAndValuesDo:!public! !
!

!TacticDictionary class methodsFor!

new

	^super new initialize! !
!TacticDictionary class categoriesForMethods!
new!public! !
!

