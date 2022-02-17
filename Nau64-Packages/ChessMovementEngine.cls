"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMovementEngine
	instanceVariableNames: 'piece squaresDictionary'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessMovementEngine guid: (GUID fromString: '{463a4e7c-60c8-41bc-a748-a590db9ea33a}')!
ChessMovementEngine comment: ''!
!ChessMovementEngine categoriesForClass!Kernel-Objects! !
!ChessMovementEngine methodsFor!

attackedSquaresOn: aChessboard from: aChessSquare do: aBlock
	self computeReachableSquaresOn: aChessboard from: aChessSquare.
	squaresDictionary squaresDo: aBlock!

canBeMovedToValidCoordinate: symbolCoordinate on: aChessboard

	^(aChessboard squareIsEmptyAtCoordinate: symbolCoordinate) or: 
		[(aChessboard squareNotEmptyAtCoordinate: symbolCoordinate) and: [piece isOppositeSideTo: (aChessboard pieceAtCoordinate: symbolCoordinate)]]!

computeReachableSquaresOn: aChessboard from: aChessSquare
	self subclassResponsibility!

computeValidSquaresOn: aChessboard from: aChessSquare

	self computeReachableSquaresOn: aChessboard from: aChessSquare!

detectedForksDo: aBlock
	
	piece chessSideDo: [:chessSide | | forkedSquares |
		forkedSquares := squaresDictionary detectForkedSquaresFor: chessSide.
		forkedSquares notEmpty ifTrue: [aBlock value: forkedSquares].
	].!

hasDirectContactWith: aChessPiece on: aChessboard from: aChessSquare
!

includes: aChessSquare
	^squaresDictionary includes: aChessSquare!

includesAllSquares: aCollection
	^squaresDictionary includesAll: aCollection!

isCheckMatedOn: aChessboard

	self shouldNotImplement!

isValidOn: aChessboard from: originChessSquare to: targetChessSquare
	"^(self validSquaresOn: aChessboard from: vector originSquare) includes: vector targetSquare"

	self computeValidSquaresOn: aChessboard from: originChessSquare.
	^squaresDictionary squaresAnySatisfy: [:each | each = targetChessSquare]!

orientationVectorFrom: sourceChessSquare to: targetChessSquare
	| orientationVector |

	orientationVector := ChessOrientationVector new.
	(sourceChessSquare isEqualTo: targetChessSquare) ifTrue: [^self error: 'An orientation vector for the same chess squares is useless' ].
	(sourceChessSquare rankIsGreaterThan: targetChessSquare) ifTrue: [orientationVector updateToSouth].
	(targetChessSquare rankIsGreaterThan: sourceChessSquare) ifTrue: [orientationVector updateToNorth].

	(sourceChessSquare fileIsGreaterThan: targetChessSquare) ifTrue: [orientationVector updateToWest].
	(targetChessSquare fileIsGreaterThan: sourceChessSquare) ifTrue: [orientationVector updateToEast].

	^orientationVector!

setPiece: aChessPiece 

	piece := aChessPiece.
	squaresDictionary := SquaresDictionary on: piece.
!

skeweredPieces: anInteger on: aChessboard from: aChessSquare
	^self skewerPieceOn: aChessboard from: aChessSquare!

skewerPieceOn: aChessboard from: aChessSquare
	^#()!

slidingPieceAt: sourceChessSquare canReachSkippingOnePiece: targetChessSquare on: aChessboard
	self computeReachableSquaresOn: aChessboard from: sourceChessSquare.
	^squaresDictionary includes: targetChessSquare!

squaresDictionaryDo: aBlock

	aBlock value: squaresDictionary!

squaresSize
	^squaresDictionary squaresSize!

validSquaresFrom: aChessSquare toFileShift: fileShift toRankShift: rankShift onSucessDo: monadicSuccessBlock onErrorDo: monadicErrorBlock
	aChessSquare
		nextFile: fileShift
		nextRank: rankShift
		onSuccessDo: monadicSuccessBlock
		onErrorDo: monadicErrorBlock! !
!ChessMovementEngine categoriesForMethods!
attackedSquaresOn:from:do:!public! !
canBeMovedToValidCoordinate:on:!public! !
computeReachableSquaresOn:from:!public! !
computeValidSquaresOn:from:!public! !
detectedForksDo:!public! !
hasDirectContactWith:on:from:!public! !
includes:!public! !
includesAllSquares:!public! !
isCheckMatedOn:!public! !
isValidOn:from:to:!public! !
orientationVectorFrom:to:!public! !
setPiece:!private! !
skeweredPieces:on:from:!public! !
skewerPieceOn:from:!extended squares!public! !
slidingPieceAt:canReachSkippingOnePiece:on:!public! !
squaresDictionaryDo:!public! !
squaresSize!public! !
validSquaresFrom:toFileShift:toRankShift:onSucessDo:onErrorDo:!public! !
!

!ChessMovementEngine class methodsFor!

icon

	^Compiler icon
	!

newFor: aChessPiece

	^self new setPiece: aChessPiece! !
!ChessMovementEngine class categoriesForMethods!
icon!public! !
newFor:!public! !
!

