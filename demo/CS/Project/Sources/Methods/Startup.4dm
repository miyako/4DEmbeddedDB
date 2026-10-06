//%attributes = {}
Case of 
	: (Application type:C494=4D Remote mode:K5:5)
		ALERT:C41("Demo_CS Structure - Client connected @ "+String:C10(Get database parameter:C643(Client Server port ID:K37:35)))
		
		
	: (Application type:C494=4D Local mode:K5:1)
		ALERT:C41("Demo_CS Structure is opened.")
		
		// Open Demo Form
		var $proc_l : Integer
		$proc_l:=New process:C317("Demo_Window"; 0)
		
		
	Else 
		ALERT:C41(String:C10(Application type:C494))
End case 