var $event : Object

$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		var $generator : cs:C1710.DataGenerator
		$generator:=cs:C1710.DataGenerator.new()
		
		//%W-550.12
		Form:C1466.list:=cs:C1710.ListboxCollection.new($generator.collection($generator.lowercase; 80; 40))
		//%W+550.12
		
End case 