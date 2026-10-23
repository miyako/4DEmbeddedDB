//%attributes = {"invisible":true}
#DECLARE($params : Object)

var $windowTitle : Text
$windowTitle:=Localized string("DemoPortal_WindowTitle")

var $window : Integer

If (Count parameters=0)
	
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	
	var $i : Integer
	For ($i; 1; Size of array:C274($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$windowTitle)
			var $x; $y; $bottom; $right : Integer
			GET WINDOW RECT($x; $y; $bottom; $right; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $bottom; $right; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name; {})
	
Else 
	
	SET MENU BAR(1)
	
	$window:=Open form window:C675("DemoPortal"; Plain form window; Horizontally centered; Vertically centered)
	SET WINDOW TITLE($windowTitle; $window)
	DIALOG:C40("DemoPortal"; *)
	
End if