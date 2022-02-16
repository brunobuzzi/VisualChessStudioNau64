"Filed out from Dolphin Smallalk"!

Object subclass: #ChessBoardHash
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessBoardHash guid: (GUID fromString: '{7580d778-1f18-408a-be2a-63f7f0dcd9ca}')!
ChessBoardHash comment: 'Each Match has collection of ChessBoardHash equal to the number of moves.

Each ChessBoardHash is a collection of 64 hashes one per ChessSquare, where each hash is a integer of 4 positions from [1100 to 8815]
Position 1 - File (1 to 8)
Position 2 - Rank (1 to 8)
Position 3 - White or Black (0 Black Piece, 1 White Piece)
Position 4 - Piece (0 King, 1 Queen, 2 Rook, 3 Knight, 4 Bishop, 5 Pawn)
For example:
1114 , stand for:
1 - A
1 - 1
1 - White Piece
4 - Bishop

8601 , stand for:
8 - H
6 - 6
0 - Black Piece
1 - Bishop
'!
!ChessBoardHash categoriesForClass!Kernel-Objects! !
!ChessBoardHash class methodsFor!

icon

	^Symbol icon! !
!ChessBoardHash class categoriesForMethods!
icon!public! !
!

