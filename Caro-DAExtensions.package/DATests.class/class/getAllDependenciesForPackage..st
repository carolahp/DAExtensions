as yet unclassified
getAllDependenciesForPackage: aPackageName
	| aDictionary daChecker |
	aDictionary := Dictionary new.
	daChecker := DADependencyChecker new.
	self getAllDependenciesForPackageRecursive: aPackageName dependencies: aDictionary checker: daChecker level:0.
	^ aDictionary.