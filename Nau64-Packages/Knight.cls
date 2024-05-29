"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #Knight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Knight guid: (GUID fromString: '{9a94a41f-a339-4ac3-a754-7f378ec7747b}')!
Knight comment: ''!
!Knight categoriesForClass!Kernel-Objects! !
!Knight methodsFor!

fenString

	^self isBlack ifTrue: ['n'] ifFalse: ['N']!

isKnight

	^true!

pgnString

	^'N'!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	aSquaresDictionary pruneUnreacheableSquaresFromKnight!

squaresOn: aChessOrientationVector from: aChessSquare do: aBlock
	| slidingSquares |

	slidingSquares := OrderedCollection new.
	((aChessSquare fileNumber + (aChessOrientationVector fileSign * 2)) isInChessRange and: [(aChessSquare rankNumber + aChessOrientationVector rankSign) isInChessRange])
	ifTrue: [
		slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(2 1)).
	].

	((aChessSquare fileNumber + aChessOrientationVector fileSign) isInChessRange and: [(aChessSquare rankNumber + (aChessOrientationVector rankSign * 2)) isInChessRange])
	ifTrue: [ 
		slidingSquares add: (aChessSquare next: aChessOrientationVector productArray: #(1 2)).
	].

	slidingSquares do: aBlock! !
!Knight categoriesForMethods!
fenString!public! !
isKnight!public!testing! !
pgnString!public! !
pruneUnreacheableSquaresFrom:!new framework!public! !
squaresOn:from:do:!new framework!public! !
!

!Knight class methodsFor!

blackCodePoint

	^9822!

filePrefix
	" n - Knight "

	^'n'!

pieceCode
	^'n'!

whiteCodePoint

	^9816! !
!Knight class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

