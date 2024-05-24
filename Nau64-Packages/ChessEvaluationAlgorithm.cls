"Filed out from Dolphin Smallalk"!

Object subclass: #ChessEvaluationAlgorithm
	instanceVariableNames: 'chessboard'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessEvaluationAlgorithm guid: (GUID fromString: '{fe66badf-b804-4715-a7c4-41af15a2b4ad}')!
ChessEvaluationAlgorithm comment: ''!
!ChessEvaluationAlgorithm categoriesForClass!Unclassified! !
!ChessEvaluationAlgorithm class methodsFor!

alanTuringValues

	^Dictionary new
		at: Pawn put: 100;
		at: Knight put: 300;
		at: Bishop put: 350;
		at: Rook put: 500;
		at: Queen put: 1000;
		yourself

!

claudeShannonValues

	^Dictionary new
		at: Pawn put: 100;
		at: Knight put: 300;
		at: Bishop put: 300;
		at: Rook put: 500;
		at: Queen put: 900;
		yourself

!

hansBerlinerValues

	^Dictionary new
		at: Pawn put: 100;
		at: Knight put: 320;
		at: Bishop put: 333;
		at: Rook put: 510;
		at: Queen put: 880;
		yourself

!

larryKaufmanValues

	^Dictionary new
		at: Pawn put: 100;
		at: Knight put: 350;
		at: Bishop put: 350;
		at: Rook put: 525;
		at: Queen put: 1000;
		yourself

!

mackHackValues

	^Dictionary new
		at: Pawn put: 100;
		at: Knight put: 325;
		at: Bishop put: 350;
		at: Rook put: 500;
		at: Queen put: 975;
		yourself

! !
!ChessEvaluationAlgorithm class categoriesForMethods!
alanTuringValues!public! !
claudeShannonValues!public! !
hansBerlinerValues!public! !
larryKaufmanValues!public! !
mackHackValues!public! !
!

