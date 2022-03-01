"Filed out from Dolphin Smallalk"!

ChessAbstractPresenter subclass: #AbstractChessboardPresenter
	instanceVariableNames: 'chessboardImagePresenter mouseTracker isDisplayCoordinatesEnabled'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AbstractChessboardPresenter guid: (GUID fromString: '{4717b72f-27ee-4e6b-9e66-91184e06419c}')!
AbstractChessboardPresenter comment: ''!
!AbstractChessboardPresenter categoriesForClass!Unclassified! !
!AbstractChessboardPresenter methodsFor!

cancelTrackingAt: arg1
!

continueTrackingAt: aPoint from: aPreviousPoint!

copyPositionAsFenString
	| fenStream |

	fenStream := String new writeStream.
	systemRoot fenSquares do: [:squareCollection | | freeSquares |
		freeSquares := 0.
		squareCollection do: [:square | 
			model 
				pieceAt: square 
				do: [:piece | (freeSquares > 0) 
						ifTrue: [fenStream nextPutAll: freeSquares printString.
							freeSquares := 0].
						fenStream nextPutAll: piece fenString] 
				ifAbsent: [freeSquares := freeSquares + 1].
		].
		(freeSquares > 0) ifTrue: [fenStream nextPutAll: freeSquares printString].
		fenStream nextPut: $/.
	].

	Clipboard current setText: fenStream contents!

createComponents

	super createComponents.

	chessboardImagePresenter := self add: ImagePresenter new name: 'chessboard'.!

createSchematicWiring

	super createSchematicWiring.

	chessboardImagePresenter
		when: #drop: send: #onDropOver: to: self;
		when: #dragOver: send: #onDragOver: to: self;
		when: #leftButtonPressed: send: #movePiece: to: self.!

endTrackingAt: aPoint 

	self subclassResponsibility!

gdiBitmap

	^chessboardImagePresenter value!

graphics

	^chessboardImagePresenter value graphics!

imageModel: aModel

	chessboardImagePresenter model: aModel!

movePiece: aMouseEvent
	| square piece cursor |

	square := model squareAt: aMouseEvent position.
	square ifNil: [^self].
	piece := model pieceAt: square.
	piece ifNil: [^self].
	mouseTracker :=  MouseTracker forPresenter: self startingAt: aMouseEvent position.
	cursor := Cursor hand.
	cursor showWhile: [mouseTracker startTracking: self].
!

onDragOver: session 
	"The user is dragging over the class hierarchy pane.
	Set the operation of the <DragDropSession>, session,
	that would occur if a drop took place now of the objects in that session."
	"Default the operation to nil to signal that we don't want the drop"

	(session isFormatAvailable: #Piece) ifTrue: [session operation: session intendedOperation.^self]. 
	^self.!

onDropOver: aDragDropSession 
	"Private - The drag operation described by the <DragDropSession>, session, would like 
	to do a drop over the receiver's class pane."
	"Implementation Note: If the drop fails then we must set the operation to nil in order that 
	the DD session can detect the failure (as this is an event handler the return value is ignored)."
!

onViewOpened

	super onViewOpened.

	isDisplayCoordinatesEnabled := false.
	self topShell view extent: 657 @ 607.
	self renderChessboard.!

renderChessboard

	self subclassResponsibility!

reverseChessboard

	model toggleOrientation.

	self renderChessboard.!

startTrackingAt: aPoint!

toggleCoordinates

	isDisplayCoordinatesEnabled := isDisplayCoordinatesEnabled not.

	self renderChessboard.! !
!AbstractChessboardPresenter categoriesForMethods!
cancelTrackingAt:!drag & drop!public! !
continueTrackingAt:from:!drag & drop!public! !
copyPositionAsFenString!public! !
createComponents!public! !
createSchematicWiring!public! !
endTrackingAt:!drag & drop!public! !
gdiBitmap!public! !
graphics!public! !
imageModel:!public! !
movePiece:!public! !
onDragOver:!drag & drop!public! !
onDropOver:!drag & drop!public! !
onViewOpened!public! !
renderChessboard!public!rendering-chessboard! !
reverseChessboard!public!rendering-effects! !
startTrackingAt:!drag & drop!public! !
toggleCoordinates!public!rendering-effects! !
!

!AbstractChessboardPresenter class methodsFor!

defaultModel

	^Chessboard new! !
!AbstractChessboardPresenter class categoriesForMethods!
defaultModel!public! !
!

