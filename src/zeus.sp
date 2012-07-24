/*
  Contains the gamemode mechanics for the spy, zeus, or whatever the
  name is of the client that is very special.
*/

// The client that is special
public cl_Zeus;
public cl_NextZeus;

/*
 * Pick a new zeus from the current clients.  This assumes that the
 * value in cl_Zeus is old.  If the next Zeus is already filled, the
 * current Zeus is changed to that.  If not, both fields are picked
 * randomly, and in rare cases may even be the same thing.
 *
 * @noreturn
*/
public ChooseNewZeus()
{

}
