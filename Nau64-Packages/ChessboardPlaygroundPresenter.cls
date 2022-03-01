"Filed out from Dolphin Smallalk"!

AbstractChessboardPresenter subclass: #ChessboardPlaygroundPresenter
	instanceVariableNames: 'effects'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessboardPlaygroundPresenter guid: (GUID fromString: '{6333664b-2259-457c-909f-633e808ebc83}')!
ChessboardPlaygroundPresenter comment: ''!
!ChessboardPlaygroundPresenter categoriesForClass!Kernel-Objects! !
!ChessboardPlaygroundPresenter methodsFor!

attackedSquaresByBlack

	effects add: (AttackedSquaresBySideEffect newOn: model).
	self renderChessboard.!

attackedSquaresByWhite

	effects add: (AttackedSquaresBySideEffect newOn: model).
	self renderChessboard.!

clearEffects

	effects := OrderedCollection new.
	self renderChessboard.!

dropBlackBishop
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Bishop isBlack: true tracker: tracker.
	tracker startTracking: dropper.!

dropBlackKing
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: King isBlack: true tracker: tracker.
	tracker startTracking: dropper.!

dropBlackKnight
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Knight isBlack: true tracker: tracker.
	tracker startTracking: dropper.!

dropBlackPawn
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Pawn isBlack: true tracker: tracker.
	tracker startTracking: dropper.!

dropBlackQueen
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Queen isBlack: true tracker: tracker.
	tracker startTracking: dropper.!

dropBlackRook
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Rook isBlack: true tracker: tracker.
	tracker startTracking: dropper.!

dropWhiteBishop
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Bishop isBlack: false tracker: tracker.
	tracker startTracking: dropper.!

dropWhiteKing
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: King isBlack: false tracker: tracker.
	tracker startTracking: dropper.!

dropWhiteKnight
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Knight isBlack: false tracker: tracker.
	tracker startTracking: dropper.!

dropWhitePawn
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Pawn isBlack: false tracker: tracker.
	tracker startTracking: dropper.!

dropWhiteQueen
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Queen isBlack: false tracker: tracker.
	tracker startTracking: dropper.!

dropWhiteRook
	| dropper tracker |

	tracker := MouseTracker forPresenter: View active startingAt: 0@0.
	dropper := ChessPieceDroper newOn: self chessboard: model pieceClass: Rook isBlack: false tracker: tracker.
	tracker startTracking: dropper.!

endTrackingAt: aPoint 
	| originSquare targetSquare piece |

	originSquare := model squareAt: mouseTracker startPoint.
	targetSquare := model squareAt: (mouseTracker sumStartLocalPointTo: aPoint).
	(originSquare isNil or: [targetSquare isNil]) ifTrue: [^nil].

	piece := model pieceAt: originSquare.

	(piece isValidMoveFromCoordinate: originSquare coordinate to: targetSquare coordinate) 
	ifFalse: [^MessageBubble notify: ('Invalid move from [',  originSquare coordinate, '] to [',  targetSquare coordinate, ']') caption: 'Nau64' ].

	model movePieceFromCoordiante: originSquare coordinate to: targetSquare coordinate.

	self renderChessboard.
!

newChessboard

	effects := OrderedCollection new.
	self model: (Chessboard newWithAllPiecesOn: systemRoot).

	self renderChessboard.!

newChessboardFromFEN
	| fenString |

	self newEmptyChessboard.
	fenString := Prompter prompt: 'Enter PEM String' caption: 'Chess Studio'.
	(ChessFenParser newOn: systemRoot fenString: fenString) deployOn: model.
	self renderChessboard.!

newEmptyChessboard
	effects := OrderedCollection new.
	self model: (Chessboard newEmptyOn: systemRoot).
	self renderChessboard!

onDropOver: aDragDropSession 
	"Private - The drag operation described by the <DragDropSession>, session, would like 
	to do a drop over the receiver's class pane."
	"Implementation Note: If the drop fails then we must set the operation to nil in order that 
	the DD session can detect the failure (as this is an event handler the return value is ignored)."
	| piezaNueva droppedPiece escaqueDestino |

	droppedPiece := aDragDropSession suggestedSource.
	escaqueDestino := model squareAt: (aDragDropSession dragPoint x) @  (aDragDropSession dragPoint y).
	escaqueDestino isNil ifTrue: [^nil].
self halt.
"	piezaNueva := piezaSoltada new.
	piezaNueva
		bando: bandosPresenter selection;
		tablero: model;
		crearMotorDeMovimiento.
	escaqueDestino ponerPieza: piezaNueva."
	self renderChessboard.
	"piezasPresenter model: (ListModel on: model piezas)."!

onViewOpened
	super onViewOpened.
	effects := OrderedCollection new.
!

renderChessboard
	| gdiBitmap |
	gdiBitmap := GdiplusBitmap extent: DesktopView current extent.
	model drawOn: gdiBitmap isDisplayCoordinatesEnabled: isDisplayCoordinatesEnabled.
	effects do: [:chessboardEffect | chessboardEffect drawOn: gdiBitmap].
	self imageModel: gdiBitmap asValue!

showAttackedSquaresBySide
	effects add: (AttackedSquaresBySideEffect newOn: model).
	self renderChessboard.!

showForksForBlack

	effects add: (ChessForkEffect newOn: model) setBlack.
	self renderChessboard.!

showForksForWhite

	effects add: (ChessForkEffect newOn: model).
	self renderChessboard.!

showPartialPinsForBlack

	effects add: (ChessPartialPinEffect newOn: model) setBlack.
	self renderChessboard.!

showPartialPinsForWhite

	effects add: (ChessPartialPinEffect newOn: model).
	self renderChessboard.!

showPinsForBlack

	effects add: (ChessAbsolutePinEffect newOn: model) setBlack.
	self renderChessboard.!

showPinsForWhite

	effects add: (ChessAbsolutePinEffect newOn: model).
	self renderChessboard.!

toggleFourChessChunks

	effects add: (ChessFourChunkEffect newOn: model).
	self renderChessboard.!

toogleCenterChunk

	effects add: (ChessCenterChunkEffect newOn: model).
	self renderChessboard.! !
!ChessboardPlaygroundPresenter categoriesForMethods!
attackedSquaresByBlack!public!rendering-effects! !
attackedSquaresByWhite!public!rendering-effects! !
clearEffects!public!rendering-effects! !
dropBlackBishop!drop pieces!public! !
dropBlackKing!drop pieces!public! !
dropBlackKnight!drop pieces!public! !
dropBlackPawn!drop pieces!public! !
dropBlackQueen!drop pieces!public! !
dropBlackRook!drop pieces!public! !
dropWhiteBishop!drop pieces!public! !
dropWhiteKing!drop pieces!public! !
dropWhiteKnight!drop pieces!public! !
dropWhitePawn!drop pieces!public! !
dropWhiteQueen!drop pieces!public! !
dropWhiteRook!drop pieces!public! !
endTrackingAt:!drag & drop!public! !
newChessboard!public!rendering-effects! !
newChessboardFromFEN!public! !
newEmptyChessboard!public!rendering-effects! !
onDropOver:!drag & drop!public! !
onViewOpened!public! !
renderChessboard!public!rendering-chessboard! !
showAttackedSquaresBySide!public!rendering-effects! !
showForksForBlack!public! !
showForksForWhite!public! !
showPartialPinsForBlack!public! !
showPartialPinsForWhite!public! !
showPinsForBlack!public! !
showPinsForWhite!public! !
toggleFourChessChunks!public! !
toogleCenterChunk!public! !
!

!ChessboardPlaygroundPresenter class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ContainerView) 34 15 nil nil 34 2 8 1409286144 131073 416 nil 327686 ##(Smalltalk.Color) #face3d 328198 ##(Smalltalk.Point) 1315 1215 5 nil nil nil 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() false 170 192 592 nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 514 11519 21 514 1315 1215 416 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 22 0 0 10 0 0 0 16 25 0 0 105 2 0 0] 34 1 410 ##(Smalltalk.ContainerView) 34 15 nil 416 34 2 8 1140850688 131073 832 nil nil nil 5 nil nil nil 832 788230 ##(Smalltalk.BorderLayout) 1 1 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 928 nil nil nil 5 nil nil nil 928 546 170 176 592 false 170 192 34 2 410 ##(Smalltalk.Toolbar) 34 25 nil 928 34 2 8 1409288972 131073 1056 nil 482 #default nil 5 nil nil nil 1056 1120 8 1895085328 170 192 592 170 192 34 8 25195 1115206 1 ##(Smalltalk.ToolbarIconButton) 1056 1 1180998 4 ##(Smalltalk.CommandDescription) #reverseChessboard 8 'Reverse Chessboard' 1 1 263494 3 ##(Smalltalk.Icon) nil true 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'Boolean.ico' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' nil 25195 25193 1202 1056 1 1234 #toggleCoordinates 8 'Toggle Coordinates' 1 1 1282 nil true 1328 8 'TextEdit.ico' 1376 25193 25191 1202 1056 1 1234 #newEmptyChessboard 8 'New Empty Chessboard' 1 1 1282 nil true 1328 8 'Ajedrez\wwhitecellw.ico' nil 25191 25189 1202 1056 1 1234 #newChessboard 8 'New Chessboard' 1 1 1282 nil true 1328 8 'Ajedrez\chess_icon-icons.com_65163.ico' nil 25189 34 5 1568 1488 1049158 1 ##(Smalltalk.ToolbarSeparator) 1056 1 1408 1216 nil nil 1 nil nil nil nil 656198 1 ##(Smalltalk.FlowLayout) 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 1056 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 8 #() 514 193 193 nil 27 8 'chessboardCommands' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 51 928 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 25 0 0 0] 34 1 1056 1888 nil 27 nil 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 2080 nil nil nil 5 nil nil nil 2080 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1265 51 514 51 1165 2080 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 120 2 0 0 25 0 0 0 145 2 0 0 95 2 0 0] 34 1 410 ##(Smalltalk.Toolbar) 34 25 nil 2080 34 2 8 1409289100 131137 2352 nil 1120 nil 517 nil nil nil 2352 1120 8 1895085328 170 192 592 170 192 34 8 25227 1202 2352 1 1234 #toogleCenterChunk 8 'Toogle Center Chunk' 1 1 1282 nil true 1328 8 'Icon.ico' 1376 25227 25225 1202 2352 1 1234 #toggleFourChessChunks 8 'Toggle 4 Chess Chunks' 1 1 1282 nil true 1328 8 'Ajedrez\squeare.ico' nil 25225 25223 1202 2352 1 1234 #showAttackedSquaresBySide 8 'Show Attacked Squares by Side' 1 1 1282 nil true 1328 8 'Ajedrez\wwhitecellb.ico' nil 25223 25221 1202 2352 1 1234 #clearEffects 8 'Clear Effects' 1 1 1282 nil true 1328 8 'DocumentShell.ico' 1376 25221 34 6 2720 1666 2352 1 2640 1666 2352 1 2560 2480 nil nil 1 nil nil nil nil 1698 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 51 1165 2352 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 25 0 0 0 70 2 0 0] 8 #() 1888 nil 27 1888 nil 27 410 ##(Smalltalk.ContainerView) 34 15 nil 832 34 2 8 1140850688 131073 3024 nil nil nil 5 nil nil nil 3024 546 170 176 592 false 170 192 592 nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 51 514 51 1165 3024 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 25 0 0 0 25 0 0 0 95 2 0 0] 34 1 410 ##(Smalltalk.Toolbar) 34 25 nil 3024 34 2 8 1409289100 131137 3296 nil 1120 nil 517 nil nil nil 3296 1120 8 1895085328 170 192 592 170 192 34 24 25219 1202 3296 1 1234 #dropWhitePawn 8 'Drop White Pawn' 1 1 1282 nil true 1328 8 'Ajedrez\bpw.ico' nil 25219 25203 1202 3296 1 1234 #dropBlackKnight 8 'Drop Black Knight' 1 1 1282 nil true 1328 8 'Ajedrez\bnw.ico' nil 25203 25213 1202 3296 1 1234 #dropWhiteRook 8 'Drop White Rook' 1 1 1282 nil true 1328 8 'Ajedrez\brw.ico' nil 25213 25197 1202 3296 1 1234 #dropBlackKing 8 'Drop Black King' 1 1 1282 nil true 1328 8 'Ajedrez\bkw.ico' nil 25197 25207 1202 3296 1 1234 #dropBlackPawn 8 'Drop Black Pawn' 1 1 1282 nil true 1328 8 'Ajedrez\bpw.ico' nil 25207 25217 1202 3296 1 1234 #dropWhiteBishop 8 'Drop White Bishop' 1 1 1282 nil true 1328 8 'Ajedrez\bbw.ico' nil 25217 25201 1202 3296 1 1234 #dropBlackRook 8 'Drop Black Rook' 1 1 1282 nil true 1328 8 'Ajedrez\brw.ico' nil 25201 25211 1202 3296 1 1234 #dropWhiteQueen 8 'Drop White Queen' 1 1 1282 nil true 1328 8 'Ajedrez\bqw.ico' nil 25211 25205 1202 3296 1 1234 #dropBlackBishop 8 'Drop Black Bishop' 1 1 1282 nil true 1328 8 'Ajedrez\bbw.ico' nil 25205 25215 1202 3296 1 1234 #dropWhiteKnight 8 'Drop White Knight' 1 1 1282 nil true 1328 8 'Ajedrez\bnw.ico' nil 25215 25199 1202 3296 1 1234 #dropBlackQueen 8 'Drop Black Queen' 1 1 1282 nil true 1328 8 'Ajedrez\bqw.ico' nil 25199 25209 1202 3296 1 1234 #dropWhiteKing 8 'Drop White King' 1 1 1282 nil true 1328 8 'Ajedrez\bkw.ico' nil 25209 34 13 3664 4224 3904 3504 4064 3744 1666 3296 1 4304 3984 3584 4144 3824 3424 nil nil 1 nil nil nil nil 1698 1 1 1 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 51 1165 3296 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 25 0 0 0 70 2 0 0] 8 #() 1888 nil 27 1888 nil 27 410 ##(Smalltalk.GdiplusImageView) 34 28 nil 832 34 2 8 1140850944 1 4592 721990 2 ##(Smalltalk.ValueHolder) nil false 1310726 ##(Smalltalk.EqualitySearchPolicy) nil 496 nil 5 nil nil nil 4592 nil nil 852486 ##(Smalltalk.NullConverter) nil nil nil nil #normal 1 590342 ##(Smalltalk.Rectangle) 514 1 1 514 1 1 nil nil #none nil nil nil nil nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 51 51 514 1215 1165 4592 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 25 0 0 0 25 0 0 0 120 2 0 0 95 2 0 0] 8 #() 1888 nil 29 170 192 34 2 4592 8 'chessboard' nil 626 138 144 34 1 690 #createAt:extent: 34 2 514 1 1 514 1315 1215 832 770 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 145 2 0 0 95 2 0 0] 34 4 928 4592 3024 2080 1888 nil 27 1888 nil 27 )! !
!ChessboardPlaygroundPresenter class categoriesForMethods!
resource_Default_view!public!resources-views! !
!

