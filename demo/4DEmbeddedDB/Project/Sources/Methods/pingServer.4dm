//%attributes = {}

// Method: pingServer
//
// Details: Checks if Server is running through UDP
//
// Parameters:
// - $Addr (Text) : Address/IP of the Server, Defaults to 255.255.255.255 if empty string is passed
// - $Port (Text) : Port number of the Server, Defaults to 19813 if empty string
// 
// Returns:
// {Boolean} : True if Server responds, False if not

#DECLARE($Addr : Text; $Port : Text) : Boolean

ARRAY TEXT:C222($asHost; 0)
ARRAY TEXT:C222($asMachineName; 0)
ARRAY TEXT:C222($asService; 0)
ARRAY TEXT:C222($asDBName; 0)

var $Blob : Blob
var $PortN; $Offset; $Err; $udpID; $Secs; $Timeout; $Pos : Integer
var $PeerAddr; $Host; $Service; $DBName : Text


If ($Addr="")
	$Addr:="255.255.255.255"
End if 

If ($Port#"")
	$PortN:=Num:C11($Port)
Else 
	$PortN:=19813
End if 

$Offset:=32
SET BLOB SIZE:C606($Blob; 96; 0)
TEXT TO BLOB:C554("4D Server II"; $Blob; Mac text without length:K22:10; $Offset)

$Err:=UDP_New(0; $udpID)
$Err:=UDP_SendBLOBTo($udpID; $Addr; $PortN; $Blob)
$Secs:=5
$Timeout:=Milliseconds:C459+($Secs*1000)
Repeat 
	DELAY PROCESS:C323(Current process:C322; 6)  //... in ticks
	SET BLOB SIZE:C606($Blob; 0; 0)
	$PeerAddr:=$Addr
	$Err:=UDP_ReceiveBLOBFrom($udpID; $PeerAddr; $PortN; $Blob)
	
	If (BLOB size:C605($Blob)>0)
		$Offset:=0
		$Host:=BLOB to text:C555($Blob; Mac C string:K22:7; $Offset; 32)
		$Offset:=32
		$Service:=BLOB to text:C555($Blob; Mac C string:K22:7; $Offset; 32)
		$Offset:=64
		$DBName:=BLOB to text:C555($Blob; Mac C string:K22:7; $Offset; 32)
		$Pos:=Find in array:C230($asMachineName; $Host)
		If ($Pos=-1)
			APPEND TO ARRAY:C911($asHost; $PeerAddr)
			APPEND TO ARRAY:C911($asMachineName; $Host)
			APPEND TO ARRAY:C911($asService; $Service)
			APPEND TO ARRAY:C911($asDBName; $DBName)
		End if 
	End if 
Until ((Milliseconds:C459>$Timeout) | ($Err#0))
$Err:=UDP_Delete($udpID)

If (Size of array:C274($asDBName)>0)
	return True:C214
Else 
	return False:C215
End if 



