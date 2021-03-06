-----------------------------------
-- Area: Selbina
--  NPC: Vobo
-- Involved in Quest: Riding on the Clouds
-- !pos 37 -14 81 248
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
    if
        player:getQuestStatus(JEUNO, RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and
        player:getVar("ridingOnTheClouds_3") == 2 and
        npcUtil.tradeHas(trade, 1127)
    then
        player:setVar("ridingOnTheClouds_3", 0)
        npcUtil.giveKeyItem(player, dsp.ki.SOMBER_STONE)
        player:confirmTrade()
    end
end

function onTrigger(player,npc)
    player:startEvent(710)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end