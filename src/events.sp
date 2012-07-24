
public HookEvents()
{
	
	HookEvent("player_hurt", Event_Hurt,EventHookMode_Pre);
	HookEvent("player_death", Event_Death,EventHookMode_Pre);
	
}

public Action:Event_Hurt(Handle:event, const String:name[], bool:dontBroadcast)
{
	new userid = GetEventInt(event,"userid");
	return Plugin_Continue;
}

public Action:Event_Death(Handle:event, const String:name[], bool:dontBroadcast)
{
	new userid = GetEventInt(event,"userid");
	if(userid!=cl_Zeus)
	{
		RemoveKarmaFromUser(userid, 10);
	}
	return Plugin_Continue;
}