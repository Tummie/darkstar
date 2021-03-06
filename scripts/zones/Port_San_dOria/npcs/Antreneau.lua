-----------------------------------
-- Area: Port San d'Oria
--  NPC: Antreneau
-- Type: Standard NPC
-- !pos -71 -5 -39 232
-- Involved in Quests: A Taste For Meat, Over The Hills And Far Away
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
     player:startEvent(532) -- What's this?  I don't need this.
end

function onTrigger(player,npc)

    local aTasteForMeat = player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT)
    local medicineWoman = player:getQuestStatus(SANDORIA, THE_MEDICINE_WOMAN)
    local diaryPage = player:getVar("DiaryPage")
    local fameLevel = player:getFameLevel(SANDORIA)

    if player:getVar("aTasteForMeat") == 0 and aTasteForMeat == QUEST_COMPLETED and fameLevel >= 8 and medicineWoman == QUEST_COMPLETED and diaryPage >= 4 then
        local overTheHillsAndFarAway = player:getQuestStatus(SANDORIA, OVER_THE_HILLS_AND_FAR_AWAY)

        if overTheHillsAndFarAway == QUEST_AVAILABLE then
            player:startEvent(725) -- Start
        elseif overTheHillsAndFarAway == QUEST_ACCEPTED then
            player:startEvent(726) -- Talks about the map.
        elseif overTheHillsAndFarAway == QUEST_COMPLETED then
            player:startEvent(727) -- Found his uncle Louverance.
        end
    else
        if aTasteForMeat == QUEST_COMPLETED and player:getVar("aTasteForMeat") == 1 then
            if player:getFreeSlotsCount() == 0 then
                player:startEvent(538) -- NPC knows when your inventory is full.
            else
                player:startEvent(530) -- Shares his Grilled Hare
            end
        elseif aTasteForMeat == QUEST_ACCEPTED then
            if player:hasItem(4358) then
                player:startEvent(531) -- Those are fine piece of hare meat, give them to the chef!
            else
                player:startEvent(525) -- By the Goddess...
            end
        elseif aTasteForMeat == QUEST_AVAILABLE and player:getVar("aTasteForMeat") == 0 then
            player:startEvent(527) -- Start
        else
            player:startEvent(533) -- Go on, take it.

            -- SE devs have a sense of humor.
            -- player:startEvent(534) -- What?  Something wrong with my food?
        end
    end
    
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if csid == 725 then
        player:addQuest(SANDORIA, OVER_THE_HILLS_AND_FAR_AWAY)
    else
        if csid == 527 then
            player:setVar("aTasteForMeat", 1)
        elseif csid == 530 then
            player:addItem(4371,1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4371)
            player:setVar("aTasteForMeat", 0)
        end
    end

end
