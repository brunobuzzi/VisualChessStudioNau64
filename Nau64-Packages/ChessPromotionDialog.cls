"Filed out from Dolphin Smallalk"!

Dialog subclass: #ChessPromotionDialog
	instanceVariableNames: 'piecesList'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPromotionDialog guid: (GUID fromString: '{69c8924f-91fa-43ee-89a4-39f04456f1f3}')!
ChessPromotionDialog comment: ''!
!ChessPromotionDialog categoriesForClass!MVP-Presenters! !
!ChessPromotionDialog methodsFor!

answer
	super answer.

	^piecesList value!

createComponents

	super createComponents.

	piecesList := self add: ChoicePresenter new name: 'pieces'.!

model: anOrderedCollection
	super model: anOrderedCollection.
	piecesList choices: anOrderedCollection! !
!ChessPromotionDialog categoriesForMethods!
answer!public! !
createComponents!public! !
model:!public! !
!

!ChessPromotionDialog class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.DialogView) 34 30 nil nil 8 #(13107200 65536) 416 nil 655878 ##(Smalltalk.ThemeColor) #dialog nil 165 nil nil nil 416 788230 ##(Smalltalk.BorderLayout) 1 1 nil 410 ##(Smalltalk.ReferenceView) 34 14 nil 416 34 2 8 1140850688 131073 528 nil nil nil 7 nil nil nil 528 1180230 1 ##(Smalltalk.ResourceIdentifier) ##(Smalltalk.Presenter) #resource_OK_Cancel_button_block nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 328198 ##(Smalltalk.Point) 21 423 738 449 71 528 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 10 0 0 0 211 0 0 0 234 0 0 0 246 0 0 0] 8 #() 738 193 193 nil 27 nil nil 410 ##(Smalltalk.ListBox) 34 17 nil 416 34 2 8 1412497665 1025 864 590662 2 ##(Smalltalk.ListModel) 138 144 832 nil 1310726 ##(Smalltalk.IdentitySearchPolicy) 327686 ##(Smalltalk.Color) #default nil 7 nil nil nil 864 nil 8 1960723344 459270 ##(Smalltalk.Message) #displayString 8 #() 8 #() false 626 138 144 34 2 690 #createAt:extent: 34 2 738 21 21 738 449 403 864 690 #horizontalExtent: 8 #(0) 864 786 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 10 0 0 0 10 0 0 0 234 0 0 0 211 0 0 0] 8 #() 848 nil 27 170 192 34 2 864 8 'pieces' 590342 ##(Smalltalk.Rectangle) 738 21 21 738 21 21 nil nil nil nil 16511 nil nil nil nil 1 nil nil 590598 ##(Smalltalk.Semaphore) nil nil 1 nil 8 2000715728 626 138 144 34 1 690 #createAt:extent: 34 2 738 5119 21 738 521 591 416 786 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 9 0 0 10 0 0 0 3 11 0 0 49 1 0 0] 34 2 528 864 848 nil 27 )! !
!ChessPromotionDialog class categoriesForMethods!
resource_Default_view!public!resources-views! !
!

