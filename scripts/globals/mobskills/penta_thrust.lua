---------------------------------------------
-- Leg Sweep
--
-- Description: Delivers a fivefold attack. Accuracy varies with TP..
-- Type: Physical
-- Utsusemi/Blink absorb: Shadow per hit
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 168)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 5
    local accmod = 1
    local dmgmod = 1.0
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,1.5,2)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCE,info.hitslanded)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.PIERCE)
    return dmg
end