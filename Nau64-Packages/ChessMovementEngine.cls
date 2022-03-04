"Filed out from Dolphin Smallalk"!

Object subclass: #ChessMovementEngine
	instanceVariableNames: 'tree piece squaresDictionary'
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

detectedAbsolutePinsDo: aBlock

	piece chessSideDo: [:chessSide | | pinnedSquares |
		pinnedSquares := squaresDictionary detectAbsolutePinSquaresFor: chessSide.
		pinnedSquares notEmpty ifTrue: [aBlock value: pinnedSquares]
	].!

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

setPiece: aChessPiece 

	piece := aChessPiece.
	squaresDictionary := SquaresDictionary on: piece.
!

setPiece: aChessPiece  tree: aChessMovementEngineStackTree

	piece := aChessPiece.
	squaresDictionary := SquaresDictionary on: piece.
	tree := aChessMovementEngineStackTree
!

skeweredPieces: anInteger on: aChessboard from: aChessSquare
	^self skewerPieceOn: aChessboard from: aChessSquare!

skewerPieceOn: aChessboard from: aChessSquare
	^#()!

slidingPieceAt: sourceChessSquare canReachSkippingOnePiece: targetChessSquare on: aChessboard
	(sourceChessSquare = targetChessSquare) ifTrue: [^false].
	self computeReachableSquaresOn: aChessboard from: sourceChessSquare.
	^squaresDictionary includes: targetChessSquare!

squaresDictionaryDo: aBlock

	aBlock value: squaresDictionary!

squaresDo: aBlock

	self squaresDictionaryDo: [:sqDictionary | sqDictionary squaresDo: aBlock]!

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
detectedAbsolutePinsDo:!public! !
detectedForksDo:!public! !
hasDirectContactWith:on:from:!public! !
includes:!public! !
includesAllSquares:!public! !
isCheckMatedOn:!public! !
isValidOn:from:to:!public! !
setPiece:!private! !
setPiece:tree:!private! !
skeweredPieces:on:from:!public! !
skewerPieceOn:from:!extended squares!public! !
slidingPieceAt:canReachSkippingOnePiece:on:!public! !
squaresDictionaryDo:!public! !
squaresDo:!public! !
squaresSize!public! !
validSquaresFrom:toFileShift:toRankShift:onSucessDo:onErrorDo:!public! !
!

!ChessMovementEngine class methodsFor!

icon

	^Compiler icon
	!

newFor: aChessPiece

	^self new setPiece: aChessPiece!

newFor: aChessPiece tree: aChessMovementEngineStackTree

	^self new setPiece: aChessPiece tree: aChessMovementEngineStackTree! !
!ChessMovementEngine class categoriesForMethods!
icon!public! !
newFor:!public! !
newFor:tree:!public! !
!

