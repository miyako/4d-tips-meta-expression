![version](https://img.shields.io/badge/version-20%2B-E23089)

# 4d-tips-meta-expression
Example of using the meta expression in a collection based listbox

<img src="https://github.com/user-attachments/assets/6eb58e4f-c955-4ae0-84fd-6cc5275f515e" width=400 height=auto />

## The Listbox

for simplicity, the listbox has a single column whose `dataSource` is `This.value` to display a [collection of scalar values](https://developer.4d.com/docs/FormObjects/listboxOverview#collection-or-entity-selection-list-boxes).

## The Class

`cs.ListboxCollection` is a user class to manage the conditional styling of this list box. it has `4` properties that correspond to the standard data sources of a collection based listbox.

```4d
property dataSource : Collection
property selectedItemsSource : Collection
property currentItemPositionSource : Integer
property currentItemSource : Object
```

it also defines `3x2` sets of style objects for this listbox.

```4d
This.palette:={}
This.palette.a0:={stroke: "rgb(220, 20, 60)"; fill: "rgb(250, 160, 160)"}
This.palette.a1:={stroke: "rgb(248, 131, 121)"; fill: "rgb(139, 0, 0)"}
	
This.palette.b0:={stroke: "rgb(9, 121, 105)"; fill: "rgb(175, 225, 175)"}
This.palette.b1:={stroke: "rgb(127, 255, 212)"; fill: "rgb(53, 94, 59)"}
	
This.palette.c0:={stroke: "rgb(96, 130, 182)"; fill: "rgb(173, 216, 230)"}
This.palette.c1:={stroke: "rgb(240, 255, 255)"; fill: "rgb(0, 71, 171)"}
```

in this example, the `0` suffix is for unselected lines and the `1` suffix is for selected lines.

## On Load

the listbox is setup during the *On Load* form event.

```4d	
var $generator : cs.DataGenerator
$generator:=cs.DataGenerator.new()
		
//%W-550.12
Form.list:=cs.ListboxCollection.new($generator.collection($generator.lowercase; 80; 40))
//%W+550.12 
```

## Random Data Generator

`cs.DataGenerator` is a user class that generates a set of random data in a specific range. supported types are:

* lowercase
* uppercase
* date inrange
* time in range
* integer in range

> [!TIP]
> in 20 R5 or later, you may want to change this class to a [shared singleton](https://blog.4d.com/tag/singleton/) for efficiency

```4d
/*shared singleton */Class constructor()
``` 

> [!TIP]
> in 20 R3 or later, you may want to use [dot dot dot](https://blog.4d.com/a-fresh-approach-to-writing-variadic-functions/) for variadic function declaration 

```4d
Function collection($f : 4D.Function; $size : Integer/*; ... */) : Collection
	
	//%W-550.16
	C_VARIANT(${3})
	//%W+550.16
```

## The Function

the meta function returns the style object based on the row number and selected status.

```4d
Function meta() : Object
	
	var $event : Object
	$event:=FORM Event
	
	var $row : Integer
	$row:=$event.row
	
	var $isRowSelected : Boolean
	$isRowSelected:=$event.isRowSelected
	
	var $mod : Integer
	$mod:=$row%3
	
	Case of 
		: ($mod=0)
			$palette:="a"
		: ($mod=1)
			$palette:="b"
		: ($mod=2)
			$palette:="c"
	End case 
	
	$palette+=$isRowSelected ? "1" : "0"
	$meta:=This.palette[$palette]
	
	return $meta
```

## The Property

this is the key piece that completes the puzzle.

the "meta expression" property of this listbox is defined as follows:

```4d
Form.list.meta.call(Form.list)
```

you may think that `Form.list.meta` would suffice, but it does not. you need to explicitly define the expression as a function call that applies to a specific `This` object.

> [!NOTE]
> if you were to use a project method for the meta expression, the equivalent code would be
> ```4d
> return Form.list.meta
> ```
