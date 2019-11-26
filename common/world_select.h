﻿#ifndef __WORLD_SELECT_HEAD__
#define __WORLD_SELECT_HEAD__

#include "world_cell.h"
#include "lua_base.h"
#include "world_base.h"


extern world* g_pTheWorld;
extern world* g_pTheCellWorld;
extern world* g_pTheBaseWorld;
inline world* GetWorld()
{
	return g_pTheWorld;
}

inline CWorldBase& GetWorldbase()
{
    return (CWorldBase&)*g_pTheBaseWorld;
}

inline CWorldCell& GetWorldcell()
{
    return (CWorldCell&)*g_pTheCellWorld;
}


#endif


