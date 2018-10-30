as yet unclassified
getAllDependenciesForPackageRecursive: aPackageName dependencies: aDictionary checker: daChecker level: i

	| packageDeps j oldIndex |
	
	oldIndex := aDictionary at: aPackageName ifAbsent: [
		j := i + 1.
		"Compute the current package dependencies" 
		packageDeps := daChecker computeDependenciesOf: aPackageName.
		"add the current package to the dictionary of checked packages indicating the level of depth in which it was added"
		aDictionary add: ( aPackageName -> i ).
		Transcript show: aPackageName , ' ', i asString; cr.
		packageDeps do: [ :dep | self getAllDependenciesForPackageRecursive: dep dependencies: aDictionary checker: daChecker level: j].
		^ self
		].
	"correct the depth of the package to obtain the lowest level for each package"
	oldIndex > i
		ifTrue: [ aDictionary at: aPackageName put: i.
			].
