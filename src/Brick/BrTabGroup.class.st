Class {
	#name : #BrTabGroup,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Tabs - UI'
}

{ #category : #accessing }
BrTabGroup >> actionbarStencil: anActionbarStencilBuilder [
	"See ${method:BrTabGroupModel>>#actionbarStencil:}"

	self viewModel actionbarStencil: anActionbarStencilBuilder
]

{ #category : #'api - adding / removing' }
BrTabGroup >> addTab: anElement [
	self viewModel addTab: anElement viewModel
]

{ #category : #'api - adding / removing' }
BrTabGroup >> addTab: anElement at: anInteger [ 
	self viewModel addTab: anElement viewModel at: anInteger
]

{ #category : #'as yet unclassified' }
BrTabGroup >> addTabAfterSelectedTab: aBrTab [
	self viewModel addTabAfterSelectedTab: aBrTab viewModel
]

{ #category : #'api - adding / removing' }
BrTabGroup >> addTabs: aCollectionOfElements [
	self viewModel addTabs: (aCollectionOfElements collect: [ :anElement | anElement viewModel])
]

{ #category : #accessing }
BrTabGroup >> content [
	^ self childNamed: #content
]

{ #category : #'api - testing' }
BrTabGroup >> hasTab: anElement [
	^ self viewModel hasTab: anElement viewModel
]

{ #category : #initialization }
BrTabGroup >> initialize [
	super initialize.

	self matchParent.
	self viewModel: BrTabGroupModel new
]

{ #category : #'api - adding / removing' }
BrTabGroup >> moveTab: anElement at: anInteger [
	self viewModel moveTab: anElement viewModel at: anInteger
]

{ #category : #'api - adding / removing' }
BrTabGroup >> moveTab: anElement atCursor: anInteger [
	self viewModel moveTab: anElement viewModel atCursor: anInteger
]

{ #category : #'api - adding / removing' }
BrTabGroup >> removeSelectedTab [
	self viewModel removeSelectedTab
]

{ #category : #'api - adding / removing' }
BrTabGroup >> removeTab: anElement [
	self viewModel removeTab: anElement viewModel
]

{ #category : #accessing }
BrTabGroup >> selectTabToTheLeft [
	self viewModel selectTabToTheLeft
]

{ #category : #accessing }
BrTabGroup >> selectTabToTheRight [
	self viewModel selectTabToTheRight
]

{ #category : #accessing }
BrTabGroup >> selectTabWithLabelString: aString [
	(self viewModel tabs
		detect: [ :each | each tabLabel text asString = aString ]
		ifNone: [ ^ self ]) select
]

{ #category : #accessing }
BrTabGroup >> tabIndexOf: aBrTab [
	^ self viewModel indexOf: aBrTab viewModel
]

{ #category : #accessing }
BrTabGroup >> tabs [
	^ self viewModel tabs
]

{ #category : #'as yet unclassified' }
BrTabGroup >> testMethod [
	^'test'
]
