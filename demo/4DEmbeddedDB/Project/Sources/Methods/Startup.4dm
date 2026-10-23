//%attributes = {}
// Method: Startup
// 
// Description: 
//   Method to run on Database Startup Method
//   Checks if structure is being ran from a merged application

If ((Application type:C494=4D Volume desktop:K5:2) & (File:C1566(Structure file:C489; fk platform path:K87:2).name#"4DEmbeddedDB@"))
	// Seems like structure is opened from Merged Application
	// Assume as an Embedded Standalone Database in a 4D Remote Client
	ALERT:C41(Localized string("Alert_EmbeddedOpened"))
	
	// Look for Server to connect to
	findServer
	
Else 
	// Seems like structure is not opened from Merged Application
	// Assume opened as interpretted mode in 4D
	ALERT:C41(Localized string("Alert_NotEmbedded"))
	
	// Open Demo Form
	Demo_Window
End if 