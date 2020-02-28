#include <sourcemod>
#include <sdktools>
#include <cstrike>

public Plugin myinfo = 
{
    name = "Drop Knife",
    author = "Lengran",
    description = "This enables players to drop 5 knifes on the ground so they can share their knifes with their teammates.",
    version = "1.0",
    url = "http://www.sourcemod.net/"
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_drop", Drop_Knife);
}

public Action Drop_Knife(int client, int Args)
{
    char knife[256];
    
    int index = GetPlayerWeaponSlot(client, CS_SLOT_KNIFE);
    if (index == -1)
    {
        PrintToChat(client, "To drop a knife, you must have a knife in hand!");
        return Plugin_Handled;
    }
    bool success = GetEntityClassname(index, knife, 256);
    if (!success)
    {
        PrintToChat(client, "GetEntityClassname Error!");
        return Plugin_Handled;
    }

    for (int i = 0; i < 4; i++)
    {
        GivePlayerItem(client, knife, 0);
    }
    
    return Plugin_Handled;
}