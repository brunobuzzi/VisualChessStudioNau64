"Filed out from Dolphin Smallalk"!

ChessPiece subclass: #SlidingPiece
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SlidingPiece guid: (GUID fromString: '{95b13bae-ff2b-405e-93cb-448d73c5d7ac}')!
SlidingPiece comment: ''!
!SlidingPiece categoriesForClass!Kernel-Objects! !
!SlidingPiece methodsFor!

absoluteXRaySquaresDo: aBlock

	self absoluteXRaySquaresFrom: self currentChessSquare do: aBlock!

absoluteXRaySquaresFrom: aChessSquare do: aBlock
	"To detect King to #a5 is invalid
	ChessboardPlaygroundShell showWithFenString: 'R4K2/8/k7/8/8/8/8/8/ b - - 1 20' on: SystemRoot."
	| xRaySquares |

	self isSlidingPiece ifFalse: [^OrderedCollection new].
	xRaySquares := OrderedCollection new.
	self chessboardDo:	[:aChessboard |
			self squaresScopeFrom: aChessSquare
				do: [:aSquaresDictionary | 
					aSquaresDictionary squaresCollectionAndOrientationDo: [:squareCollection :orientation | | oppositePieces halted |
						"orientation = #south ifTrue: [self halt]."
						oppositePieces := 0.
						halted := false.
						squareCollection do: [:chessSquare |
								aChessboard
									pieceAt: chessSquare
									do: [:piece |
										((piece isOppositeSideTo: self) and: [piece isKing])
										ifTrue: [oppositePieces := oppositePieces + 1.											
											(oppositePieces > 1 and: [halted not])
											ifTrue: [halted := true]]
										ifFalse: [halted := true]
									]
									ifAbsent: [oppositePieces >= 1 ifTrue: [xRaySquares add: chessSquare]]
						]
					]
				]
	].
	xRaySquares do: aBlock!

pruneUnreacheableSquaresFrom: aSquaresDictionary

	aSquaresDictionary pruneUnreachableSquaresFromSlidingPiece!

xRaySquaresFrom: aChessSquare xRayCount: anInteger do: aBlock
	| xRaySquares |

	self isSlidingPiece ifFalse: [^OrderedCollection new].
	xRaySquares := OrderedCollection new.
	self chessboardDo:	[:aChessboard |
			self squaresScopeFrom: aChessSquare
				do: [:aSquaresDictionary | 
					aSquaresDictionary squaresCollectionAndOrientationDo: [:squareCollection :orientation | | oppositePieces halted |
						oppositePieces := 0.
						halted := false.
						squareCollection do: [:chessSquare |
								aChessboard
									pieceAt: chessSquare
									do: [:piece |
										(piece isOppositeSideTo: self)
										ifTrue: [oppositePieces := oppositePieces + 1.											
											(oppositePieces > anInteger and: [halted not])
											ifTrue: [halted := true]]
										ifFalse: [halted := true]
									]
									ifAbsent: [oppositePieces >= 1 ifTrue: [xRaySquares add: chessSquare]]
						]
					]
				]
	].
	xRaySquares do: aBlock!

xRaySquaresWithCount: anInteger do: aBlock

	self xRaySquaresFrom: self currentChessSquare xRayCount: anInteger do: aBlock! !
!SlidingPiece categoriesForMethods!
absoluteXRaySquaresDo:!new framework!public! !
absoluteXRaySquaresFrom:do:!new framework!public! !
pruneUnreacheableSquaresFrom:!new framework!public! !
xRaySquaresFrom:xRayCount:do:!new framework!public! !
xRaySquaresWithCount:do:!new framework!public! !
!

!SlidingPiece class methodsFor!

blackCodePoint
	^8611! !
!SlidingPiece class categoriesForMethods!
blackCodePoint!public! !
!

