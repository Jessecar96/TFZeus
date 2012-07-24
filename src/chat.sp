
public HookPlayerChat()
{

	RegConsoleCmd("say", Command_Say);
	
}

public Action:Command_Say(client, args)
{
	new String:text[192];
	GetCmdArgString(text, sizeof(text));
 
	//Strip ending quote
	new startidx = 0;
	if (text[0] == '"')
	{
		startidx = 1;
		new len = strlen(text);
		if (text[len-1] == '"')
		{
			text[len-1] = '\0';
		}
	}
 
	if (StrEqual(text[startidx], "/help"))
	{
		//Show Help Menu
		return Plugin_Handled;
	}

	return Plugin_Continue;
}