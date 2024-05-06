"Filed out from Dolphin Smallalk"!

ChessParser subclass: #ChessPgnParser
	instanceVariableNames: 'gameProperties moves'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPgnParser guid: (GUID fromString: '{5b668773-df2d-4d5c-91eb-7033dbd1730e}')!
ChessPgnParser comment: ''!
!ChessPgnParser categoriesForClass!Unclassified! !
!ChessPgnParser methodsFor!

numberOfMoves

	^moves size!

parse

	self parseGameData.
	self parseGameMoves.!

parseGameData
	| isMoveSecttion |
	gameProperties := Dictionary new.
	isMoveSecttion := false.
	[isMoveSecttion not and: [parserStream atEnd not]] whileTrue: [ | propertyName propertyValue currentPosition |
			parserStream upTo: $[.
			parserStream skipWhile: [:ch | ch == Character space].
			propertyName := parserStream upTo: Character space.
			parserStream upTo: $".
			propertyValue := parserStream upTo: $".
			propertyName notEmpty ifTrue: [gameProperties at: propertyName put: propertyValue].
			currentPosition := parserStream position.
			parserStream upTo: $[.
			parserStream atEnd ifTrue: [isMoveSecttion := true].
			parserStream position: currentPosition.
	].
!

parseGameMoves
	moves := OrderedCollection new.
	parserStream next.
	[parserStream atEnd not] whileTrue: 
			[| moveNumber whiteMove blackMove |
			moveNumber := (parserStream upTo: $.) copyWithout: Character lf; copyWithout: Character cr.
			(parserStream peek = Character space) ifTrue: [parserStream upTo: Character space].
			whiteMove := (parserStream upTo: Character space) copyWithout: Character lf; copyWithout: Character cr.
			blackMove := (parserStream upTo: Character space) copyWithout: Character lf; copyWithout: Character cr.
			moves add: (Array with: moveNumber with: whiteMove with: blackMove).
	].

!

propertyNamed: aString

	^gameProperties at: aString ifAbsent: []!

setRoot: aSystemRoot pngString: pngString

	systemRoot := aSystemRoot.
	parserStream := pngString readStream.
	self parse.! !
!ChessPgnParser categoriesForMethods!
numberOfMoves!public! !
parse!public! !
parseGameData!public! !
parseGameMoves!public! !
propertyNamed:!public! !
setRoot:pngString:!private! !
!

!ChessPgnParser class methodsFor!

newOn: aSystemRoot pngString: pngString

	^self new setRoot: aSystemRoot pngString: pngString! !
!ChessPgnParser class categoriesForMethods!
newOn:pngString:!public! !
!

