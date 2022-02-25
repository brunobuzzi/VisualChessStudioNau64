"Filed out from Dolphin Smallalk"!

AbstractChessboardPresenter subclass: #ChessGamePresenter
	instanceVariableNames: 'chessGame'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGamePresenter guid: (GUID fromString: '{2f0bf0a9-c497-4443-98a4-e1081722f91e}')!
ChessGamePresenter comment: ''!
!ChessGamePresenter categoriesForClass!Unclassified! !
!ChessGamePresenter methodsFor!

endTrackingAt: aPoint 
	| originSquare targetSquare piece |

	originSquare := model squareAt: mouseTracker startPoint.
	targetSquare := model squareAt: (mouseTracker sumStartLocalPointTo: aPoint).
	(originSquare isNil or: [targetSquare isNil]) ifTrue: [^nil].

	piece := model pieceAt: originSquare.

	(chessGame isCorrectSideToMove: piece on: model)
	ifFalse: [^MessageBubble notify: ('Wrong Side to move, it must mode: [', piece oppositeSideName ,']') caption: 'Nau64'].

	(piece isValidMoveFromCoordinate: originSquare coordinate to: targetSquare coordinate on: model on: chessGame) 
	ifFalse: [^MessageBubble notify: ('Invalid move from [',  originSquare coordinate, '] to [',  targetSquare coordinate, ']') caption: 'Nau64'].

	chessGame annotateAndMovePieceFrom: originSquare coordinate to: targetSquare coordinate on: model.

	self renderChessboard.!

onViewOpened
	super onViewOpened.
	self topShell view extent: 657 @ 607.
	self renderChessboard!

renderChessboard
	| gdiBitmap |
	gdiBitmap := GdiplusBitmap extent: DesktopView current extent.
	model drawOn: gdiBitmap isDisplayCoordinatesEnabled: false .
	self imageModel: gdiBitmap asValue!

setRoot: aSystemRoot

	self setRoot: aSystemRoot fenString: nil!

setRoot: aSystemRoot fenString: fenString

	super setRoot: aSystemRoot.

	chessGame := ChessGame newOn: aSystemRoot whitePlayer: nil blackPlayer: nil fenString: fenString.! !
!ChessGamePresenter categoriesForMethods!
endTrackingAt:!drag & drop!public! !
onViewOpened!public! !
renderChessboard!public!rendering-chessboard! !
setRoot:!private! !
setRoot:fenString:!private! !
!

!ChessGamePresenter class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ContainerView) 34 15 nil nil 34 2 8 1409286144 131073 416 nil 327686 ##(Smalltalk.Color) #face3d 328198 ##(Smalltalk.Point) 1315 1215 5 nil nil nil 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() false 170 192 592 nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 514 11519 21 514 1315 1215 416 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 22 0 0 10 0 0 0 16 25 0 0 105 2 0 0] 34 1 410 ##(Smalltalk.ContainerView) 34 15 nil 416 34 2 8 1140850688 131073 832 nil nil nil 5 nil nil nil 832 788230 ##(Smalltalk.BorderLayout) 1 1 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 928 nil nil nil 5 nil nil nil 928 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.Toolbar) 34 25 nil 928 34 2 8 1409288972 131073 1056 nil 482 #default nil 5 nil nil nil 1056 1120 8 1905964304 170 192 592 170 192 34 8 26279 1115206 1 ##(Smalltalk.ToolbarIconButton) 1056 1 1180998 4 ##(Smalltalk.CommandDescription) #newChessboard 8 'New Chessboard' 1 1 263494 3 ##(Smalltalk.Icon) nil true 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'Ajedrez\chess_icon-icons.com_65163.ico' nil 26279 26285 1202 1056 1 1234 #reverseChessboard 8 'Reverse Chessboard' 1 1 1282 nil true 1328 8 'Boolean.ico' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' nil 26285 26283 1202 1056 1 1234 #toggleCoordinates 8 'Toggle Coordinates' 1 1 1282 nil true 1328 8 'TextEdit.ico' 1456 26283 26281 1202 1056 1 1234 #newEmptyChessboard 8 'New Empty Chessboard' 1 1 1282 nil true 1328 8 'Ajedrez\wwhitecellw.ico' nil 26281 34 5 1216 1568 1049158 1 ##(Smalltalk.ToolbarSeparator) 1056 1 1488 1360 nil nil 1 nil nil nil nil 656198 1 ##(Smalltalk.FlowLayout) 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 1056 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 8 #() 514 193 193 nil 27 8 'chessboardCommands' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 928 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 34 1 1056 1888 nil 27 nil 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 2080 nil nil nil 5 nil nil nil 2080 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1265 51 514 51 1165 2080 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 120 2 0 0 25 0 0 0 145 2 0 0 95 2 0 0] 34 1 410 ##(Smalltalk.Toolbar) 34 25 nil 2080 34 2 8 1409289100 131137 2352 nil 1120 nil 517 nil nil nil 2352 1120 8 1905964304 170 192 592 170 192 34 8 26317 1202 2352 1 1234 #toogleCenterChunk 8 'Toogle Center Chunk' 1 1 1282 nil true 1328 8 'Icon.ico' 1456 26317 26315 1202 2352 1 1234 #toggleFourChessChunks 8 'Toggle 4 Chess Chunks' 1 1 1282 nil true 1328 8 'Ajedrez\squeare.ico' nil 26315 26313 1202 2352 1 1234 #showAttackedSquaresBySide 8 'Show Attacked Squares by Side' 1 1 1282 nil true 1328 8 'Ajedrez\wwhitecellb.ico' nil 26313 26311 1202 2352 1 1234 #clearEffects 8 'Clear Effects' 1 1 1282 nil true 1328 8 'DocumentShell.ico' 1456 26311 34 6 2720 1666 2352 1 2640 1666 2352 1 2560 2480 nil nil 1 nil nil nil nil 1698 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 51 1165 2352 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 25 0 0 0 70 2 0 0] 8 #() 1888 nil 27 1888 nil 27 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 3024 nil nil nil 5 nil nil nil 3024 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 51 514 51 1165 3024 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 25 0 0 0 25 0 0 0 95 2 0 0] 8 #() 1888 nil 27 410 ##(Smalltalk.GdiplusImageView) 34 28 nil 832 34 2 8 1140850944 1 3296 721990 2 ##(Smalltalk.ValueHolder) nil false 1310726 ##(Smalltalk.EqualitySearchPolicy) nil 496 nil 5 nil nil nil 3296 nil nil 852486 ##(Smalltalk.NullConverter) nil nil nil nil #normal 1 590342 ##(Smalltalk.Rectangle) 514 1 1 514 1 1 nil nil #none nil nil nil nil nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 51 51 514 1215 1165 3296 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 25 0 0 0 25 0 0 0 120 2 0 0 95 2 0 0] 8 #() 1888 nil 29 170 192 34 2 3296 8 'chessboard' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 1215 832 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 95 2 0 0] 34 4 928 3296 3024 2080 1888 nil 27 1888 nil 27 )! !
!ChessGamePresenter class categoriesForMethods!
resource_Default_view!public!resources-views! !
!

