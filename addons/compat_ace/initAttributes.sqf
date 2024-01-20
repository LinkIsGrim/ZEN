// Add ACE Logistics button to attribute display
["ACE Logistics", "STR_ACE_Main_Category_Logistics", true] call EFUNC(attributes,addDisplay);

[
    "Object",
    "STR_ACE_Main_Category_Logistics",
    {[_entity, "ACE Logistics"] call EFUNC(attributes,open)},
    {alive _entity}
] call EFUNC(attributes,addButton);

[
    "ACE Logistics",
    ["STR_ACE_Cargo_size_edenName", "STR_ACE_Cargo_size_edenDesc"],
    QGVAR(edit),
    nil,
    {
        [_entity, (ceil parseNumber _value) max -1] call ace_cargo_fnc_setSize;
    },
    {
        private _size = -1;
        private _canLoadPublic = _entity getVariable "ace_cargo_canLoad";
        private _canLoadConfig = getNumber (configOf >> "entity" >> "canLoad") == 1;
        if (
            (!isNil "_canLoadPublic" && {_canLoadPublic in [1, true]}) ||
            (isNil "_canLoadPublic" && _canLoadConfig)
        ) then {
            _size = _entity call ace_cargo_fnc_getSizeItem; // not public, but variable isn't set for items that don't have their size edited
        };
        _size
    }
] call EFUNC(attributes,addAttribute);

[
    "ACE Logistics",
    ["STR_ACE_Cargo_space_edenName", "STR_ACE_Cargo_space_edenDesc"],
    QGVAR(edit),
    nil,
    {
        [_entity, (ceil parseNumber _value) max 0] call ace_cargo_fnc_setSpace
    },
    {
        _entity call ace_cargo_fnc_getCargoSpaceLeft // not public, but variable isn't set for items that don't have their space edited
    }
] call EFUNC(attributes,addAttribute);

[
    "ACE Logistics",
    ["STR_ACE_Cargo_customName_edenName", "STR_ACE_Cargo_customName_edenDesc"],
    QGVAR(edit),
    nil,
    {
        _entity setVariable ["ace_cargo_customName", _value, true]
    },
    {
        _entity getVariable ["ace_cargo_customName", ""]
    }
] call EFUNC(attributes,addAttribute);
