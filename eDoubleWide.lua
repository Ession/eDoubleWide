-- =============================================================================
--
--       Filename:  eDoubleWide.lua
--
--    Description:  Doubles the size of the professions windows.
--
--        Version:  5.0.1
--
--         Author:  Mathias Jost (mail@mathiasjost.com)
--
-- =============================================================================


-- -----------------------------------------------------------------------------
-- adjust the original tradeskill frames outer dimensions
-- -----------------------------------------------------------------------------
TradeSkillFrame:SetAttribute("UIPanelLayout-width", 695)
TradeSkillFrame:SetWidth(695)


-- -----------------------------------------------------------------------------
-- adjust the skill level bar
-- -----------------------------------------------------------------------------
-- skill level bar
TradeSkillRankFrame:ClearAllPoints()
TradeSkillRankFrame:SetPoint("TOPLEFT", 75, -38)
TradeSkillRankFrame:SetWidth(575)

-- skill level bar border
TradeSkillRankFrameBorder:SetTexture([[Interface\AddOns\eDoublewide\Textures\BarBorder]])
TradeSkillRankFrameBorder:ClearAllPoints()
TradeSkillRankFrameBorder:SetPoint("LEFT", -4, 0)
TradeSkillRankFrameBorder:SetWidth(584); TradeSkillRankFrameBorder:SetHeight(17)

--skill level bar text position
TradeSkillRankFrameSkillRank:ClearAllPoints()
TradeSkillRankFrameSkillRank:SetPoint("CENTER", TradeSkillRankFrame, 0, 1)


-- -----------------------------------------------------------------------------
-- adjust Filter Button and search box
-- -----------------------------------------------------------------------------
-- search box position
TradeSkillFrameSearchBox:SetWidth(500)

-- filter button position
TradeSkillFilterButton:ClearAllPoints()
TradeSkillFilterButton:SetPoint("TOPLEFT", 20, 10)


-- -----------------------------------------------------------------------------
-- add reset button to search box
-- -----------------------------------------------------------------------------
-- create the button
local sResetButton = CreateFrame("Button", "TradeSkillFrameEditBoxResetButton", TradeSkillFrameSearchBox)

-- set position, size and textures
sResetButton:SetWidth(38); sResetButton:SetHeight(38)
sResetButton:SetNormalTexture([[Interface\Buttons\CancelButton-Up]])
sResetButton:SetPushedTexture([[Interface\Buttons\CancelButton-Down]])
sResetButton:SetHighlightTexture([[Interface\Buttons\CancelButton-Highlight]], "ADD")
sResetButton:SetPoint("LEFT", TradeSkillFrameSearchBox, "RIGHT", -5, -2)

-- determine what the button does when clicked
sResetButton:SetScript("OnClick", function(self)

	if TradeSkillFrameSearchBox:HasFocus() then

		-- someone is using the box so empty it
		TradeSkillFrameSearchBox:SetText("")

	else

		-- no one is using the box so tell them what they can do
		TradeSkillFrameSearchBox:SetText(SEARCH)

	end

end)


-- -----------------------------------------------------------------------------
-- extend the list of recipes to fill the left side of the frame
-- -----------------------------------------------------------------------------
-- tells blizzard how many recipes they can display
TRADE_SKILLS_DISPLAYED = 19

-- create buttons for the tradeskills to display in
CreateFrame("Button", "TradeSkillSkill9",  TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill8,  "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill10", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill9,  "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill11", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill10, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill12", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill11, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill13", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill12, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill14", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill13, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill15", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill14, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill16", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill15, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill17", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill16, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill18", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill17, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill19", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill18, "BOTTOMLEFT")

-- extend the scroll bar and move it to the middle of the frame
TradeSkillListScrollFrame:ClearAllPoints()
TradeSkillListScrollFrame:SetPoint("TOPLEFT", 22, -86)
TradeSkillListScrollFrame:SetHeight(310)


-- -----------------------------------------------------------------------------
-- move the reagent liste and recipe details to the right side and extend them
-- -----------------------------------------------------------------------------
TradeSkillDetailScrollFrame:ClearAllPoints();
TradeSkillDetailScrollFrame:SetPoint("TOPLEFT", TradeSkillListScrollFrame, "TOPRIGHT", 35, -2)
TradeSkillDetailScrollFrame:SetWidth(298)
TradeSkillDetailScrollFrame:SetHeight(310)


-- -----------------------------------------------------------------------------
-- move the buttons on the bottom
-- -----------------------------------------------------------------------------
TradeSkillIncrementButton:ClearAllPoints()
TradeSkillIncrementButton:SetPoint("LEFT", TradeSkillInputBox, "LEFT", 30, 0)


-- -----------------------------------------------------------------------------
-- hide the center bar
-- -----------------------------------------------------------------------------
for i, region in ipairs({TradeSkillFrame:GetRegions()}) do
	if region:IsObjectType("Texture") then
		if region:GetName() == "TradeSkillHorizontalBarLeft" or region:GetName() == nil then
			region:Hide()
		end
	end
end

-- -----------------------------------------------------------------------------
-- fix the textures behind the scrollbar by adding new ones
-- -----------------------------------------------------------------------------
local function CreateTex(parent, tex, layer, width, height, ...)
	local texf = parent:CreateTexture(nil, layer)
	texf:SetPoint(...)
	texf:SetTexture(tex)
	texf:SetWidth(width); texf:SetHeight(height)
	return texf
end

CreateTex(TradeSkillListScrollFrame, [[Interface\ClassTrainerFrame\UI-ClassTrainer-ScrollBar]], "BACKGROUND", 30, 97.4, "LEFT", TradeSkillListScrollFrame, "RIGHT", -3, 0):SetTexCoord(0, 0.46875, 0.2, 0.9609375)
CreateTex(TradeSkillFrame, [[Interface\AddOns\eDoublewide\Textures\Top]], "BORDER", 311, 256, "TOPLEFT", 256, 12)
CreateTex(TradeSkillFrame, [[Interface\AddOns\eDoublewide\Textures\InspectBot]], "BORDER", 311, 256, "BOTTOMLEFT", TradeSkillFrame, "BOTTOMRIGHT", -439, -75)

