// manage karma for the users

/*
 * Basically, set the user's current karma to the default when
 * joining.  Mainly so we don't get errors for the following code.
*/
public OnClientPostAdminCheck(index)
{
	decl String:karma[10];
	GetConVarString(cv_hDefaultKarma, karma, 10);
	SetClientInfo(index, "karma", karma);

	PrintToChat(index, "Welcome, %N!  Your karma level for this round is at a default %s.", index, karma);
}

/*
 * Add karma to a user.
 *
 * @param userid	The client's index.
 * @param amount	The amount to increment by.
*/
public AddKarmaToUser(userid, amount)
{
	new karma = GetKarma(userid);
	karma+= amount;
	SetKarma(userid, karma);
}

/*
 * Get the user's ratio of karma.  The ratio is the user's karma over
 * the default value.  Mainly used as a damage modifier.
 *
 * @param userid	The client's index.
*/
public Float:GetKarmaRatio(userid)
{
	new karma = GetKarma(userid);
	return karma / GetConVarInt(cv_hDefaultKarma);
}

/*
 * Get a user's karma.
 *
 * @param userid	The client's index.
*/
public GetKarma(userid)
{
	decl String:karma[10];
	GetClientInfo(userid, "karma", karma, 10);
	return StringToInt(karma);
}

/*
 * Set the user's karma.
 *
 * @param userid	The client's index.
 * @param amount	The amount to set it to.
*/
public SetKarma(userid, amount)
{
	decl String:karma[10];
	IntToString(amount, karma, 10);
	SetClientInfo(userid, "karma", karma);
}
