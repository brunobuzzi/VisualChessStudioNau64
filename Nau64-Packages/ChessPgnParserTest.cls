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
	| string parser game executor |
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
	executor := game newPgnExecutor.
	self assert: (executor includesPgnMove: 'e4').
	executor playAllMoves.
	executor chessboardDo: [:board | self assert: (board printFenStringForExecutor: executor) = '8/1q3B2/8/2p4K/1kP5/7p/1P6/8/ w - - -'].


!

testParseCompleteSimpleGame01
	| string parser game executor |
	string := '  [Event "Rated Rapid game"] 

[Site "X"]
[Date "2020.12.30"]
[White "Jumanov E"]
[Black "Abdusattorov N"]
[Result "1-0"]
1. Nf3 Nf6 2. c4 g6 3. Nc3 d5 4. cxd5 Nxd5 5. g3 Bg7 6. Nxd5 Qxd5 7. Bg2 O-O 8. O-O Nc6 9. d3 Qd8 10. a3 e5 11. Bg5 Qd6 12. Qc2 Bg4 13. Be3 Rfe8 14. Rac1 Rac8 15. Rfe1 Ne7 16. Ng5 Nd5 17. Qb3 c6 18. Bxa7 Qe7 19. h4 h6 20. Bc5 Qd7 21. Ne4 b6 22. Bb4 Be6 23. Qa4 Red8 24. Bd2 f5 25. Nc3 Ne7 26. Red1 Kh7 27. Be3 Rb8 28. b4 Ra8 29. Qc2 Rxa3 30. Bxb6 Rb8 31. Bc5 Nd5 32. Nxd5 cxd5 33. Ra1 Raa8 34. Rxa8 Rxa8 35. d4 f4 36. dxe5 fxg3 37. fxg3 Bxe5 38. h5 Qf7 39. hxg6+ Qxg6 40. Qxg6+ Kxg6 41. Bxd5 Bxd5 42. Rxd5 Bxg3 43. Kg2 Bf4 44. b5 Ra2 45. Kf3 Bh2 46. b6 Rb2 47. Be3 Rb4 48. Rd8 Rb5 49. Rh8 h5 50. Kg2 Be5 51. Rh6+ Kf5 52. Rxh5+ Ke4 53. Bf2 Rb2 54. Rh4+ Kd5 55. e4+ Kc4 56. Kf3 Rb3+ 57. Kg4 Rb5 58. Rh6 Bc3 59. Rc6+ Kd3 60. Kf3 Rb1 61. Rd6+ Kc4 62. Rd7 Kb5 63. Rc7 Ba5 64. Kg4 Rb2 65. Bd4 Rb4 66. Rd7 Kc6 67. Rd8 Bxb6 68. Bxb6 Rxe4+ 69. Kf3 Re7 70. Be3 Kc7 71. Ra8 Re6 72. Ke2 Kc6 73. Kd3 Rd6+ 74. Kc4 Rd1 75. Ra6+ Kb7 76. Rf6 Re1 77. Bc5 Rc1+ 78. Kb5 Rb1+ 79. Bb4 Rc1 80. Bc5 Rb1+ 81. Kc4 Rh1 82. Rb6+ Kc7 83. Ra6 Kb7 84. Re6 Rd1 85. Kb5 Rb1+ 86. Bb4 Rc1 87. Ra6 Rc2 88. Ra1 Rh2 89. Bc5 Rb2+ 90. Kc4 Rh2 91. Ra7+ Kc6 92. Ra6+ Kb7 93. Rb6+ Kc7 94. Rg6 Rd2 95. Bd4 Kb7 96. Kd5 Rc2 97. Rb6+ Kc7 98. Ra6 Kd7 99. Rg6 Re2 100. Rd6+ Ke7 101. Rg6 Kd7 102. Rh6 Rc2 103. Rd6+ Kc7 104. Rg6 Kb7 105. Bc5 Rd2+ 106. Ke5 Rd1 107. Rg7+ Ka6 108. Bd4 Rc1 109. Kd5 Rc8 110. Ra7+ Kb5 111. Rb7+ Ka6 112. Rb6+ Ka5 113. Bc5 Rd8+ 114. Kc4 Rd1 115. Rb2 Rc1+ 116. Kd5 Ka4 117. Rb4+ Ka5 118. Kc6 Rc3 119. Rb8 Ka4 120. Rb7 Rc2 121. Kd5 Rd2+ 122. Bd4 Rc2 123. Ke4 Ka5 124. Rb6 Rc4 125. Rb2 Rc1 126. Kd5 Ka4 127. Bc5 Ka5 128. Kc6 Rc4 129. Rb3 Rg4 130. Ra3+ Ra4 131. Rd3 Rg4 132. Kd5 Kb5 133. Rb3+ Ka4 134. Rb2 Rh4 135. Bd4 Ka3 136. Rb7 Ka2 137. Kc4 Rg4 138. Rb2+ Ka3 139. Rb1 Rg2 140. Rb7 1-0'.
	parser := ChessPgnParser newOn: systemRoot pgnString: string.

	parser parse.
	
	self assert: parser numberOfMoves equals: 140.

	game := ChessGame newOn: systemRoot whitePlayer: '' blackPlayer: '' pgnString: string.
	executor := game newPgnExecutor.
	self assert: (executor includesPgnMove: 'e4').
	executor playAllMoves.
	executor chessboardDo: [:board | self assert: (board printFenStringForExecutor: executor) = '8/1R6/8/8/2KB4/k7/6r1/8/ b - - -'].


!

testParseCompleteSimpleGame02
	| string parser game executor |
	string := '  [Event "F/S Return Match"]
[Site "Belgrade, Serbia JUG"]
[Date "1992.11.04"]
[Round "29"]
[White "Fischer, Robert J."]
[Black "Spassky, Boris V."]
[Result "1/2-1/2"]

1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 d6 8. c3 O-O 9. h3 Nb8 10. d4 Nbd7 11. c4 c6 12. cxb5 axb5 13. Nc3 Bb7 14. Bg5 b4 15. Nb1 h6 16. Bh4 c5 17. dxe5 Nxe4 18. Bxe7 Qxe7 19. exd6 Qf6 20. Nbd2 Nxd6 21. Nc4 Nxc4 22. Bxc4 Nb6 23. Ne5 Rae8 24. Bxf7+ Rxf7 25. Nxf7 Rxe1+ 26. Qxe1 Kxf7 27. Qe3 Qg5 28. Qxg5 hxg5 29. b3 Ke6 30. a3 Kd6 31. axb4 cxb4 32. Ra5 Nd5 33. f3 Bc8 34. Kf2 Bf5 35. Ra7 g6 36. Ra6+ Kc5 37. Ke1 Nf4 38. g3 Nxh3 39. Kd2 Kb5 40. Rd6 Kc5 41. Ra6 Nf2 42. g4 Bd3 1/2-1/2'.
	parser := ChessPgnParser newOn: systemRoot pgnString: string.

	parser parse.
	
	self assert: parser numberOfMoves equals: 43.

	game := ChessGame newOn: systemRoot whitePlayer: '' blackPlayer: '' pgnString: string.
	executor := game newPgnExecutor.
	self assert: (executor includesPgnMove: 'e4').
	executor playAllMoves.
	executor chessboardDo: [:board | self assert: (board printFenStringForExecutor: executor) = '8/8/R5p1/2k3p1/1p4P1/1P1b1P2/3K1n2/8/ w - - -'].


!

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
testParseCompleteSimpleGame01!public! !
testParseCompleteSimpleGame02!public! !
testParseGameData!public! !
!

