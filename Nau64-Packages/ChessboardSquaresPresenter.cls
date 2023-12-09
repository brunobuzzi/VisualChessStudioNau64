"Filed out from Dolphin Smallalk"!

AbstractChessboardPresenter subclass: #ChessboardSquaresPresenter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessboardSquaresPresenter guid: (GUID fromString: '{cdea1f81-b0f8-4c01-a922-01798f26ae81}')!
ChessboardSquaresPresenter comment: ''!
!ChessboardSquaresPresenter categoriesForClass!Unclassified! !
!ChessboardSquaresPresenter methodsFor!

onViewOpened

	super onViewOpened.
!

queryCommand: aCommandQuery 
	
	super queryCommand: aCommandQuery.!

renderChessboard
	| gdiBitmap |

	gdiBitmap := GdiplusBitmap extent: DesktopView current extent.
	model drawSquaresOn: gdiBitmap isDisplayCoordinatesEnabled: isDisplayCoordinatesEnabled.
	self imageModel: gdiBitmap asValue!

renderChessboardFor: aSquaresDictionary
	| gdiBitmap pieces |

	aSquaresDictionary pieceDo: [:piece | pieces := OrderedCollection with: piece].
	gdiBitmap := GdiplusBitmap extent: DesktopView current extent.
	model drawOn: gdiBitmap pieces: pieces isDisplayCoordinatesEnabled: isDisplayCoordinatesEnabled.
	self imageModel: gdiBitmap asValue!

setRoot: aSystemRoot fenString: fenString

	super setRoot: aSystemRoot.

	fenString ifNotNil: [ | parser |
		parser := ChessFenParser newOn: aSystemRoot fenString: fenString.
		parser deployOn: self model.
	].! !
!ChessboardSquaresPresenter categoriesForMethods!
onViewOpened!public! !
queryCommand:!public! !
renderChessboard!public!rendering-chessboard! !
renderChessboardFor:!public!rendering-chessboard! !
setRoot:fenString:!private! !
!

!ChessboardSquaresPresenter class methodsFor!

createIn: aPresenter on: aChessboard squaresDictionary: aSquaresDictionary root: chessRoot 
	| presenter fenString |
self halt.
	presenter := self createIn: aPresenter on: aChessboard.
	aSquaresDictionary pieceDo: [:piece | fenString := aChessboard printFenStringFor: piece].
	presenter setRoot: chessRoot fenString: fenString, ' w - - 1 20'.
	aChessboard squareSize: 30.
	presenter isDisplayCoordinatesEnabled: true.
	presenter renderChessboardFor: aSquaresDictionary.
	^presenter!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ContainerView) 34 15 nil nil 34 2 8 1409286144 131073 416 nil 327686 ##(Smalltalk.Color) #face3d 328198 ##(Smalltalk.Point) 1315 1215 5 nil nil nil 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() false 170 192 592 nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 514 2559 21 514 1315 1215 416 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 4 0 0 10 0 0 0 144 7 0 0 105 2 0 0] 34 1 410 ##(Smalltalk.ContainerView) 34 15 nil 416 34 2 8 1140850688 131073 832 nil nil nil 5 nil nil nil 832 788230 ##(Smalltalk.BorderLayout) 1 1 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 928 nil nil nil 5 nil nil nil 928 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.Toolbar) 34 25 nil 928 34 2 8 1409288972 131073 1056 nil 482 #default nil 5 nil nil nil 1056 1120 8 1892660496 170 192 592 170 192 34 12 31825 1115206 1 ##(Smalltalk.ToolbarIconButton) 1056 1 1180998 4 ##(Smalltalk.CommandDescription) #newEmptyChessboard 8 'New Empty Chessboard' 1 1 788806 1 ##(Smalltalk.TextTileIcon) 8 '□' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 31825 31831 1202 1056 1 1234 #moveUndo 8 'Move Undo' 1 1 263494 3 ##(Smalltalk.Icon) nil true 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'HistoryBack.ico' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' nil 31831 31827 1202 1056 1 1234 #toggleCoordinates 8 'Toggle Coordinates' 1 1 1394 nil true 1440 8 'TextEdit.ico' 1488 31827 31823 1202 1056 1 1234 #newChessboard 8 'New Chessboard' 1 1 1282 8 '▦' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 31823 31833 1202 1056 1 1234 #moveRedo 8 'Move Redo' 1 1 1394 nil true 1440 8 'HistoryForward.ico' 1488 31833 31829 1202 1056 1 1234 #reverseChessboard 8 'Reverse Chessboard' 1 1 1394 nil true 1440 8 'Boolean.ico' 1488 31829 34 8 1600 1216 1049158 1 ##(Smalltalk.ToolbarSeparator) 1056 1 1520 1776 1874 1056 1 1344 1696 nil nil 1 nil nil nil nil 656198 1 ##(Smalltalk.FlowLayout) 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 1056 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 8 #() 514 193 193 nil 27 8 'chessboardCommands' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 928 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 34 1 1056 2112 nil 27 nil 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 2304 nil nil nil 5 nil nil nil 2304 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1265 51 514 51 1165 2304 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 120 2 0 0 25 0 0 0 145 2 0 0 95 2 0 0] 34 1 410 ##(Smalltalk.Toolbar) 34 25 nil 2304 34 2 8 1409289100 131137 2576 nil 1120 nil 517 nil nil nil 2576 1120 8 1892660496 170 192 592 170 192 34 8 31837 1202 2576 1 1234 #showAttackedSquaresBySide 8 'Show Attacked Squares by Side' 1 1 1282 $\x2622 8 'Segoe UI Emoji' nil nil nil nil 1 nil nil 31837 31835 1202 2576 1 1234 #clearEffects 8 'Clear Effects' 1 1 1394 nil true 1440 8 'DocumentShell.ico' 1488 31835 31841 1202 2576 1 1234 #toogleCenterChunk 8 'Toogle Center Chunk' 1 1 1394 nil true 1440 8 'Icon.ico' 1488 31841 31839 1202 2576 1 1234 #toggleFourChessChunks 8 'Toggle 4 Chess Chunks' 1 1 1282 8 '▣' 8 'Malgun Gothic' nil nil nil nil 1 nil nil 31839 34 6 2784 1874 2576 1 2704 1874 2576 1 2944 2864 nil nil 1 nil nil nil nil 1922 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 51 1165 2576 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 25 0 0 0 70 2 0 0] 8 #() 2112 nil 27 2112 nil 27 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 3264 nil nil nil 5 nil nil nil 3264 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 51 514 51 1165 3264 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 25 0 0 0 25 0 0 0 95 2 0 0] 8 #() 2112 nil 27 410 ##(Smalltalk.GdiplusImageView) 34 28 nil 832 34 2 8 1140850944 1 3536 721990 2 ##(Smalltalk.ValueHolder) nil false 1310726 ##(Smalltalk.EqualitySearchPolicy) nil 496 nil 5 nil nil nil 3536 nil nil 852486 ##(Smalltalk.NullConverter) nil nil nil nil #normal 1 590342 ##(Smalltalk.Rectangle) 514 1 1 514 1 1 nil nil #none nil nil nil nil nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 51 51 514 1215 1165 3536 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 25 0 0 0 25 0 0 0 120 2 0 0 95 2 0 0] 8 #() 2112 nil 29 170 192 34 2 3536 8 'chessboard' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 1215 832 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 95 2 0 0] 34 4 928 3536 3264 2304 2112 nil 27 2112 nil 27 )! !
!ChessboardSquaresPresenter class categoriesForMethods!
createIn:on:squaresDictionary:root:!public! !
resource_Default_view!public!resources-views! !
!

