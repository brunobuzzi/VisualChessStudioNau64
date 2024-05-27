"Filed out from Dolphin Smallalk"!

Object subclass: #ChessGame
	instanceVariableNames: 'systemRoot dateTime whitePlayer blackPlayer initialFenPosition initialSideToMove pgnString pgnMoves'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessGame guid: (GUID fromString: '{cab5dfb3-cb33-47c8-828c-f22ddfe10c20}')!
ChessGame comment: ''!
!ChessGame categoriesForClass!Unclassified! !
!ChessGame methodsFor!

buildGameFromPgn: aPgnString
	| parser |
	parser := ChessPgnParser newOn: systemRoot pgnString: aPgnString.
	parser buildGameFor: self!

initialFenPosition

	^initialFenPosition ifNil: [self initialFenStringPosition] ifNotNil: [initialFenPosition].!

initialFenStringPosition

	^self class initialFenStringPosition!

initialSideToMove

	^initialSideToMove!

isLastPgnAnnotation: anArray

	^pgnMoves last == anArray!

newFenExecutor
	| fenExecutor parser |

	fenExecutor := ChessFenGameExecutor newOn: self.

	parser := ChessFenParser newOn: systemRoot fenString: initialFenPosition.
	fenExecutor setInitalMoveAndCastleFromFenParser: parser.

	^fenExecutor!

newFenExecutorOn: aChessboard
	| fenExecutor parser |

	fenExecutor := ChessFenGameExecutor newOn: self chessboard: aChessboard.

	parser := ChessFenParser newOn: systemRoot fenString: initialFenPosition.
	fenExecutor setInitalMoveAndCastleFromFenParser: parser.
	parser deployOn: aChessboard.

	^fenExecutor!

newInitialChessboard
	| chessboard |
	chessboard := Chessboard newEmptyOn: systemRoot.
	(ChessFenParser newOn: systemRoot fenString: initialFenPosition) deployOn: chessboard.
	^chessboard
	

	!

newPgnExecutor
	| pgnExecutor parser |

	pgnExecutor := ChessPgnGameExecutor newOn: self.

	parser := ChessPgnParser newOn: systemRoot pgnString: pgnString.
	parser buildGameFor: pgnExecutor.

	^pgnExecutor!

newPgnExecutorOn: aChessboard
	| pgnExecutor parser |

	pgnExecutor := ChessPgnGameExecutor newOn: self chessboard: aChessboard.

	parser := ChessPgnParser newOn: systemRoot pgnString: pgnString.
	parser buildGameFor: pgnExecutor.

	^pgnExecutor!

pgnMovesDo: aBlock

	pgnMoves do: aBlock!

setInitialMoveToBlack
	
	initialSideToMove := #black!

setInitialMoveToWhite
	
	initialSideToMove := #white!

setPgnMoves: anOrderedCollection

	pgnMoves := anOrderedCollection!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString
	| parser |

	dateTime := TimeStamp current.
	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

"	moves := ChessMoveTreeList newOn: self."

	initialSideToMove := #white.

"	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self."

	initialFenPosition := fenString ifNil: [self initialFenStringPosition] ifNotNil: [fenString].
	pgnMoves := OrderedCollection new.
"	parser := ChessFenParser newOn: aSystemRoot fenString: (fenString ifNil: [initialFenPosition]).
	self setOptionFromFenParser: parser."
!

setRoot: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer pgnString: aString
	| parser |

	dateTime := TimeStamp current.
	systemRoot := aSystemRoot.

	whitePlayer := whiteChessPlayer.
	blackPlayer := blackChessPlayer.

	"moves := ChessMoveList newOn: self."
"	moves := ChessMoveTreeList newOn: self."

	initialSideToMove := #white.
"
	whiteCastleStatus := ChessCastleStatus newOn: self.
	blackCastleStatus := ChessCastleStatus newOn: self."

	initialFenPosition := self initialFenStringPosition.
	pgnMoves := OrderedCollection new.
	pgnString := aString.
	
"	parser := ChessPgnParser newOn: aSystemRoot pgnString: pgnString.
	parser buildPgnListFor: self"
!

systemRoot
	^systemRoot! !
!ChessGame categoriesForMethods!
buildGameFromPgn:!parser-pgn!public! !
initialFenPosition!executors!public! !
initialFenStringPosition!private! !
initialSideToMove!public! !
isLastPgnAnnotation:!moves!public! !
newFenExecutor!executors!public! !
newFenExecutorOn:!executors!public! !
newInitialChessboard!public! !
newPgnExecutor!executors!public! !
newPgnExecutorOn:!executors!public! !
pgnMovesDo:!moves!public! !
setInitialMoveToBlack!public! !
setInitialMoveToWhite!public! !
setPgnMoves:!parser-pgn!public! !
setRoot:whitePlayer:blackPlayer:fenString:!private! !
setRoot:whitePlayer:blackPlayer:pgnString:!private! !
systemRoot!parser-pgn!public! !
!

!ChessGame class methodsFor!

icon

	^Icon fromId: 'Interactor.ico'!

initialFenStringPosition
	^'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR/ w - - 1 20'!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer

	^self new setRoot:  aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: self initialFenStringPosition!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString

	^self new setRoot:  aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer fenString: fenString!

newOn: aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer pgnString: pgnString

	^self new setRoot:  aSystemRoot whitePlayer: whiteChessPlayer blackPlayer: blackChessPlayer pgnString: pgnString! !
!ChessGame class categoriesForMethods!
icon!public! !
initialFenStringPosition!private! !
newOn:whitePlayer:blackPlayer:!public! !
newOn:whitePlayer:blackPlayer:fenString:!public! !
newOn:whitePlayer:blackPlayer:pgnString:!public! !
!

