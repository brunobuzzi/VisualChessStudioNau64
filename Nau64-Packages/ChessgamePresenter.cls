"Filed out from Dolphin Smallalk"!

AbstractChessboardPresenter subclass: #ChessGamePresenter
	instanceVariableNames: 'chessGame gameExecutor movesPresenter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGamePresenter guid: (GUID fromString: '{2f0bf0a9-c497-4443-98a4-e1081722f91e}')!
ChessGamePresenter comment: ''!
!ChessGamePresenter categoriesForClass!Unclassified! !
!ChessGamePresenter methodsFor!

buildFenExecutorFor: aChessboard

	gameExecutor := chessGame newFenExecutorOn: aChessboard!

buildPgnExecutor

	gameExecutor := chessGame newPgnExecutor!

buildPgnExecutorFor: aChessboard

	gameExecutor := chessGame newPgnExecutorOn: aChessboard!

buildPgnExecutorPerformAllMoves

	gameExecutor := chessGame buildPgnExecutor.
	gameExecutor redoAllMovesOn: model!

buildPgnExecutorPerformAllMovesFor: aChessboard
	| toMove index array |
	toMove := #white.
	index := 1.
	movesPresenter model: ListModel new.
	gameExecutor := chessGame newPgnExecutorOn: aChessboard.
	gameExecutor redoAllMovesOn: aChessboard currentMoveDo: [:move | 
		(toMove = #white) 
			ifTrue: [toMove := #black.
				array := OrderedCollection with: move.
				]
			ifFalse: [toMove := #white.
				array add: move.
				index := index + 1.
				movesPresenter model add: array.
				].
	].
!

chessGame
	^chessGame!

createComponents

	super createComponents.

	movesPresenter := self add: ListPresenter new name: 'moves'.!

endTrackingAt: aPoint 
	| originSquare targetSquare piece move promotionPieceClass |

	originSquare := model squareAt: mouseTracker startPoint.
	targetSquare := model squareAt: (mouseTracker sumStartLocalPointTo: aPoint).
	(originSquare isNil or: [targetSquare isNil]) ifTrue: [^nil].

	piece := model pieceAt: originSquare.

	(gameExecutor isCorrectSideToMove: piece on: model)
	ifFalse: [^MessageBubble notify: ('Wrong Side to move, it must move: [', piece oppositeSideName ,']') caption: 'Nau64'].

	(piece isValidMoveFromCoordinate: originSquare coordinate to: targetSquare coordinate on: model on: gameExecutor) 
	ifFalse: [^MessageBubble notify: ('Invalid move from [',  originSquare coordinate, '] to [',  targetSquare coordinate, ']') caption: 'Nau64'].

	move := gameExecutor annotateMoveFrom: originSquare coordinate to: targetSquare coordinate on: model.
	move isPromotion ifTrue: [[promotionPieceClass isNil] whileTrue: [promotionPieceClass := self selectPromotionPiece].
						move promotion setPromotionPieceClass: promotionPieceClass].
	gameExecutor performMove: move on: model.

	self renderChessboard.!

model: aModel

	super model: aModel.
!

moveRedo

	gameExecutor redoNextMoveOn: model.
	self renderChessboard.!

moveRedoAllOn: aChessboard
	| toMove index array |
	toMove := #white.
	index := 1.
	movesPresenter model: ListModel new.
	gameExecutor redoAllMovesOn: aChessboard currentMoveDo: [:move | 
		(toMove = #white) 
			ifTrue: [toMove := #black.
				array := OrderedCollection with: move.
				]
			ifFalse: [toMove := #white.
				array add: move.
				index := index + 1.
				movesPresenter model add: array.
				].
	].

	self renderChessboard.!

moveRedoOn: aChessboard 

	gameExecutor redoNextMoveOn: aChessboard.
	self renderChessboard.

!

moveUndo

	gameExecutor undoLastMoveOn: model.

	self renderChessboard.!

moveUndoAllOn: aChessboard

	gameExecutor undoAllMovesOn: aChessboard.

	self renderChessboard.!

moveUndoOn: aChessboard

	gameExecutor undoLastMoveOn: aChessboard.

	self renderChessboard.!

newChessboardFromFEN
	| fenString |

	self newEmptyChessboard.
	fenString := Prompter prompt: 'Enter PEM String' caption: 'Chess Studio'.
	(ChessFenParser newOn: systemRoot fenString: fenString) deployOn: model.
	chessGame := ChessGame newOn: systemRoot whitePlayer: nil blackPlayer: nil fenString: fenString.
	self renderChessboard.!

newEmptyChessboard

	self model: (Chessboard newEmptyOn: systemRoot).
	self renderChessboard!

onViewOpened

	effects := OrderedCollection new.
	super onViewOpened.

!

queryCommand: aCommandQuery 
	
	super queryCommand: aCommandQuery.!

renderChessboard
	| gdiBitmap |
	gdiBitmap := GdiplusBitmap extent: DesktopView current extent.
	model drawOn: gdiBitmap isDisplayCoordinatesEnabled: isDisplayCoordinatesEnabled.
	effects do: [:chessboardEffect | chessboardEffect drawOn: gdiBitmap].
	self imageModel: gdiBitmap asValue.

	gameExecutor ifNil: [^self].

	gameExecutor currentMoveDo: [:move | | currentMoveArray |
		currentMoveArray := movesPresenter model detect: [:array | array first == move or:[array second == move]] ifNone: [].
		movesPresenter selectionOrNil: currentMoveArray.
	]!

setGame: aChessGame
	chessGame := aChessGame.
	gameExecutor := ChessGameExecutor newOn: chessGame chessboard: model!

setRoot: aSystemRoot

	self setRoot: aSystemRoot fenString: '8/8/8/8/8/8/8/8/ w - - 1 20'!

setRoot: aSystemRoot fenString: fenString

	super setRoot: aSystemRoot.

	chessGame := ChessGame newOn: aSystemRoot whitePlayer: nil blackPlayer: nil fenString: fenString.

"	fenString ifNotNil: [ | parser |
		parser := ChessFenParser newOn: aSystemRoot fenString: fenString.
		chessGame setOptionFromFenParser: parser.
		parser deployOn: self model.
	]."
!

setRoot: aSystemRoot pgnString: pgnString

	super setRoot: aSystemRoot.

	chessGame := ChessGame newOn: aSystemRoot whitePlayer: nil blackPlayer: nil pgnString: pgnString.
!

startTrackingAt: aPoint 

	gameExecutor ifNil: [gameExecutor := chessGame newExecutor].
	super startTrackingAt: aPoint.! !
!ChessGamePresenter categoriesForMethods!
buildFenExecutorFor:!public! !
buildPgnExecutor!public! !
buildPgnExecutorFor:!public! !
buildPgnExecutorPerformAllMoves!public! !
buildPgnExecutorPerformAllMovesFor:!public! !
chessGame!public! !
createComponents!public! !
endTrackingAt:!drag & drop!public! !
model:!public! !
moveRedo!moves!public! !
moveRedoAllOn:!moves!public! !
moveRedoOn:!moves!public! !
moveUndo!moves!public! !
moveUndoAllOn:!moves!public! !
moveUndoOn:!moves!public! !
newChessboardFromFEN!public! !
newEmptyChessboard!public! !
onViewOpened!public! !
queryCommand:!public! !
renderChessboard!public!rendering-chessboard! !
setGame:!public! !
setRoot:!private! !
setRoot:fenString:!private! !
setRoot:pgnString:!private! !
startTrackingAt:!drag & drop!public! !
!

!ChessGamePresenter class methodsFor!

createIn: aPresenter on: aChessboard root: chessRoot 
	| presenter |

	presenter := self createIn: aPresenter on: aChessboard.
	presenter setRoot: chessRoot fenString: aChessboard printFenString, ' w - - 1 20'.
	aChessboard squareSize: 30.
	presenter isDisplayCoordinatesEnabled: true.
	presenter renderChessboard.
	^presenter!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ContainerView) 34 15 nil nil 34 2 8 1409286144 131073 416 nil 327686 ##(Smalltalk.Color) #face3d 328198 ##(Smalltalk.Point) 1315 1215 5 nil nil nil 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() false 170 192 592 nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 514 5119 21 514 1315 1215 416 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 9 0 0 10 0 0 0 144 12 0 0 105 2 0 0] 34 1 410 ##(Smalltalk.ContainerView) 34 15 nil 416 34 2 8 1140850688 131073 832 nil nil nil 5 nil nil nil 832 788230 ##(Smalltalk.BorderLayout) 1 1 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 928 nil nil nil 5 nil nil nil 928 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.Toolbar) 34 25 nil 928 34 2 8 1409288972 131073 1056 nil 482 #default nil 5 nil nil nil 1056 1120 8 1948235040 170 192 592 170 192 34 16 47817 1115206 1 ##(Smalltalk.ToolbarIconButton) 1056 1 1180998 4 ##(Smalltalk.CommandDescription) #moveRedoAll 8 'Redo All' 1 1 788806 1 ##(Smalltalk.TextTileIcon) $\x21D2 8 'Cambria' nil 482 #red nil 3 1 nil nil 47817 47813 1202 1056 1 1234 #moveRedo 8 'Move Redo' 1 1 263494 3 ##(Smalltalk.Icon) nil true 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'HistoryForward.ico' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' nil 47813 47809 1202 1056 1 1234 #reverseChessboard 8 'Reverse Chessboard' 1 1 1394 nil true 1440 8 'Boolean.ico' 1488 47809 47805 1202 1056 1 1234 #newEmptyChessboard 8 'New Empty Chessboard' 1 1 1282 8 '□' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 47805 47815 1202 1056 1 1234 #moveUndoAll 8 'Undo All' 1 1 1282 $\x21D0 8 'Cambria' nil 1328 nil 3 1 nil nil 47815 47811 1202 1056 1 1234 #moveUndo 8 'Move Undo' 1 1 1394 nil true 1440 8 'HistoryBack.ico' 1488 47811 47807 1202 1056 1 1234 #toggleCoordinates 8 'Toggle Coordinates' 1 1 1394 nil true 1440 8 'TextEdit.ico' 1488 47807 47803 1202 1056 1 1234 #newChessboard 8 'New Chessboard' 1 1 1282 8 '▦' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 47803 34 11 1936 1600 1049158 1 ##(Smalltalk.ToolbarSeparator) 1056 1 1856 1520 2050 1056 1 1776 1344 2050 1056 1 1696 1216 nil nil 1 nil nil nil nil 656198 1 ##(Smalltalk.FlowLayout) 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 1056 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 8 #() 514 193 193 nil 27 8 'chessboardCommands' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 928 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 34 1 1056 2304 nil 27 nil 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 2496 nil nil nil 5 nil nil nil 2496 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1265 51 514 51 1165 2496 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 120 2 0 0 25 0 0 0 145 2 0 0 95 2 0 0] 34 1 410 ##(Smalltalk.Toolbar) 34 25 nil 2496 34 2 8 1409289100 131137 2768 nil 1120 nil 517 nil nil nil 2768 1120 8 1948235040 170 192 592 170 192 34 8 47823 1202 2768 1 1234 #toggleFourChessChunks 8 'Toggle 4 Chess Chunks' 1 1 1282 8 '▣' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 47823 47821 1202 2768 1 1234 #showAttackedSquaresBySide 8 'Show Attacked Squares by Side' 1 1 1282 $\x2622 8 'Segoe UI Emoji' nil nil nil nil 1 nil nil 47821 47819 1202 2768 1 1234 #clearEffects 8 'Clear Effects' 1 1 1394 nil true 1440 8 'DocumentShell.ico' 1488 47819 47825 1202 2768 1 1234 #toogleCenterChunk 8 'Toogle Center Chunk' 1 1 1394 nil true 1440 8 'Icon.ico' 1488 47825 34 6 3072 2050 2768 1 2992 2050 2768 1 2896 3152 nil nil 1 nil nil nil nil 2114 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 51 1165 2768 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 25 0 0 0 70 2 0 0] 8 #() 2304 nil 27 2304 nil 27 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 3456 nil nil nil 5 nil nil nil 3456 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 51 514 51 1165 3456 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 25 0 0 0 25 0 0 0 95 2 0 0] 8 #() 2304 nil 27 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 3728 nil nil nil 5 nil nil nil 3728 898 1 1 nil nil 410 ##(Smalltalk.ContainerView) 34 15 nil 3728 34 2 8 1140850688 131073 3808 nil nil nil 5 nil nil nil 3808 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.ListView) 34 45 nil 3808 34 2 8 1409388621 1025 3936 590662 2 ##(Smalltalk.ListModel) 138 144 592 nil 1310726 ##(Smalltalk.IdentitySearchPolicy) 1120 nil 5 nil nil nil 3936 nil 8 1948211296 459270 ##(Smalltalk.Message) #displayString 8 #() ##(Smalltalk.IconicListAbstract) 1049926 1 ##(Smalltalk.IconImageManager) nil nil nil nil nil nil 138 144 34 3 920646 5 ##(Smalltalk.ListViewColumn) 8 'Nr.' 101 #left 787814 3 ##(Smalltalk.BlockClosure) 0 nil 1180966 ##(Smalltalk.CompiledExpression) 3 1 4096 8 'doIt' 8 '[:array | array first index ]' 8 #[31 105 226 0 159 106] #first #index 4272 7 257 nil 4098 #<= 592 nil nil 3936 nil 1 nil nil 4210 8 'White' 201 #left 4258 0 nil 4290 3 1 4256 8 'doIt' 8 '[:array | array first printPgn]' 8 #[31 105 226 0 159 106] #first #printPgn 4416 7 257 nil 4098 #<= 8 #() nil nil 3936 nil 1 nil nil 4210 8 'Black' 201 #left 4258 0 nil 4290 3 1 4096 8 'doIt' 8 '[:array | array second printPgn]' 8 #[31 105 226 0 159 106] #second #printPgn 4560 7 257 nil 4098 #<= 592 nil nil 3936 nil 1 nil nil #report 8 #() nil 131171 nil 1 nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil 626 138 144 34 2 690 #createAt:extent: 34 2 514 1 1 514 531 1165 3936 690 #text: 34 1 8 'Nr.' 3936 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 9 1 0 0 70 2 0 0] 8 #() 2304 nil 35 8 'moves' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 685 1 514 531 1165 3808 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 86 1 0 0 0 0 0 0 95 2 0 0 70 2 0 0] 34 1 3936 2304 nil 27 nil 410 ##(Smalltalk.ContainerView) 34 15 nil 3728 34 2 8 1140850688 131073 5056 nil nil nil 5 nil nil nil 5056 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.GdiplusImageView) 34 28 nil 5056 34 2 8 1140850944 1 5184 721990 2 ##(Smalltalk.ValueHolder) nil false 1310726 ##(Smalltalk.EqualitySearchPolicy) nil 496 nil 5 nil nil nil 5184 nil nil 852486 ##(Smalltalk.NullConverter) nil nil nil nil #normal 1 590342 ##(Smalltalk.Rectangle) 514 1 1 514 1 1 nil nil #none nil nil nil nil nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 685 1165 5184 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 86 1 0 0 70 2 0 0] 8 #() 2304 nil 29 8 'chessboard' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 685 1165 5056 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 86 1 0 0 70 2 0 0] 34 1 5184 2304 nil 27 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 51 51 514 1215 1165 3728 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 25 0 0 0 25 0 0 0 120 2 0 0 95 2 0 0] 34 2 5056 3808 2304 nil 27 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 1215 832 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 95 2 0 0] 34 4 928 3728 3456 2496 2304 nil 27 2304 nil 27 )! !
!ChessGamePresenter class categoriesForMethods!
createIn:on:root:!public! !
resource_Default_view!public!resources-views! !
!

