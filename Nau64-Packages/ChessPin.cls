"Filed out from Dolphin Smallalk"!

ChessTacticInstance subclass: #ChessPin
	instanceVariableNames: 'controlPiece pinnedPiece targetPiece orientation'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPin guid: (GUID fromString: '{7f8500cb-17f3-4ec9-9797-a3c3fc6594bf}')!
ChessPin comment: ''!
!ChessPin categoriesForClass!Unclassified! !
!ChessPin methodsFor!

controlPieceIs: aChessPiece

	^controlPiece == aChessPiece!

isAbsolute

	^targetPiece isKing!

orientation

	^orientation!

orientationIs: aSymbol

	^orientation == aSymbol!

pinnedPieceIs: aChessPiece

	^pinnedPiece == aChessPiece!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[',controlPiece pgnString.
	controlPiece printCurrentSquareOn: aStream.
	aStream nextPutAll: '>', pinnedPiece pgnString.
	pinnedPiece printCurrentSquareOn: aStream.
	aStream nextPutAll: '>',  targetPiece pgnString.
	targetPiece printCurrentSquareOn: aStream.
	aStream nextPutAll: ']'!

setControl: controlChessPiece pinned: pinnedChessPiece target: targetChessPiece orientation: orientationName

	controlPiece := controlChessPiece.
	pinnedPiece := pinnedChessPiece.
	targetPiece := targetChessPiece.
	orientation := orientationName

	!

targetPieceIs: aChessPiece

	^targetPiece == aChessPiece! !
!ChessPin categoriesForMethods!
controlPieceIs:!public!testing! !
isAbsolute!public!testing! !
orientation!public!testing! !
orientationIs:!public!testing! !
pinnedPieceIs:!public!testing! !
printOn:!public! !
setControl:pinned:target:orientation:!private! !
targetPieceIs:!public!testing! !
!

!ChessPin class methodsFor!

newOnControl: controlPiece pinned: pinnedPiece target: targetPiece orientation: orientationName

	^self new setControl: controlPiece pinned: pinnedPiece target: targetPiece orientation: orientationName! !
!ChessPin class categoriesForMethods!
newOnControl:pinned:target:orientation:!public! !
!

