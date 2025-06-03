//%attributes = {}
var $generator : cs:C1710.DataGenerator
$generator:=cs:C1710.DataGenerator.new()

$dates:=$generator.collection($generator.date; 80; !2001-01-01!; !2001-12-31!)
$times:=$generator.collection($generator.time; 80; ?08:30:00?; ?17:30:00?)
