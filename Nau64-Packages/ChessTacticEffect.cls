"Filed out from Dolphin Smallalk"!

ChessboardEffect subclass: #ChessTacticEffect
	instanceVariableNames: 'isBlack'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessTacticEffect guid: (GUID fromString: '{85400ab6-a3de-4dba-8576-3034d78130f8}')!
ChessTacticEffect comment: ''!
!ChessTacticEffect categoriesForClass!Unclassified! !
!ChessTacticEffect methodsFor!

pen
	| pen arrowCap |

	arrowCap := (GdiplusAdjustableArrowCap height: 20 width: 10 isFilled: true)
		middleInset: 5;
		yourself.
	pen := isBlack ifTrue: [GdiplusPen red] ifFalse: [GdiplusPen green].
	pen
		width: 2;
		customStartCap: GdiplusCustomLineCap new;
		customEndCap: arrowCap;
		yourself.
	^pen!

penRed
	| pen arrowCap |

	arrowCap := (GdiplusAdjustableArrowCap height: 20 width: 10 isFilled: true)
		middleInset: 5;
		yourself.
	pen := isBlack ifTrue: [GdiplusPen red] ifFalse: [GdiplusPen red].
	pen
		width: 2;
		customStartCap: GdiplusCustomLineCap new;
		customEndCap: arrowCap;
		yourself.
	^pen!

setBlack

	isBlack := true!

setChessboard: aChessboard

	super setChessboard: aChessboard.
	isBlack := false! !
!ChessTacticEffect categoriesForMethods!
pen!public! !
penRed!public! !
setBlack!public! !
setChessboard:!private! !
!

