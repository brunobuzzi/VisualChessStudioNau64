"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMovementEngine
	instanceVariableNames: 'vector piece squaresDictionary'
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

hasDirectContactWith: aChessPiece on: aChessboard from: aChessSquare
!

includes: aChessSquare
	^squaresDictionary includes: aChessSquare!

includesAllSquares: aCollection
	^squaresDictionary includesAll: aCollection!

isCheckMatedOn: aChessboard

	self shouldNotImplement!

isValidOn: aChessboard
	"^(self validSquaresOn: aChessboard from: vector originSquare) includes: vector targetSquare"

	self computeValidSquaresOn: aChessboard from: vector originSquare.
	^squaresDictionary squaresAnySatisfy: [:each | each = vector targetSquare]!

orientationVectorFrom: sourceChessSquare to: targetChessSquare
	| orientationVector |

	orientationVector := ChessOrientationVector new.
	(sourceChessSquare isEqualTo: targetChessSquare) ifTrue: [^self error: 'An orientation vector for the same chess squares is useless' ].
	(sourceChessSquare rankIsGreaterThan: targetChessSquare) ifTrue: [orientationVector updateToSouth].
	(targetChessSquare rankIsGreaterThan: sourceChessSquare) ifTrue: [orientationVector updateToNorth].

	(sourceChessSquare fileIsGreaterThan: targetChessSquare) ifTrue: [orientationVector updateToWest].
	(targetChessSquare fileIsGreaterThan: sourceChessSquare) ifTrue: [orientationVector updateToEast].

	^orientationVector!

setPiece: aChessPiece vector: aChessSquareVector
	piece := aChessPiece.
	squaresDictionary := SquaresDictionary on: piece.
	vector := aChessSquareVector!

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
		onErrorDo: monadicErrorBlock!

vector: aChessSquareVector

	vector := aChessSquareVector! !
!ChessMovementEngine categoriesForMethods!
attackedSquaresOn:from:do:!public! !
canBeMovedToValidCoordinate:on:!public! !
computeReachableSquaresOn:from:!public! !
computeValidSquaresOn:from:!public! !
hasDirectContactWith:on:from:!public! !
includes:!public! !
includesAllSquares:!public! !
isCheckMatedOn:!public! !
isValidOn:!public! !
orientationVectorFrom:to:!public! !
setPiece:vector:!private! !
skeweredPieces:on:from:!public! !
skewerPieceOn:from:!extended squares!public! !
slidingPieceAt:canReachSkippingOnePiece:on:!public! !
squaresDictionaryDo:!public! !
squaresSize!public! !
validSquaresFrom:toFileShift:toRankShift:onSucessDo:onErrorDo:!public! !
vector:!private! !
!

!ChessMovementEngine class methodsFor!

icon

	^Compiler icon
	!

newFor: aChessPiece

	^self new setPiece: aChessPiece vector: nil!

newFor: aChessPiece vector: aChessSquareVector

	^self new setPiece: aChessPiece vector: aChessSquareVector!

newForVector: aChessSquareVector

	^self new vector: aChessSquareVector! !
!ChessMovementEngine class categoriesForMethods!
icon!public! !
newFor:!public! !
newFor:vector:!public! !
newForVector:!public! !
!

