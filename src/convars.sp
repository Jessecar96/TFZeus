new Handle:cv_hVersion;
public Handle:cv_hMaxKarma;
public Handle:cv_hMinKarma;
public Handle:cv_hDefaultKarma;
public Handle:cv_hEnabled;
public Handle:cv_hRegenKarmaRate;
public Handle:cv_hKillKarmaPenalty;

// define the convars
/**
 * Adds game-specific convars that are required for the game to run.
 * Also adds a server tag, Zeus, which will be later changed to the
 * game mode's name.
 *
 * Should only be called ONCE, and probably from OnPluginStart.
 *
 * @noreturn
*/
public ManageConVars()
{
	AddServerTag("Zeus");

	decl String:version[20];
	GetPluginVersion(version);

	cv_hVersion  = CreateConVar(
		"zs_version",
		version,
		"The version of the Zeus plugin."
	);

	cv_hMaxKarma = CreateConVar(
		"zs_max_karma",
		"1000",
		"The maximum karma any user can have.  This probably should be set to the equal of zs_default_karma.",
		FCVAR_SPONLY,
		true,
		0.0
	);

	cv_hMinKarma = CreateConVar(
		"zs_min_karma",
		"0",
		"The minimum karma any user can have.",
		FCVAR_SPONLY,
		true,
		0.0
	);

	cv_hDefaultKarma = CreateConVar(
		"zs_default_karma",
		"1000",
		"The default karma a joining user will have.",
		FCVAR_SPONLY,
		true,
		0.0
	);

	cv_hRegenKarmaRate = CreateConVar(
		"zs_regen_karma_rate",
		"10",
		"The amount of karma to rengenerate each round.",
		FCVAR_SPONLY,
		true,
		0.0
	);

	cv_hKillKarmaPenalty = CreateConVar(
		"zs_kill_karma_penalty",
		"100",
		"The amount of karma to remove after each kill of a non-zeus player.",
		FCVAR_SPONLY,
		true,
		0.0
	);

	cv_hEnabled = CreateConVar(
		"zs_enabled",
		"1",
		"Whether or not to enable the Zeus gamemode.",
		FCVAR_SPONLY,
		true,
		0.0,
		true,
		1.0
	);

	HookConVarChange(cv_hVersion, OnVersionChange);
}

// handle changes
public OnVersionChange(Handle:cvar, const String:oldVal[], const String:newVal[])
{
	SetConVarString(cvar, oldVal);
}
