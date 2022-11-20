// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX ibc

#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define PROJ_TEMPL_TAG PROJ_TEMPL

#define REQUIRED_VERSION 1.88

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(IBC - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(IBC - COMPONENT)
#endif
