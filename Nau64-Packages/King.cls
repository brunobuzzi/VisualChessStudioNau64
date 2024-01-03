"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #King
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
King guid: (GUID fromString: '{dd0a5697-2022-4ef0-859c-3eaf90c9e114}')!
King comment: ''!
!King categoriesForClass!Kernel-Objects! !
!King methodsFor!

fenString

	^self isBlack ifTrue: ['k'] ifFalse: ['K']!

isCheckMatedOn: aChessboard
	| secureSquares |

	secureSquares := OrderedCollection new.
	self secureSquaresFrom: self currentChessSquare do: [:square | secureSquares add: square].
	^secureSquares isEmpty !

isKing

	^true!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	aSquaresDictionary pruneUnreacheableSquaresFromKing!

secureSquaresFrom: aChessSquare do: aBlock
	| attackedSquares xRaySquares |

	xRaySquares := OrderedCollection new.
	attackedSquares := OrderedCollection new.
	self oppositeSideDo: [:oppositeSide | 
		oppositeSide piecesDo: [:oppositePiece |
			oppositePiece attackedSquaresDo: [:square | attackedSquares add: square].
			oppositePiece absoluteXRaySquaresDo: [:square | xRaySquares add: square].
		].
	].

	self validSquaresDictionaryFrom: aChessSquare do: [:squaresDictionary |
		attackedSquares do: [:square | squaresDictionary remove: square].
		xRaySquares do: [:square | squaresDictionary remove: square].
		squaresDictionary squaresDo: aBlock
	].
! !
!King categoriesForMethods!
fenString!public! !
isCheckMatedOn:!new framework!public! !
isKing!public!testing! !
pruneUnreacheableSquaresFrom:!new framework!public! !
secureSquaresFrom:do:!new framework!public! !
!

!King class methodsFor!

blackCodePoint

	^9818
!

filePrefix
	" k - king "

	^'k'!

pieceCode
	^'k'!

whiteCodePoint

	^9812! !
!King class categoriesForMethods!
blackCodePoint!public!unicode! !
filePrefix!public! !
pieceCode!public! !
whiteCodePoint!public!unicode! !
!

