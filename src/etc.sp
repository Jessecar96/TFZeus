/*
	Contains etc things required for the gamemode to run.
*/

/**
 * This checks each disconnecting client to see if they're Zeus.
 * If they're Zeus, we need to restart the game because they left.
 * They suck.
*/
public OnClientDisconnect_Post(client)
{
	if( client == cl_Zeus )
	{
		PrintToChatAll("Zeus left.  He sucks!  Oh well, moving on...");
		EmitSoundToAll("misc/your_team_list.wav");
		ServerCommand("mp_restartgame 1");
	}
}
