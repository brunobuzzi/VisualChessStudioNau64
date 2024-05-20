"Filed out from Dolphin Smallalk"!

ChessParserTest subclass: #ChessPgnParserTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChessPgnParserTest guid: (GUID fromString: '{532ffef2-da98-42cb-84dc-ab9c8a704472}')!
ChessPgnParserTest comment: ''!
!ChessPgnParserTest categoriesForClass!Unclassified! !
!ChessPgnParserTest methodsFor!

testParseCompleteSimpleGame
	| string parser game |
	string := '  [Event "Rated Rapid game"] 

[Site "Nau64 Uruguay"]
[Date "2020.12.30"]
[White "Jose Riverol"]
[Black "Bruno Buzzi"]
[Result "0-1"]
1. e4 d5 2. exd5 Qxd5 3. Nc3 Qa5 4. Nf3 Nf6 5. Bc4 Bf5 6. d3 c6 7. O-O e6 8. a3 Nbd7 9. Re1 Bd6 10. h3 O-O-O 11. Bd2 Qc7 12. Ne4 Nxe4 13. dxe4 Bg6 14. Bc3 Ne5 15. Qe2 Nxf3+ 16. Qxf3 Be5 17. Bxe5 Qxe5 18. c3 b5 19. Ba2 Kb7 20. Qe3 Rd6 21. f4 Qh5 22. g4 Qh4 23. f5 exf5 24. exf5 Bxf5 25. gxf5 Rf6 26. Qe7+ Kb6 27. Qe3+ Ka6 28. Rf1 g6 29. Qe7 Qg3+ 30. Kh1 Qxh3+ 31. Kg1 Rxf5 32. Rxf5 Qg3+ 33. Kf1 gxf5 34. Qxf7 Qd3+ 35. Kg2 Qd2+ 36. Kf3 Rd8 37. Qxf5 Rd3+ 38. Kg4 Qg2+ 39. Kh5 Rh3+ 40. Qxh3 Qxh3+ 41. Kg5 h6+ 42. Kg6 h5 43. Bf7 h4 44. a4 Qg2+ 45. Kh5 h3 46. axb5+ Kxb5 47. c4+ Kb4 48. Rxa7 c5 49. Rb7+ Qxb7 0-1'.
	parser := ChessPgnParser newOn: systemRoot pgnString: string.
	parser parse.
	
	self assert: parser numberOfMoves equals: 50.

	game := ChessGame newOn: systemRoot whitePlayer: '' blackPlayer: '' pgnString: string.
	game newPgnExecutor.
self halt.!

testParseGameData
	| string parser |
	string := '  [Event "Rated Rapid game"] 

[Site "Nau64 Uruguay"]
[Date "2020.12.30"]
[White "Jose Riverol"]
[Black "Bruno Buzzi"]
[Result "0-1"]
[UnknowTag "0"]
'.
	parser := ChessPgnParser newOn: systemRoot pgnString: string.
	parser parse.
	self assert: (parser propertyNamed: 'Event') equals: 'Rated Rapid game'.
	self assert: (parser propertyNamed: 'Site') equals: 'Nau64 Uruguay'.
	self assert: (parser propertyNamed: 'Date') equals: '2020.12.30'.
	self assert: (parser propertyNamed: 'White') equals: 'Jose Riverol'.
	self assert: (parser propertyNamed: 'Black') equals: 'Bruno Buzzi'.
	self assert: (parser propertyNamed: 'Result') equals: '0-1'.
	self assert: (parser propertyNamed: 'UnknowTag') equals: '0'.! !
!ChessPgnParserTest categoriesForMethods!
testParseCompleteSimpleGame!public! !
testParseGameData!public! !
!

