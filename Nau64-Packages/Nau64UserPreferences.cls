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

	self setUnicodeFontName.
	self squareBlackAndWhiteColors.!

setUnicodeFontName

	unicodeFontNameForPieces := 'Tahoma'!

setUnicodeFontName: aFontName

	unicodeFontNameForPieces := aFontName!

squareBlackAndWhiteColors

	squareBlackColor := Color lightGray.
	squareWhiteColor := Color white.!

squareBlackColor

	^squareBlackColor!

squareBlackColor: aColor

	squareBlackColor := aColor!

squareWhiteColor

	^squareWhiteColor!

squareWhiteColor: aColor

	squareWhiteColor := aColor!

unicodeFontNameForPieces

	^unicodeFontNameForPieces ifNil: ['Gadugi']
"Other interesting designs:
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
PMingLiU-ExtB"!

unicodeFontNameForPieces: aString

	unicodeFontNameForPieces := aString! !
!Nau64UserPreferences categoriesForMethods!
initialize!public! !
setUnicodeFontName!public! !
setUnicodeFontName:!public! !
squareBlackAndWhiteColors!public! !
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

