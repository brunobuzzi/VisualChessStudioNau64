"Filed out from Dolphin Smallalk"!

Object subclass: #ChessSquareVector
	instanceVariableNames: 'originSquare targetSquare'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessSquareVector guid: (GUID fromString: '{c0586461-fbe1-4ce2-8831-7e79beb4df2a}')!
ChessSquareVector comment: ''!
!ChessSquareVector categoriesForClass!Unclassified! !
!ChessSquareVector methodsFor!

originRankNumber

	^originSquare rankNumber!

originSquare
	^originSquare!

originSquare: anObject
	originSquare := anObject!

originSquareName

	^originSquare name!

printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '[', self originSquareName, ']>>[', self targetSquareName, ']'!

printOriginFile

	^originSquare printFile!

printOriginRank

	^originSquare printRank!

printTargetFile

	^targetSquare printFile!

printTargetRank

	^targetSquare printRank!

setOrigin: originChessSquare target: targetChessSquare

	originSquare := originChessSquare.
	targetSquare := targetChessSquare!

targetRankNumber

	^targetSquare rankNumber!

targetSquare
	^targetSquare!

targetSquare: anObject
	targetSquare := anObject!

targetSquareName

	^targetSquare name! !
!ChessSquareVector categoriesForMethods!
originRankNumber!public! !
originSquare!accessing!private! !
originSquare:!accessing!private! !
originSquareName!public! !
printOn:!public! !
printOriginFile!public! !
printOriginRank!public! !
printTargetFile!public! !
printTargetRank!public! !
setOrigin:target:!private! !
targetRankNumber!public! !
targetSquare!accessing!private! !
targetSquare:!accessing!private! !
targetSquareName!public! !
!

!ChessSquareVector class methodsFor!

icon
	^Icon fromId: 'TypeConverter.ico'!

newFrom: originChessSquare to: targetChessSquare

	^self new setOrigin: originChessSquare target: targetChessSquare!

newFromSquareName: originString toSquareName: targetString
	| originSquare targetSquare | 

	originSquare := ChessSquare squareAt: originString asSymbol.
	targetSquare := ChessSquare squareAt: targetString asSymbol.

	^self newFrom: originSquare to: targetSquare
! !
!ChessSquareVector class categoriesForMethods!
icon!public! !
newFrom:to:!public! !
newFromSquareName:toSquareName:!public! !
!

