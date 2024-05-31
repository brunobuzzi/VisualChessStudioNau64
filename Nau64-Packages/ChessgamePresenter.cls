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
	gameExecutor playAllMoves!

buildPgnExecutorPerformAllMovesFor: aChessboard
	| toMove index |
	toMove := #white.
	index := 1.
	movesPresenter model: '' asValue.
	gameExecutor := chessGame newPgnExecutorOn: aChessboard.
	gameExecutor playAllMovesDoWithCurrent: [:move | | value |
		value := (toMove = #white) 
			ifTrue: [toMove := #black.
				movesPresenter model value, index printString, '.', move printPgn.]
			ifFalse: [toMove := #white.
				index := index + 1.
				movesPresenter model value, ' ', move printPgn, String lineDelimiter.].
		movesPresenter model: value asValue.

	].
!

chessGame
	^chessGame!

createComponents

	super createComponents.

	movesPresenter := self add: TextPresenter new name: 'moves'.!

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

	gameExecutor playNextMove.
	self renderChessboard.!

moveRedoOn: aChessboard 

	gameExecutor playNextMove.
	self renderChessboard.

!

moveUndo

	gameExecutor undoLastMoveOn: model.

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
	self imageModel: gdiBitmap asValue.!

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
moveRedoOn:!moves!public! !
moveUndo!moves!public! !
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

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ContainerView) 34 15 nil nil 34 2 8 1409286144 131073 416 nil 327686 ##(Smalltalk.Color) #face3d 328198 ##(Smalltalk.Point) 1315 1215 5 nil nil nil 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() false 170 192 592 nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 514 5119 21 514 1315 1215 416 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 9 0 0 10 0 0 0 144 12 0 0 105 2 0 0] 34 1 410 ##(Smalltalk.ContainerView) 34 15 nil 416 34 2 8 1140850688 131073 832 nil nil nil 5 nil nil nil 832 788230 ##(Smalltalk.BorderLayout) 1 1 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 928 nil nil nil 5 nil nil nil 928 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.Toolbar) 34 25 nil 928 34 2 8 1409288972 131073 1056 nil 482 #default nil 5 nil nil nil 1056 1120 8 1891022112 170 192 592 170 192 34 12 18455 1115206 1 ##(Smalltalk.ToolbarIconButton) 1056 1 1180998 4 ##(Smalltalk.CommandDescription) #moveUndo 8 'Move Undo' 1 1 263494 3 ##(Smalltalk.Icon) nil true 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'HistoryBack.ico' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' nil 18455 18451 1202 1056 1 1234 #toggleCoordinates 8 'Toggle Coordinates' 1 1 1282 nil true 1328 8 'TextEdit.ico' 1376 18451 18447 1202 1056 1 1234 #newChessboard 8 'New Chessboard' 1 1 788806 1 ##(Smalltalk.TextTileIcon) 8 '▦' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 18447 18457 1202 1056 1 1234 #moveRedo 8 'Move Redo' 1 1 1282 nil true 1328 8 'HistoryForward.ico' 1376 18457 18453 1202 1056 1 1234 #reverseChessboard 8 'Reverse Chessboard' 1 1 1282 nil true 1328 8 'Boolean.ico' 1376 18453 18449 1202 1056 1 1234 #newEmptyChessboard 8 'New Empty Chessboard' 1 1 1538 8 '□' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 18449 34 8 1488 1760 1049158 1 ##(Smalltalk.ToolbarSeparator) 1056 1 1408 1680 1874 1056 1 1216 1600 nil nil 1 nil nil nil nil 656198 1 ##(Smalltalk.FlowLayout) 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 1056 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 8 #() 514 193 193 nil 27 8 'chessboardCommands' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 928 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 34 1 1056 2112 nil 27 nil 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 2304 nil nil nil 5 nil nil nil 2304 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1265 51 514 51 1165 2304 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 120 2 0 0 25 0 0 0 145 2 0 0 95 2 0 0] 34 1 410 ##(Smalltalk.Toolbar) 34 25 nil 2304 34 2 8 1409289100 131137 2576 nil 1120 nil 517 nil nil nil 2576 1120 8 1891022112 170 192 592 170 192 34 8 18465 1202 2576 1 1234 #toogleCenterChunk 8 'Toogle Center Chunk' 1 1 1282 nil true 1328 8 'Icon.ico' 1376 18465 18463 1202 2576 1 1234 #toggleFourChessChunks 8 'Toggle 4 Chess Chunks' 1 1 1538 8 '▣' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 18463 18461 1202 2576 1 1234 #showAttackedSquaresBySide 8 'Show Attacked Squares by Side' 1 1 1538 $\x2622 8 'Segoe UI Emoji' nil nil nil nil 1 nil nil 18461 18459 1202 2576 1 1234 #clearEffects 8 'Clear Effects' 1 1 1282 nil true 1328 8 'DocumentShell.ico' 1376 18459 34 6 2960 1874 2576 1 2880 1874 2576 1 2784 2704 nil nil 1 nil nil nil nil 1922 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 51 1165 2576 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 25 0 0 0 70 2 0 0] 8 #() 2112 nil 27 2112 nil 27 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 3264 nil nil nil 5 nil nil nil 3264 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 51 514 51 1165 3264 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 25 0 0 0 25 0 0 0 95 2 0 0] 8 #() 2112 nil 27 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 3536 nil nil nil 5 nil nil nil 3536 898 1 1 nil nil 410 ##(Smalltalk.ContainerView) 34 15 nil 3536 34 2 8 1140850688 131073 3616 nil nil nil 5 nil nil nil 3616 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.MultilineTextEdit) 34 16 nil 3616 34 2 8 1143017796 1025 3744 nil 1120 nil 5 nil nil nil 3744 nil 8 1891054960 852486 ##(Smalltalk.NullConverter) nil nil 9 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 271 1165 3744 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 135 0 0 0 70 2 0 0] 8 #() 2112 nil 27 8 'moves' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 945 1 514 271 1165 3616 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 216 1 0 0 0 0 0 0 95 2 0 0 70 2 0 0] 34 1 3744 2112 nil 27 nil 410 ##(Smalltalk.ContainerView) 34 15 nil 3536 34 2 8 1140850688 131073 4192 nil nil nil 5 nil nil nil 4192 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.GdiplusImageView) 34 28 nil 4192 34 2 8 1140850944 1 4320 721990 2 ##(Smalltalk.ValueHolder) nil false 1310726 ##(Smalltalk.EqualitySearchPolicy) nil 496 nil 5 nil nil nil 4320 nil nil 3826 nil nil nil nil #normal 1 590342 ##(Smalltalk.Rectangle) 514 1 1 514 1 1 nil nil #none nil nil nil nil nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 945 1165 4320 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 216 1 0 0 70 2 0 0] 8 #() 2112 nil 29 8 'chessboard' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 945 1165 4192 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 216 1 0 0 70 2 0 0] 34 1 4320 2112 nil 27 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 51 51 514 1215 1165 3536 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 25 0 0 0 25 0 0 0 120 2 0 0 95 2 0 0] 34 2 4192 3616 2112 nil 27 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 1215 832 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 95 2 0 0] 34 4 928 3536 3264 2304 2112 nil 27 2112 nil 27 )! !
!ChessGamePresenter class categoriesForMethods!
createIn:on:root:!public! !
resource_Default_view!public!resources-views! !
!

