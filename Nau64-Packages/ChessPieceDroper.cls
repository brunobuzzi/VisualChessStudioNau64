"Filed out from Dolphin Smallalk"!

ValuePresenter subclass: #ChessPieceDroper
	instanceVariableNames: 'chessboardPresenter mouseTracker pieceClass isBlack'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPieceDroper guid: (GUID fromString: '{4e61f0ee-e726-419f-9df2-fb672d8009de}')!
ChessPieceDroper comment: ''!
!ChessPieceDroper categoriesForClass!MVP-Presenters! !
!ChessPieceDroper methodsFor!

cancelTrackingAt: arg1
	"Private - This is an auto-generated target implementation for the protocol <mouseTrackerTarget>
	and remains to be correctly implemented."

!

continueTrackingAt: aPoint from: aPreviousPoint!

endTrackingAt: aPoint
	| targetSquare |

	targetSquare := model squareAt: (mouseTracker sumStartLocalPointTo: aPoint).
	(model squareIsEmptyAtCoordinate: targetSquare coordinate) ifFalse: [model removePieceAt: targetSquare].

	model newPiece: pieceClass isBlack: isBlack at: targetSquare.
	
	chessboardPresenter renderChessboard.!

setChessboardPresenter: aChessboardPresenter chessboard: aChessboard pieceClass: aClass isBlack: aBoolean tracker: aMouseTracker

	chessboardPresenter := aChessboardPresenter.
	model := aChessboard.
	pieceClass := aClass.
	isBlack := aBoolean.
	mouseTracker := aMouseTracker.
!

startTrackingAt: arg1
! !
!ChessPieceDroper categoriesForMethods!
cancelTrackingAt:!private!tracking! !
continueTrackingAt:from:!private!tracking! !
endTrackingAt:!private!tracking! !
setChessboardPresenter:chessboard:pieceClass:isBlack:tracker:!private! !
startTrackingAt:!private!tracking! !
!

!ChessPieceDroper class methodsFor!

newOn: aChessboardPresenter chessboard: aChessboard pieceClass: pieceClass isBlack: aBoolean tracker: aMouseTracker
 
	^self new setChessboardPresenter: aChessboardPresenter chessboard: aChessboard pieceClass: pieceClass isBlack: aBoolean tracker: aMouseTracker! !
!ChessPieceDroper class categoriesForMethods!
newOn:chessboard:pieceClass:isBlack:tracker:!public! !
!

