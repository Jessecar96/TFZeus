#include <sourcemod>
#include "include.sp"

#pragma semicolon 1

public Plugin:myinfo =
{
	name = "Zeus",
	author = "Jessecar96 & Dr. Cat, MD",
	description = "This is a gamemode",
	version = "1.0",
	url = "jessecar96.net"
}

public OnPluginStart()
{
	ManageConVars();
	HookPlayerChat();
	ManageAdminCommands();
	//Something goes here
}
