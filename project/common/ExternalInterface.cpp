#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include <stdio.h>
#include "JWHockeyApp.h"


using namespace jwhockeyapp;

static value jwhockeyapp_init (value appId) {
    jwhaInit(val_string(appId));
	return alloc_null();
}
DEFINE_PRIM (jwhockeyapp_init, 1);

extern "C" void jwhockeyapp_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (jwhockeyapp_main);

extern "C" int jwhockeyapp_register_prims () { return 0; }
