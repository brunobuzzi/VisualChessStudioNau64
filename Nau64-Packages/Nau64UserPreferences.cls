"Filed out from Dolphin Smallalk"!

Object subclass: #Nau64UserPreferences
	instanceVariableNames: 'unicodeFontNameForPieces'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Nau64UserPreferences guid: (GUID fromString: '{1f110d24-b2b7-43c0-8ae7-96e66ad869ff}')!
Nau64UserPreferences comment: ''!
!Nau64UserPreferences categoriesForClass!Unclassified! !
!Nau64UserPreferences methodsFor!

setUnicodeFontName

	unicodeFontNameForPieces := 'Tahoma'!

setUnicodeFontName: aFontName

	unicodeFontNameForPieces := aFontName!

unicodeFontNameForPieces

	^unicodeFontNameForPieces! !
!Nau64UserPreferences categoriesForMethods!
setUnicodeFontName!public! !
setUnicodeFontName:!public! !
unicodeFontNameForPieces!public! !
!

!Nau64UserPreferences class methodsFor!

new

	^self basicNew setUnicodeFontName! !
!Nau64UserPreferences class categoriesForMethods!
new!public! !
!

