"Filed out from Dolphin Smallalk"!

ChessAbstractPresenter subclass: #AbstractChessboardPresenter
	instanceVariableNames: 'chessboardImagePresenter mouseTracker isDisplayCoordinatesEnabled effects'
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

	Clipboard current setText: model printFenString!

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
	| originSquare targetSquare piece move promotionPieceClass |

	originSquare := model squareAt: mouseTracker startPoint.
	targetSquare := model squareAt: (mouseTracker sumStartLocalPointTo: aPoint).
	(originSquare isNil or: [targetSquare isNil]) ifTrue: [^nil].

	piece := model pieceAt: originSquare.

	(chessGame isCorrectSideToMove: piece on: model)
	ifFalse: [^MessageBubble notify: ('Wrong Side to move, it must move: [', piece oppositeSideName ,']') caption: 'Nau64'].

	(piece isValidMoveFromCoordinate: originSquare coordinate to: targetSquare coordinate on: model on: chessGame) 
	ifFalse: [^MessageBubble notify: ('Invalid move from [',  originSquare coordinate, '] to [',  targetSquare coordinate, ']') caption: 'Nau64'].

	move := chessGame annotateMoveFrom: originSquare coordinate to: targetSquare coordinate on: model.
	move isPromotion ifTrue: [[promotionPieceClass isNil] whileTrue: [promotionPieceClass := self selectPromotionPiece].
						move promotion setPromotionPieceClass: promotionPieceClass].
	chessGame performMove: move on: model.

	self renderChessboard.!

gdiBitmap

	^chessboardImagePresenter value!

graphics

	^chessboardImagePresenter value graphics!

imageModel: aModel

	chessboardImagePresenter model: aModel!

isDisplayCoordinatesEnabled: aBoolean

	isDisplayCoordinatesEnabled := aBoolean!

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
	self renderChessboard.!

renderChessboard

	self subclassResponsibility!

reverseChessboard

	model toggleOrientation.

	self renderChessboard.!

selectPiecesTypes
	| fontName |

	fontName := Font choose.
	fontName isNil ifTrue: [^self].
	fontName := fontName name.
	systemRoot setUnicodeFontName: fontName.
	self renderChessboard.!

selectPromotionPiece

	^ChessPromotionDialog showModalOn: Pawn validPromotionClasses
!

setRoot: aSystemRoot

	super setRoot: aSystemRoot.

	effects := OrderedCollection new.!

setRoot: aSystemRoot fenString: fenString

	super setRoot: aSystemRoot.

	fenString ifNotNil: [ | parser |
		parser := ChessFenParser newOn: aSystemRoot fenString: fenString.
		parser deployOn: self model.
	].!

startTrackingAt: aPoint!

toggleCoordinates

	isDisplayCoordinatesEnabled := isDisplayCoordinatesEnabled not.

	self renderChessboard.!

toggleFourChessChunks

	effects add: (ChessFourChunkEffect newOn: model).
	self renderChessboard.!

toogleCenterChunk

	effects add: (ChessCenterChunkEffect newOn: model).
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
isDisplayCoordinatesEnabled:!public!rendering-effects! !
movePiece:!public! !
onDragOver:!drag & drop!public! !
onDropOver:!drag & drop!public! !
onViewOpened!public! !
renderChessboard!public!rendering-chessboard! !
reverseChessboard!public!rendering-effects! !
selectPiecesTypes!public! !
selectPromotionPiece!public! !
setRoot:!private! !
setRoot:fenString:!private! !
startTrackingAt:!drag & drop!public! !
toggleCoordinates!public!rendering-effects! !
toggleFourChessChunks!public! !
toogleCenterChunk!public! !
!

!AbstractChessboardPresenter class methodsFor!

defaultModel

	^Chessboard new! !
!AbstractChessboardPresenter class categoriesForMethods!
defaultModel!public! !
!

