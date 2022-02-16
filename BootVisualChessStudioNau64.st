"Boot a Jade development image"

SessionManager current splashShowAtStartup: false.
SmalltalkSystemShell allInstances first position: 20@50.
(TranscriptShell allInstances , #(nil)) first ifNotNil: [:shell | shell view position: 20@600; extent: 800@300; setFocus].
!
| list |
list := OrderedCollection new
add: SessionManager current imageBase , 'Nau64-Packages\ChessBasicElements.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessParsers.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessBasicElementsTests.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessChessboardCalculations.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessEngineTacticSearcher.pax';	
add: SessionManager current imageBase , 'Nau64-Packages\ChessPiecesMovementsEngine.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessRulesTests.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessEngineBasic.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessEngineBruteForce.pax'	;
add: SessionManager current imageBase , 'Nau64-Packages\ChessEngineChessboardAnalyzer.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessEngineStrategySearcher.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessMatches.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessSearchOrganization.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessNau64-IDE.pax';
add: SessionManager current imageBase , 'Nau64-Packages\ChessNau64-IDE-Tests.pax';
yourself.

(Delay forMilliseconds: 200) wait.
ProgressDialog showModalWhile: [:progress |
	1 to: list size do: [:i |
		| name percent |
		name := list at: i.
		percent := (i * 100 / list size) asInteger.
		progress
			value: percent;
			text: 'Loading package: ' , name;
			yourself.
		PackageManager current install: name.
	].
].
!
