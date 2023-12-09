"Filed out from Dolphin Smallalk"!

ChessVector subclass: #ChessSquareScope
	instanceVariableNames: 'piece sourceSquare'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSquareScope guid: (GUID fromString: '{f0872d83-3d65-47bc-94e3-271b20bbaf08}')!
ChessSquareScope comment: ''!
!ChessSquareScope categoriesForClass!Unclassified! !
!ChessSquareScope methodsFor!

generateKingSquareScope
	| scopeDictionary |

	scopeDictionary := SquaresDictionary on: piece.

	piece orientationsDo: [:chessOrientationVector | | scopeCollection |
		scopeCollection := OrderedCollection new.
		sourceSquare kingSquaresWith: chessOrientationVector do: [:eachSquare | scopeCollection add: eachSquare].
		scopeDictionary atOrientation: chessOrientationVector vectorName put: scopeCollection.
	].

	^scopeDictionary
	!

generateKnightSquareScope
	| scopeDictionary |

	scopeDictionary := SquaresDictionary on: piece.

	piece orientationsDo: [:chessOrientationVector | | scopeCollection |
		scopeCollection := OrderedCollection new.
		sourceSquare knightSquaresWith: chessOrientationVector do: [:eachSquare | scopeCollection add: eachSquare].
		scopeDictionary atOrientation: chessOrientationVector vectorName put: scopeCollection.
	].

	^scopeDictionary
	!

generatePawnSquaresScope
	| scopeDictionary |

	scopeDictionary := SquaresDictionary on: piece.

	piece orientationsDo: [:chessOrientationVector | | scopeCollection |
		scopeCollection := OrderedCollection new.
		piece isWhite 
		ifTrue: [sourceSquare whitePawnSquaresWith: chessOrientationVector do: [:eachSquare | scopeCollection add: eachSquare]] 
		ifFalse: [sourceSquare blackPawnSquaresWith: chessOrientationVector do: [:eachSquare | scopeCollection add: eachSquare]].
		scopeDictionary atOrientation: chessOrientationVector vectorName put: scopeCollection.
	].

	^scopeDictionary
	!

generateSlidingPieceSquareScope
	| scopeDictionary |

	scopeDictionary := SquaresDictionary on: piece.

	piece orientationsDo: [:chessOrientationVector | | scopeCollection |
		scopeCollection := OrderedCollection new.
		sourceSquare slidingSquaresWith: chessOrientationVector do: [:eachSquare | scopeCollection add: eachSquare].
		scopeDictionary atOrientation: chessOrientationVector vectorName put: scopeCollection.
	].

	^scopeDictionary
	!

generateSquaresScope

	^piece generateSquaresScopeFrom: self!

setPiece: aChessPiece

	piece := aChessPiece.

	sourceSquare := aChessPiece currentChessSquare.! !
!ChessSquareScope categoriesForMethods!
generateKingSquareScope!public! !
generateKnightSquareScope!public! !
generatePawnSquaresScope!public! !
generateSlidingPieceSquareScope!public! !
generateSquaresScope!public! !
setPiece:!private! !
!

!ChessSquareScope class methodsFor!

icon

	^TextTileIcon text: (Character codePoint: 9641) asUtf16String fontName: 'Malgun Gothic'!

newOn: aChessPiece

	^self new setPiece: aChessPiece! !
!ChessSquareScope class categoriesForMethods!
icon!public! !
newOn:!public! !
!

