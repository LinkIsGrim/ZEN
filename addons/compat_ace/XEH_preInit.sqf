#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (["ace_cargo", "ace_dragging", "ace_rearm", "ace_refuel"] findIf {isClass (configFile >> "CfgPatches" >> _x)} != -1) then {
    #include "initAttributes.sqf"
};
#include "initSettings.sqf"

ADDON = true;
