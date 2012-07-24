#include <sourcemod>
#include "include.sp"

#pragma semicolon 1

public Plugin:myinfo =
{
	name = "Zeus",
	author = "Jessecar96 & Dr. Cat, MD",
	description = "This is a gamemode",
	version = "0.0.1",
	url = "jessecar96.net"
}

public OnPluginStart()
{
	ManageConVars();
	HookPlayerChat();
	ManageAdminCommands();
	HookEvents();
	//Something goes here
}

/*
 * Get the plugin's version.  It takes it and sets it into the buffer
 * given.
 *
 * @param buffer	the string to set the version to
*/
public GetPluginVersion(String:buffer[20])
{
	buffer = "0.0.1";
}
