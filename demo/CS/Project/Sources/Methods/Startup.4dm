//%attributes = {}
Case of 
	: (Application type:C494=4D Remote mode:K5:5)
		ALERT:C41(Replace string(Localized string("Alert_ClientConnected"); "{port}"; String:C10(Get database parameter:C643(Client Server port ID:K37:35))))
		
		
	: (Application type:C494=4D Local mode:K5:1)
		ALERT:C41(Localized string("Alert_LocalOpened"))
		
		// Open Demo Form
		Demo_Window
		
		
	Else 
		ALERT:C41(String:C10(Application type:C494))
End case 