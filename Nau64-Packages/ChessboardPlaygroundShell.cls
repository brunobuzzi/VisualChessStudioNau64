"Filed out from Dolphin Smallalk"!

AbstractChessboardShell subclass: #ChessboardPlaygroundShell
	instanceVariableNames: 'chessboardPresenter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessboardPlaygroundShell guid: (GUID fromString: '{c18f7bbc-77f4-4a5e-99f1-09d20bd3a9f7}')!
ChessboardPlaygroundShell comment: ''!
!ChessboardPlaygroundShell categoriesForClass!Unclassified! !
!ChessboardPlaygroundShell methodsFor!

clearEffects

	chessboardPresenter clearEffects.
	view invalidate.!

copyPositionAsFenString

	chessboardPresenter copyPositionAsFenString!

createComponents
	super createComponents.
	chessboardPresenter := self add: (ChessboardPlaygroundPresenter newOn: systemRoot)
				name: 'chessboard'!

dropBlackBishop

	chessboardPresenter dropBlackBishop!

dropBlackKing

	chessboardPresenter dropBlackKing!

dropBlackKnight

	chessboardPresenter dropBlackKnight!

dropBlackPawn

	chessboardPresenter dropBlackPawn!

dropBlackQueen

	chessboardPresenter dropBlackQueen!

dropBlackRook

	chessboardPresenter dropBlackRook!

dropWhiteBishop

	chessboardPresenter dropWhiteBishop!

dropWhiteKing

	chessboardPresenter dropWhiteKing!

dropWhiteKnight

	chessboardPresenter dropWhiteKnight!

dropWhitePawn

	chessboardPresenter dropWhitePawn!

dropWhiteQueen

	chessboardPresenter dropWhiteQueen!

dropWhiteRook

	chessboardPresenter dropWhiteRook!

model: anObject

	super model: anObject.

	chessboardPresenter model: anObject!

newChessboard

	chessboardPresenter newChessboard!

newChessboardFromFEN

	chessboardPresenter newChessboardFromFEN!

newEmptyChessboard

	chessboardPresenter newEmptyChessboard!

queryCommand: aCommandQuery
	| cmd |

	cmd := aCommandQuery commandSymbol.

	(cmd == #toggleCoordinates) ifTrue: [aCommandQuery isEnabled: true. ^true].

	(cmd == #reverseChessboard) ifTrue: [aCommandQuery isEnabled: true. ^true].
	
	^super queryCommand: aCommandQuery!

renderChessboard

	chessboardPresenter renderChessboard!

reverseChessboard

	^chessboardPresenter reverseChessboard!

setRoot: aSystemRoot

	systemRoot := aSystemRoot.
	chessboardPresenter setRoot: aSystemRoot.!

showAttackedSquaresBySide
	chessboardPresenter showAttackedSquaresBySide!

showForksForBlack
	chessboardPresenter showForksForBlack!

showForksForWhite
	chessboardPresenter showForksForWhite!

showPartialPinsForBlack
	chessboardPresenter showPartialPinsForBlack!

showPartialPinsForWhite
	chessboardPresenter showPartialPinsForWhite!

showPinsForBlack
	chessboardPresenter showPinsForBlack!

showPinsForWhite
	chessboardPresenter showPinsForWhite!

toggleCoordinates

	^chessboardPresenter toggleCoordinates!

toggleFourChessChunks

	chessboardPresenter toggleFourChessChunks!

toogleCenterChunk

	chessboardPresenter toogleCenterChunk! !
!ChessboardPlaygroundShell categoriesForMethods!
clearEffects!public! !
copyPositionAsFenString!public! !
createComponents!public! !
dropBlackBishop!public! !
dropBlackKing!public! !
dropBlackKnight!public! !
dropBlackPawn!public! !
dropBlackQueen!public! !
dropBlackRook!public! !
dropWhiteBishop!public! !
dropWhiteKing!public! !
dropWhiteKnight!public! !
dropWhitePawn!public! !
dropWhiteQueen!public! !
dropWhiteRook!public! !
model:!public! !
newChessboard!public! !
newChessboardFromFEN!public! !
newEmptyChessboard!public! !
queryCommand:!public! !
renderChessboard!public! !
reverseChessboard!public! !
setRoot:!private! !
showAttackedSquaresBySide!public! !
showForksForBlack!public! !
showForksForWhite!public! !
showPartialPinsForBlack!public! !
showPartialPinsForWhite!public! !
showPinsForBlack!public! !
showPinsForWhite!public! !
toggleCoordinates!public! !
toggleFourChessChunks!public! !
toogleCenterChunk!public! !
!

!ChessboardPlaygroundShell class methodsFor!

defaultModel
	^Chessboard newWithAllPiecesOn: (Smalltalk at: #SystemRoot)!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ShellView) 34 27 nil nil 8 #(13565952 65536) 416 nil 327686 ##(Smalltalk.Color) #default nil 549 nil nil nil 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() false 170 192 34 2 410 ##(Smalltalk.ReferenceView) 34 14 nil 416 34 2 8 1140850688 131073 592 nil 480 nil 7 nil nil nil 592 1180230 1 ##(Smalltalk.ResourceIdentifier) ##(Smalltalk.ChessboardPlaygroundPresenter) #resource_Default_view nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 328198 ##(Smalltalk.Point) 1 1 802 1679 1273 592 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 71 3 0 0 124 2 0 0] 544 802 193 193 nil 27 8 'chessboard' nil 461638 4 ##(Smalltalk.MenuBar) nil true 34 3 265030 4 ##(Smalltalk.Menu) nil true 34 1 984134 2 ##(Smalltalk.CommandMenuItem) 1 1180998 4 ##(Smalltalk.CommandDescription) #exit 8 'Exit' 1 1 nil nil nil 8 'File' nil 134217729 nil nil 24695 nil nil 978 nil true 34 8 1026 1 1058 #newChessboard 8 'New Chessboard' 1 1 nil nil nil 1026 1 1058 #newEmptyChessboard 8 'New Empty Chessboard' 1 1 nil nil nil 983366 1 ##(Smalltalk.DividerMenuItem) 4097 1026 1 1058 #newChessboardFromFEN 8 'New Chessboard fom FEN' 1 1 nil nil nil 1026 1 1058 #copyPositionAsFenString 8 'Copy Position as FEN String' 1 1 nil nil nil 1250 4097 1026 1 1058 #toggleCoordinates 8 'Toggle Coordinates' 1 1 nil nil nil 1026 1 1058 #reverseChessboard 8 'Reverse Chessboard' 1 1 nil nil nil 8 'Chessboard' nil 134217729 nil nil 24709 nil nil 978 nil true 34 9 1026 1 1058 #showAttackedSquaresBySide 8 'Attacked Squares by Side' 1 1 nil nil nil 1250 4097 1026 1 1058 #toggleFourChessChunks 8 'Toggle 4 Chess Chunks' 1 1 nil nil nil 1026 1 1058 #toogleCenterChunk 8 'Toogle Center Chunk' 1 1 nil nil nil 1250 4097 978 nil true 34 2 1026 1 1058 #showForksForWhite 8 'Show Forks for White' 1 1 nil nil nil 1026 1 1058 #showForksForBlack 8 'Show Forks for Black' 1 1 nil nil nil 8 'Forks' nil 134217729 nil nil 24721 nil nil 978 nil true 34 2 978 nil true 34 2 1026 1 1058 #showPinsForWhite 8 'Show Pins for White' 1 1 nil nil nil 1026 1 1058 #showPinsForBlack 8 'Show Pins for Black' 1 1 nil nil nil 8 'Absolute Pin' nil 134217729 nil nil 24727 nil nil 978 nil true 34 2 1026 1 1058 #showPartialPinsForWhite 8 'Show Pins for White' 1 1 nil nil nil 1026 1 1058 #showPartialPinsForBlack 8 'Show Pins for Black' 1 1 nil nil nil 8 'Partial Pin' nil 134217729 nil nil 24733 nil nil 8 'Pins' nil 134217729 nil nil 24735 nil nil 1250 4097 1026 1 1058 #clearEffects 8 'Clear Effects' 1 1 nil nil nil 8 'Effects' nil 134217729 nil nil 24739 nil nil 8 '' nil 134217729 nil nil nil nil nil nil nil nil 1 nil nil nil nil 1 nil nil 690 138 144 34 2 754 #createAt:extent: 34 2 802 11519 21 802 1711 1391 416 754 #text: 34 1 8 'Chessboard Shell' 416 850 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 22 0 0 10 0 0 0 214 25 0 0 193 2 0 0] 34 1 592 896 nil 27)!

showOn: aChessboard on: aSystemRoot
	| shell |

	shell := self showOn: aChessboard.
	shell setRoot: aSystemRoot.
	^shell
	!

showWithFenString: fenString on: aSystemRoot
	| chessboard shell |

	chessboard := Chessboard newEmptyOn: aSystemRoot.
	(ChessFenParser newOn: aSystemRoot fenString: fenString) deployOn: chessboard.
	shell := self showOn: chessboard.
	shell setRoot: aSystemRoot.
	^shell
	! !
!ChessboardPlaygroundShell class categoriesForMethods!
defaultModel!public! !
resource_Default_view!public!resources-views! !
showOn:on:!public! !
showWithFenString:on:!public! !
!

