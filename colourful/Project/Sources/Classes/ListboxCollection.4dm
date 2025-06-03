property dataSource : Collection
property selectedItemsSource : Collection
property currentItemPositionSource : Integer
property currentItemSource : Object

property palette : Object

Class constructor($dataSource : Collection)
	
	This:C1470.dataSource:=$dataSource
	
	This:C1470.palette:={}
	This:C1470.palette.a0:={stroke: "rgb(220, 20, 60)"; fill: "rgb(250, 160, 160)"}
	This:C1470.palette.a1:={stroke: "rgb(248, 131, 121)"; fill: "rgb(139, 0, 0)"}
	
	This:C1470.palette.b0:={stroke: "rgb(9, 121, 105)"; fill: "rgb(175, 225, 175)"}
	This:C1470.palette.b1:={stroke: "rgb(127, 255, 212)"; fill: "rgb(53, 94, 59)"}
	
	This:C1470.palette.c0:={stroke: "rgb(96, 130, 182)"; fill: "rgb(173, 216, 230)"}
	This:C1470.palette.c1:={stroke: "rgb(240, 255, 255)"; fill: "rgb(0, 71, 171)"}
	
Function meta() : Object
	
	var $event : Object
	$event:=FORM Event:C1606
	
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
	$meta:=This:C1470.palette[$palette]
	
	return $meta