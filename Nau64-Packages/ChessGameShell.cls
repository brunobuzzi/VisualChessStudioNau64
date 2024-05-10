"Filed out from Dolphin Smallalk"!

AbstractChessboardShell subclass: #ChessGameShell
	instanceVariableNames: 'chessGamePresenter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGameShell guid: (GUID fromString: '{f54dea1e-dee7-4673-ba71-4ac2420ed6e5}')!
ChessGameShell comment: ''!
!ChessGameShell categoriesForClass!Unclassified! !
!ChessGameShell methodsFor!

createComponents
	super createComponents.
	chessGamePresenter := self add: (ChessGamePresenter newOn: systemRoot)
				name: 'chessboard'!

defaultChessPresenter

	^chessGamePresenter!

model: anObject

	super model: anObject.

	chessGamePresenter model: anObject!

moveRedo

	chessGamePresenter moveRedoOn: model!

moveUndo

	chessGamePresenter moveUndoOn: model!

newChessboardFromFEN

	chessGamePresenter newChessboardFromFEN!

renderChessboard

	chessGamePresenter renderChessboard!

setRoot: aSystemRoot

	self setRoot: aSystemRoot fenString: nil!

setRoot: aSystemRoot fenString: fenString

	systemRoot := aSystemRoot.
	chessGamePresenter setRoot: aSystemRoot fenString: fenString.!

toggleFourChessChunks

	chessGamePresenter toggleFourChessChunks!

toogleCenterChunk

	chessGamePresenter toogleCenterChunk! !
!ChessGameShell categoriesForMethods!
createComponents!public! !
defaultChessPresenter!public! !
model:!public! !
moveRedo!public! !
moveUndo!public! !
newChessboardFromFEN!public! !
renderChessboard!public! !
setRoot:!private! !
setRoot:fenString:!private! !
toggleFourChessChunks!public! !
toogleCenterChunk!public! !
!

!ChessGameShell class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ShellView) 34 27 nil nil 8 #(13565952 65536) 416 nil 327686 ##(Smalltalk.Color) #default nil 549 nil nil nil 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() false 170 192 34 2 410 ##(Smalltalk.ReferenceView) 34 14 nil 416 34 2 8 1140850688 131073 592 nil 480 nil 7 nil nil nil 592 1180230 1 ##(Smalltalk.ResourceIdentifier) ##(Smalltalk.ChessGamePresenter) #resource_Default_view nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 328198 ##(Smalltalk.Point) 1 1 802 1679 1273 592 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 71 3 0 0 124 2 0 0] 544 802 193 193 nil 27 8 'chessboard' nil 461638 4 ##(Smalltalk.MenuBar) nil true 34 3 265030 4 ##(Smalltalk.Menu) nil true 34 1 984134 2 ##(Smalltalk.CommandMenuItem) 1 1180998 4 ##(Smalltalk.CommandDescription) #exit 8 'Exit' 1 1 nil nil nil 8 'File' nil 134217729 nil nil 34863 nil nil 978 nil true 34 10 1026 1 1058 #selectPiecesTypes 8 'Select Pieces Type' 1 1 nil nil nil 983366 1 ##(Smalltalk.DividerMenuItem) 4097 1026 1 1058 #newChessboard 8 'New Chessboard' 1 1 nil nil nil 1026 1 1058 #newEmptyChessboard 8 'New Empty Chessboard' 1 1 nil nil nil 1202 4097 1026 1 1058 #newChessboardFromFEN 8 'New Chessboard fom FEN' 1 1 nil nil nil 1026 1 1058 #copyPositionAsFenString 8 'Copy Position as FEN String' 1 1 nil nil nil 1202 4097 1026 1 1058 #toggleCoordinates 8 'Toggle Coordinates' 1 1 nil nil nil 1026 1 1058 #reverseChessboard 8 'Reverse Chessboard' 1 1 nil nil nil 8 'Chessboard' nil 134217729 nil nil 34879 nil nil 978 nil true 34 9 1026 1 1058 #showAttackedSquaresBySide 8 'Attacked Squares by Side' 1 1 nil nil nil 1202 4097 1026 1 1058 #toggleFourChessChunks 8 'Toggle 4 Chess Chunks' 1 1 nil nil nil 1026 1 1058 #toogleCenterChunk 8 'Toogle Center Chunk' 1 1 nil nil nil 1202 4097 978 nil true 34 2 1026 1 1058 #showForksForWhite 8 'Show Forks for White' 1 1 nil nil nil 1026 1 1058 #showForksForBlack 8 'Show Forks for Black' 1 1 nil nil nil 8 'Forks' nil 134217729 nil nil 34891 nil nil 978 nil true 34 2 978 nil true 34 2 1026 1 1058 #showPinsForWhite 8 'Show Pins for White' 1 1 nil nil nil 1026 1 1058 #showPinsForBlack 8 'Show Pins for Black' 1 1 nil nil nil 8 'Absolute Pin' nil 134217729 nil nil 34897 nil nil 978 nil true 34 2 1026 1 1058 #showPartialPinsForWhite 8 'Show Pins for White' 1 1 nil nil nil 1026 1 1058 #showPartialPinsForBlack 8 'Show Pins for Black' 1 1 nil nil nil 8 'Partial Pin' nil 134217729 nil nil 34903 nil nil 8 'Pins' nil 134217729 nil nil 34905 nil nil 1202 4097 1026 1 1058 #clearEffects 8 'Clear Effects' 1 1 nil nil nil 8 'Effects' nil 134217729 nil nil 34909 nil nil 8 '' nil 134217729 nil nil nil nil nil nil nil nil 1 nil nil nil nil 1 nil nil 690 138 144 34 2 754 #createAt:extent: 34 2 802 11519 21 802 1711 1391 416 754 #text: 34 1 8 'Chessboard Shell' 416 850 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 22 0 0 10 0 0 0 214 25 0 0 193 2 0 0] 34 1 592 896 nil 27 )!

showOn: aChessboard
	| chessboard shell |

	chessboard := Chessboard newWithAllPiecesOn: aChessboard systemRoot.
	shell := super showOn: chessboard.
	shell setRoot: aChessboard systemRoot.
	^shell
	!

showWithFenString: fenString on: aSystemRoot
	| chessboard shell |

	chessboard := Chessboard newEmptyOn: aSystemRoot.
	shell := self createOn: chessboard.
	shell setRoot: aSystemRoot fenString: fenString.
	shell show;
		renderChessboard.
	^shell!

showWithFenString2: fenString on: aSystemRoot
	| chessboard shell |

	chessboard := Chessboard newEmptyOn: aSystemRoot.
	shell := super showOn: chessboard.
	shell setRoot: aSystemRoot fenString: fenString.
	^shell! !
!ChessGameShell class categoriesForMethods!
resource_Default_view!public!resources-views! !
showOn:!public! !
showWithFenString:on:!public! !
showWithFenString2:on:!public! !
!

