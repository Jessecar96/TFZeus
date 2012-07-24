/*
  Contains the gamemode mechanics for the spy, zeus, or whatever the
  name is of the client that is very special.
*/

// The client that is special.  This is their index.
public cl_Zeus;

// The next client that will be special.  This is their index.
public cl_NextZeus;

/*
 * Pick a new zeus from the current clients.  This assumes that the
 * value in cl_Zeus is old.  If the next Zeus is already filled, the
 * current Zeus is changed to that.  If not, both fields are picked
 * randomly, and in rare cases may even be the same thing.
 *
 * If there's no clients in the server, zeus will always be client
 * number 1 (based on how GetRandomInt works).
 *
 * @noreturn
*/
public ChooseNewZeus()
{
	new clientCount = GetClientCount();
	if( clientCount == 0 )
	{
		ClearZeus();
		return;
	}
	if( cl_NextZeus > 0 )
	{
		cl_Zeus = cl_NextZeus;
		cl_NextZeus = GetRandomInt(1, clientCount);
		return;
	}
	cl_Zeus = GetRandomInt(1, clientCount);
	cl_NextZeus = GetRandomInt(1, clientCount);
	NotifyNewZeus();
}

/*
 * Clears the current zeus.  Mainly for an empty server, or
 * for the admin command.  If the first parameter is set, this
 * includes the next zeus as well.
 *
 * @param IncludeNextZeus include the next zeus from being cleared as well.
 * @noreturn;
*/
public ClearZeus(bool:IncludeNextZeus=true)
{
	cl_Zeus = 0;
	if( IncludeNextZeus )
	{
		cl_NextZeus = 0;
	}
	return;
}

NotifyNewZeus()
{
	PrintToClient(cl_Zeus, "\0x04You are now Zeus!  Go get 'em, boy!");
	return;
}
