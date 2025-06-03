property LOWERCASE : Collection
property UPPERCASE : Collection

/*shared singleton*/Class constructor()

This:C1470.LOWERCASE:=This:C1470.string("a"; "z")
This:C1470.UPPERCASE:=This:C1470.string("A"; "Z")

Function collection($f : 4D:C1709.Function; $size : Integer/*; ... */) : Collection
	
	//%W-550.16
	C_VARIANT:C1683(${3})
	//%W+550.16
	
	var $values : Collection
	$values:=[]
	
	var $ui : Integer
	For ($i; 0; $size)
		$values.push($f.apply(This:C1470; Copy parameters:C1790(3)))
	End for 
	
	return $values
	
Function date($a : Date; $b : Date) : Date
	
	return This:C1470.random($a; $b)
	
Function integer($a : Integer; $b : Integer) : Integer
	
	return This:C1470.random($a; $b)
	
Function random($a : Variant; $b : Variant) : Variant
	
	var $range; $from; $to : Variant
	
	If ($a>$b)
		$from:=$b
		$to:=$a
	Else 
		$from:=$a
		$to:=$b
	End if 
	
	$range:=$to-$from+1
	
	return $range#1 ? (Random:C100%$range)+$from : $from
	
Function time($a : Integer; $b : Integer) : Time
	
	return This:C1470.random($a; $b)
	
Function lowercase($length : Integer) : Text
	
	return This:C1470.values(This:C1470.LOWERCASE; $length)
	
Function uppercase($length : Integer) : Text
	
	return This:C1470.values(This:C1470.UPPERCASE; $length)
	
Function string($from : Text; $to : Text) : Collection
	
	var $a; $b : Integer
	$a:=Character code:C91($from)
	$b:=Character code:C91($to)
	
	If ($a>$b)
		$step:=-1
	Else 
		$step:=1
	End if 
	
	var $code : Integer
	var $values : Collection
	$values:=[]
	For ($code; $a; $b; $step)
		$values.push(Char:C90($code))
	End for 
	
	return $values.copy(ck shared:K85:29; This:C1470)
	
Function values($values : Collection; $length : Integer) : Text
	
	$length:=$length>0 ? $length : 1
	
	var $value : Text
	var $i : Integer
	For ($i; 1; $length)
		$value+=$values[Random:C100%$values.length]
	End for 
	
	return $value