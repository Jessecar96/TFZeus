
public HookEvents()
{

	HookEvent("player_hurt", Event_Hurt, EventHookMode_Pre);
	HookEvent("player_death", Event_Death, EventHookMode_Pre);
	HookEvent("round_start", Event_RoundStart, EventHookMode_PostNoCopy);
	HookEvent("game_start", Event_GameStart, EventHookMode_Pre);

}

Action:Event_Hurt(Handle:event, const String:name[], bool:dontBroadcast)
{
	new userid = GetClientOfUserId(GetEventInt(event,"userid"));
	return Plugin_Continue;
}

Action:Event_Death(Handle:event, const String:name[], bool:dontBroadcast)
{
	new userid = GetClientOfUserId(GetEventInt(event, "userid"));
	if( userid != cl_Zeus )
	{
		RemoveKarmaFromUser(userid, GetConVarInt(cv_hKillKarmaPenalty));
	}

	new killer = GetClientOfUserId(GetEventInt(event, "attacker"));
	if( killer == cl_Zeus )
	{
		dontBroadcast = true;
	}

	return Plugin_Continue;
}

Action:Event_RoundStart(Handle:event, const String:name[], bool:dontBroadcast)
{
	new i, clientCount = GetClientCount();
	for(i = 1; i <= clientCount; i++)
	{
		if( GetKarma(i) < GetConVarInt(cv_hDefaultKarma) )
		{
			AddKarmaToUser(i, GetConVarInt(cv_hRegenKarmaRate));
		}
	}
	return Plugin_Continue;
}

// Removes all control points from the map.
Action:Event_GameStart(Handle:event)
{
	new ent = -1;
	while((ent = FindEntityByClassname(ent, "team_control_point")) != INVALID_ENT_REFERENCE)
		AcceptEntityInput(ent, "Kill");
}
