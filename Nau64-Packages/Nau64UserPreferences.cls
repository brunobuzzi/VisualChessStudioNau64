"Filed out from Dolphin Smallalk"!

Object subclass: #Nau64UserPreferences
	instanceVariableNames: 'unicodeFontNameForPieces squareWhiteColor squareBlackColor'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Nau64UserPreferences guid: (GUID fromString: '{1f110d24-b2b7-43c0-8ae7-96e66ad869ff}')!
Nau64UserPreferences comment: ''!
!Nau64UserPreferences categoriesForClass!Unclassified! !
!Nau64UserPreferences methodsFor!

initialize

	unicodeFontNameForPieces := 'Gadugi'.
	squareBlackColor := Color silver.
	squareWhiteColor := Color white.!

setUnicodeFontName: aFontName

	unicodeFontNameForPieces := aFontName!

squareBlackColor

	^squareBlackColor!

squareBlackColor: aColor

	squareBlackColor := aColor!

squareWhiteColor

	^squareWhiteColor!

squareWhiteColor: aColor

	squareWhiteColor := aColor!

unicodeFontNameForPieces

	^unicodeFontNameForPieces!

unicodeFontNameForPieces: aString
	unicodeFontNameForPieces := aString
"
Malgun Gothic
Malgun Gothic Semilight
Microsoft JhengHei
Microsoft JhengHei UI
Microsoft JhengHei UI Light
Microsoft YaHei
Microsoft YaHei UI
Microsoft YaHei UI Light
MingLiU_HKSCS-ExtB
MV Boli
Raleway Light
Ebrima
Gadugi
Leelawadee UI
Nirmala UI
Nirmala UI Semilight
PMingLiU-ExtB
"
"names := GdiplusInstalledFontCollection new families collect: [:e | e name].
x := 10.
y := 10.
names remove: 'Marlett'.
names.
names keysAndValuesDo: [:idx :fName |  | icon nameIcon |
	icon := TextTileIcon text: (Character codePoint: 9820) asUtf16String fontName: fName.
	nameIcon := TextTileIcon text: idx printString fontName: fName .
	icon drawOn: Canvas forDesktop  at: x@y.
	nameIcon drawOn: Canvas forDesktop  at: (x@(y+60)) extent: 40@40.
	x := x + 50.
	x > 1400 ifTrue: [x := 10. y := y + 80].
].

(TextTileIcon text: (Character codePoint: 9820) asUtf16String fontName: 'Malgun Gothic')
drawOn: Canvas forDesktop at: 50@50.
"! !
!Nau64UserPreferences categoriesForMethods!
initialize!public! !
setUnicodeFontName:!public! !
squareBlackColor!public! !
squareBlackColor:!public! !
squareWhiteColor!public! !
squareWhiteColor:!public! !
unicodeFontNameForPieces!public! !
unicodeFontNameForPieces:!public! !
!

!Nau64UserPreferences class methodsFor!

new

	^self basicNew initialize! !
!Nau64UserPreferences class categoriesForMethods!
new!public! !
!

