-----------------------------------------
-- Spell: Barpetra
-----------------------------------------
require("scripts/globals/spells/barstatus")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    return applyBarstatus(dsp.effect.BARPETRIFY,caster,target,spell)
end
