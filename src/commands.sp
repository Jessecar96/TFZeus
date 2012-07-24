
public ManageAdminCommands()
{
	
	RegAdminCmd("sm_next_zeus",AdminCommand_Next,Admin_Generic,"Sets the next zeus");
	
}

public Action:AdminCommand_Next(client,args)
{
	if(args<1){
		ReplyToCommand(client, "Usage: sm_next_zeus <player>");
		return Plugin_Handled;
	}
	
	decl String:temp[128];
	GetCmdArg(1, temp, sizeof(temp));
	
	new target = FindTarget(client, temp, false, false);
	if(target==-1) return Plugin_Handled;
	
	cl_NextZeus = GetClientUserId(target);
	
	PrintToChat(client, "Set the next Zeus to %s", target);
	
	return Plugin_Handled;
	
}