//%attributes = {}
// Method: findServer
//
// Description: 
//   Method looks in {database folder}/resources/Servers/ for .4DLink files
//   For simplicity of demo, prioritizes Servers based on Alphabetical Sorting of .4DLinkfiles
//   For the demo, it is suggested to name the .4DLink files using "1.4DLink" - "9.4DLink"
//
//   If .4DLink files are found, parses each in order check for 4D Internect Commands plugin
//   and runs "pingServer" to see if Server is running
//   If server is found, connects to it
//   If not, check next .4DLink file
//   If no server is found or 4D Internect commands are not found automatically connect to default
//
//   Suggestion add primary server as "1.4Dlink"
//   add secondary as "2.4Dlink"
//   add another if desired.


ARRAY LONGINT:C221($arrNum; 0)
ARRAY TEXT:C222($arrName; 0)

var $found_b : Boolean
var $files_c; $serverPath_c : Collection
var $4dlinkRef; $serverPath_t; $xml_t : Text
var $4dlinkFile : 4D:C1709.File
$found_b:=False:C215
// Check {database folder}/resources/Servers/ folder for .4dlink files
$files_c:=Folder:C1567(fk resources folder:K87:11).folder("Servers").files()
$files_c:=$files_c.query("extension = .4dlink").orderBy("name")

// Check for 4D Internet Commands plugin
PLUGIN LIST:C847($arrNum; $arrName)
If (Find in array:C230($arrName; "4D Internet Commands")>0)
	
	// Parse .4dlink file in filename order
	For each ($4dlinkFile; $files_c)
		ALERT:C41("Checking Server "+$4dlinkFile.name)
		
		// Load .4dlink file
		$4dlinkRef:=DOM Parse XML source:C719($4dlinkFile.platformPath)
		
		// Get Server IP:Port
		DOM GET XML ATTRIBUTE BY NAME:C728($4dlinkRef; "server_path"; $serverPath_t)
		
		// Close file
		DOM CLOSE XML:C722($4dlinkRef)
		
		// Split IP and Port
		$serverPath_c:=Split string:C1554($serverPath_t; ":")
		
		// Check if server is running
		$found_b:=pingServer($serverPath_c[0]; $serverPath_c[1])
		
		// If server is running connect to it
		If ($found_b)
			ALERT:C41("Server "+$4dlinkFile.name+" found. Connecting.")
			
			OPEN DATABASE:C1321($4dlinkFile.platformPath)
		End if 
		
	End for each 
	
Else 
	// 4D Internet Commands plugin is not found
	// Automatically attempt Primary Server based on 4DLink file
	ALERT:C41("Internet Commands Plugin Not Found Connecting first 4DLink File Found")
	OPEN DATABASE:C1321($files_c[0].platformPath)
End if 



// If no connection could be made, attempt to connect to a 4D Server on the default port 19813
If ($found_b=False:C215)
	ALERT:C41("No 4DLink file Server found connecting to default 19813")
	
	$xml_t:="<?xml version=\"1.0\" encoding=\"UTF-8\"?><database_shortcut is_remote=\"true\" server_database_name=\"Demo_CS\" server_path=\""+":19813\"/>"
	$4dlinkFile:=Folder:C1567(fk user preferences folder:K87:10).file("server.4dlink")
	$4dlinkFile.setText($xml_t)
	
End if 

