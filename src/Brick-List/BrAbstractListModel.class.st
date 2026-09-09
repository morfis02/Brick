Class {
	#name : #BrAbstractListModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'itemTypeStencil',
		'itemIdStencil',
		'rowDataBinder',
		'shouldRequestFocusOnSelectionClick'
	],
	#category : #'Brick-List-Models'
}

{ #category : #'api - accessing' }
BrAbstractListModel >> entityCount [
	^ self subclassResponsibility
]

{ #category : #initialization }
BrAbstractListModel >> initialize [
	super initialize.

	itemTypeStencil := [ :anItemTypeFactory | anItemTypeFactory default ] asStencilBuilder: BrListItemTypeStencilBuilder.
	shouldRequestFocusOnSelectionClick := true.
	itemIdStencil := nil
]

{ #category : #initialization }
BrAbstractListModel >> initializeListeners [
	super initializeListeners.

	"answer if somebody is interested in what items I have"
	self when: BrListItemTypeStencilRequest reply: [ :aResponse | aResponse itemTypeStencil: self itemTypeStencil ].
	self when: BrListItemIdStencilRequest reply: [ :aResponse | aResponse itemIdStencil: self itemIdStencil ].
	
	self when: BrTreeRowDataBinderRequest reply: [ :aResponse | aResponse rowDataBinder: self rowDataBinder ].
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemIdStencil [
	"Return a stencil that is used to create an item id of a given item object"
	<return: #BrListItemIdStencilBuilder or: nil>

	^ itemIdStencil
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemIdStencil: aStencil [
	"Set a stencil that will be used to create an item element of a given type"

	itemIdStencil := aStencil asStencilBuilder: BrListItemIdStencilBuilder.
	self dispatchEvent: (BrListItemIdStencilChangedEvent new itemIdStencil: itemIdStencil)
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemTypeStencil [
	"Return a stencil that is used to create an item type of a given item object"
	<return: #BrListItemTypeStencilBuilder>

	^ itemTypeStencil
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemTypeStencil: aStencil [
	"Set a stencil that will be used to create an item element of a given type"

	itemTypeStencil := aStencil asStencilBuilder: BrListItemTypeStencilBuilder.
	self dispatchEvent: (BrListItemTypeStencilChangedEvent new itemTypeStencil: itemTypeStencil)
]

{ #category : #accessing }
BrAbstractListModel >> rowDataBinder [
	"Return a stencil that is used to bind row data to a given row element"

	<return: #BrListRowDataBinder>
	^ rowDataBinder
]

{ #category : #accessing }
BrAbstractListModel >> rowDataBinder: aStencil [
	"Set a stencil that will be used to bind row data to a given row element"

	rowDataBinder := aStencil asStencilBuilder: BrListRowDataBinder.
	self dispatchEvent: (BrListRowDataBinderChangedEvent new rowDataBinder: rowDataBinder)
]

{ #category : #accessing }
BrAbstractListModel >> shouldRequestFocusOnSelectionClick [
	^ shouldRequestFocusOnSelectionClick
]

{ #category : #accessing }
BrAbstractListModel >> shouldRequestFocusOnSelectionClick: anObject [
	shouldRequestFocusOnSelectionClick := anObject
]

{ #category : #'as yet unclassified' }
BrAbstractListModel >> test [
	^'test'
]
