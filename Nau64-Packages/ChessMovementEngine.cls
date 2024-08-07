﻿"Filed out from Dolphin Smallalk"!

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

chessSideDo: aBlock

	piece chessSideDo: aBlock!

computeAttackedSquaresOn: aChessboard from: aChessSquare 

	self computeReachableSquaresOn: aChessboard from: aChessSquare!

computeReachableSquaresOn: aChessboard from: aChessSquare
	self subclassResponsibility!

computeValidSquaresOn: aChessboard from: aChessSquare

	self computeReachableSquaresOn: aChessboard from: aChessSquare!

detectedAbsolutePinsDo: aBlock

	piece chessSideDo: [:chessSide | | pinnedSquares |
		pinnedSquares := squaresDictionary detectAbsolutePinSquaresFor: chessSide.
		pinnedSquares notEmpty ifTrue: [aBlock value: pinnedSquares]
	].!

detectedBatteriesDo: aBlock
	
	piece chessSideDo: [:chessSide | | forkedSquares |
		forkedSquares := squaresDictionary detectBatterySquaresFor: chessSide.
		forkedSquares notEmpty ifTrue: [aBlock value: forkedSquares].
	].!

detectedForksDo: aBlock
	
	piece chessSideDo: [:chessSide | | forkedSquares |
		forkedSquares := squaresDictionary detectForkedSquaresFor: chessSide.
		forkedSquares notEmpty ifTrue: [aBlock value: forkedSquares].
	].!

includes: aChessSquare
	^squaresDictionary includes: aChessSquare!

includesAllSquares: aCollection
	^squaresDictionary includesAll: aCollection!

isBlockingAttackOnKing!

isCheckedOn: aChessboard

	self shouldNotImplement!

isCheckMatedOn: aChessboard

	self shouldNotImplement!

isValidOn: aChessboard from: originChessSquare to: targetChessSquare
	"^(self validSquaresOn: aChessboard from: vector originSquare) includes: vector targetSquare"
	| isValid |

	self computeValidSquaresOn: aChessboard from: originChessSquare.
	isValid := squaresDictionary squaresAnySatisfy: [:each | each = targetChessSquare].
	isValid ifFalse: [^isValid].
	piece isKing ifTrue: [^isValid].
	^isValid and: [(aChessboard anyOppositePieceIsAttackingTheKingThrough: piece tryingToMoveFrom: originChessSquare to: targetChessSquare) not]!

oppositeSideDo: aBlock

	piece oppositeSideDo: aBlock!

pieceDo: aBlock

	aBlock value: piece!

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

skewerPieceOn: aChessboard from: aChessSquare do: aBlock!

slidingPieceAt: sourceChessSquare canReachSkippingOnePiece: targetChessSquare on: aChessboard
	(sourceChessSquare = targetChessSquare) ifTrue: [^false].
	self computeReachableSquaresOn: aChessboard from: sourceChessSquare.
	^squaresDictionary includes: targetChessSquare!

squaresAndOrientationDo: aBlock

	squaresDictionary squaresCollectionAtEastDo: [:squares | aBlock value: squares value: #east].
	squaresDictionary squaresCollectionAtNorthDo: [:squares | aBlock value: squares value: #north].
	squaresDictionary squaresCollectionAtNorthEastDo: [:squares | aBlock value: squares value: #northEast].
	squaresDictionary squaresCollectionAtNorthWestDo: [:squares | aBlock value: squares value: #northWest].
	squaresDictionary squaresCollectionAtSouthDo: [:squares | aBlock value: squares value: #south].
	squaresDictionary squaresCollectionAtSouthEastDo: [:squares | aBlock value: squares value: #southEast].
	squaresDictionary squaresCollectionAtSouthWestDo: [:squares | aBlock value: squares value: #southWest].
	squaresDictionary squaresCollectionAtWestDo: [:squares | aBlock value: squares value: #west].





!

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
attackedSquaresOn:from:do:!public!valid move! !
canBeMovedToValidCoordinate:on:!public!valid move! !
chessSideDo:!public! !
computeAttackedSquaresOn:from:!public!valid move! !
computeReachableSquaresOn:from:!public!valid move! !
computeValidSquaresOn:from:!public!valid move! !
detectedAbsolutePinsDo:!public!tactics iteration! !
detectedBatteriesDo:!public!tactics iteration! !
detectedForksDo:!public!tactics iteration! !
includes:!public! !
includesAllSquares:!public! !
isBlockingAttackOnKing!public! !
isCheckedOn:!public! !
isCheckMatedOn:!public! !
isValidOn:from:to:!public!valid move! !
oppositeSideDo:!public! !
pieceDo:!public! !
setPiece:!private! !
setPiece:tree:!private! !
skeweredPieces:on:from:!public! !
skewerPieceOn:from:!extended squares!public! !
skewerPieceOn:from:do:!extended squares!public! !
slidingPieceAt:canReachSkippingOnePiece:on:!public! !
squaresAndOrientationDo:!public! !
squaresDictionaryDo:!public! !
squaresDo:!public! !
squaresSize!public! !
validSquaresFrom:toFileShift:toRankShift:onSucessDo:onErrorDo:!public!valid move! !
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

