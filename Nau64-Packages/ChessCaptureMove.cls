"Filed out from Dolphin Smallalk"!

ChessMoveCategory subclass: #ChessCaptureMove
	instanceVariableNames: 'capturedPieceCode'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessCaptureMove guid: (GUID fromString: '{6b496f80-75e0-418f-8df1-66c8d6339c61}')!
ChessCaptureMove comment: ''!
!ChessCaptureMove categoriesForClass!Unclassified! !
!ChessCaptureMove methodsFor!

performPieceSwitchFrom: originCoordinateSymbol to: targetCoordinateSymbol on: aChessboard withPostActionOn: aChessGameExecutor

	aChessboard movePieceFromCoordiante: originCoordinateSymbol to: targetCoordinateSymbol!

redoOn: aChessboard
	aChessboard movePieceFromCoordiante: move from to: move to.
!

setMove: aChessMove capturedPiece: code

	move := aChessMove.
	capturedPieceCode := code!

undoOn: aChessboard 
	| killerPiece capturedPieceClass capturedPiece |

	killerPiece := aChessboard pieceAtCoordinate: move to.
	capturedPieceClass :=ChessPiece concreteClasses detect: [:each | each pieceCode = capturedPieceCode] ifNone: [self error: 'Move Undo failed'].

	killerPiece oppositeSideDo: [:opSide | capturedPiece := capturedPieceClass  newOn: opSide].

	aChessboard movePieceFromCoordiante: move to to: move from.

	aChessboard pieceAtCoordinate: move to put: capturedPiece! !
!ChessCaptureMove categoriesForMethods!
performPieceSwitchFrom:to:on:withPostActionOn:!public! !
redoOn:!public! !
setMove:capturedPiece:!public! !
undoOn:!public! !
!

!ChessCaptureMove class methodsFor!

newOn: aChessMove capturedPiece: aChessPiece

	^self new setMove: aChessMove capturedPiece: aChessPiece pieceCode! !
!ChessCaptureMove class categoriesForMethods!
newOn:capturedPiece:!public! !
!

