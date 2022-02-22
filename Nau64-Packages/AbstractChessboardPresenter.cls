"Filed out from Dolphin Smallalk"!

ChessAbstractPresenter subclass: #AbstractChessboardPresenter
	instanceVariableNames: 'chessboardImagePresenter mouseTracker'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AbstractChessboardPresenter guid: (GUID fromString: '{4717b72f-27ee-4e6b-9e66-91184e06419c}')!
AbstractChessboardPresenter comment: ''!
!AbstractChessboardPresenter categoriesForClass!Unclassified! !
!AbstractChessboardPresenter methodsFor!

copyPositionAsFenString
	| fenStream |

	fenStream := String new writeStream.
	systemRoot fenSquares do: [:squareCollection | | freeSquares |
		freeSquares := 0.
		squareCollection do: [:square | 
			model 
				pieceAt: square 
				do: [:piece | (freeSquares > 0) 
						ifTrue: [fenStream nextPutAll: freeSquares printString.
							freeSquares := 0].
						fenStream nextPutAll: piece fenString] 
				ifAbsent: [freeSquares := freeSquares + 1].
		].
		(freeSquares > 0) ifTrue: [fenStream nextPutAll: freeSquares printString].
		fenStream nextPut: $/.
	].

	Clipboard current setText: fenStream contents!

createComponents

	super createComponents.

	chessboardImagePresenter := self add: ImagePresenter new name: 'chessboard'.!

createSchematicWiring

	super createSchematicWiring.


	chessboardImagePresenter
		when: #drop: send: #onDropOver: to: self;
		when: #dragOver: send: #onDragOver: to: self;
		when: #leftButtonPressed: send: #movePiece: to: self.!

endTrackingAt: aPoint 

	self subclassResponsibility!

gdiBitmap

	^chessboardImagePresenter value!

graphics

	^chessboardImagePresenter value graphics!

imageModel: aModel

	chessboardImagePresenter model: aModel!

movePiece: aMouseEvent

	self subclassResponsibility!

renderChessboard

	self subclassResponsibility! !
!AbstractChessboardPresenter categoriesForMethods!
copyPositionAsFenString!public! !
createComponents!public! !
createSchematicWiring!public! !
endTrackingAt:!drag & drop!public! !
gdiBitmap!public! !
graphics!public! !
imageModel:!public! !
movePiece:!public! !
renderChessboard!public!rendering-chessboard! !
!

