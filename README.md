F2 - PA ACE
================================

*[Original F2 Framework](http://github.github.com/github-flavored-markdown/sample_content.html)*

An alteration of the F2 framework, to be more compatible with ACE weaponry/systems. 

Changelog
-------------------------

v1:
* f/folk_assignGear_acre  - Modified to fit PA commsig (343s for Squad Level, 148s for SL, 117 for CAS/Armour/LAV).

* f/folk_assignGear_us
f/folk_assignGear_usmc    - Both US and USMC using same ORBAT currently, MAT/MORT/HMG and most units alterered to use ACE weapons and rucks, Medics equipped with ACE Wounds items in rucks.

* f/folk_assignGear_gue
f/folk_assignGear_ins     - Both GUE and INS using same ORBAT, MAT/HMG changed to ACE OPFOR weapons, mortars left as ACE_M252 (explained in "Future plans" list), Medics equipped with ACE Wounds items in rucks.

* f/folk_assignGear_*     - All modified gear scripts have IFAKs and ACE Wounds compatibility. 

* init.sqf                - Following added: 
                          * CBA Custom Event Handler, for group deployment.
                          * Toggleable addAction, for leaders of groups, for group deployment. 
                          * Disabled auto-assignation of ACE Wounds gear to units (was filling rucks of non-medics).
                          * UO code - "AI hear players talking on ACRE" - Credits specified in script.

* PA/deployment           - Various scripts needed for group deployment to function.

* PA/aiHearTalking        - "AI hear players talking on ACRE" - UO code, credits in script.

Future Plans
-------------------------

* Change mortars for OPFOR/INDEP factions to use appropriate gear, not M252s - Needs confirmation from someone experienced with mortars

* Alter how Group Deployment works, to be more efficient, less messy, and fully comment scripts, for readability.

* Add a radio script to seperate radio frequencies based on side. (UO Code?)

* Move third-party scripts to seperate folder, from "PA".

* Continue modification of gear scripts to reflect both normal PA ORBAT and to use ACE gear.

* Possibly modify GUE/INS rifles/carbines, don't know much about OPFOR gear, so may be wrong setup.
