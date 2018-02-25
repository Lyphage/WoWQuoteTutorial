local moduleName = "QuoteMediaMYNAME";							
local moduleid = "ani";									
local moduleData = nil;
local frame = CreateFrame("Frame", ""..moduleName.."FakeFrame"); 				

function QuoteMediaMYNAME_OnEvent(this, event, arg1, arg2, arg3, arg4, ...) 	
    if ((event == "ADDON_LOADED") and (arg1 == moduleName)) then
	
        if (IsAddOnLoaded("SoundDelivery") or IsAddOnLoaded("WoWQuote2") or IsAddOnLoaded("KQuote")) then
            QuoteMediaAnimu_Init();		
			if (IsAddOnLoaded("SoundDelivery")) then
                SD_InitModule(moduleData);
            end
			-- !!!
            if (IsAddOnLoaded("WoWQuote2")) then
                WQ2_InitModule(moduleData);
            end
			
            if (IsAddOnLoaded("KQuote")) then
                KQ_InitModule(moduleData);
            end            
        else
            DEFAULT_CHAT_FRAME:AddMessage(moduleName..": Please install KQuote, WoWQuote2, SoundDelivery!",1.0,0.0,0.0);
        end
        frame:UnregisterEvent("ADDON_LOADED");
    end
end

frame:SetScript("OnEvent", QuoteMediaMYNAME_OnEvent);						
frame:RegisterEvent("ADDON_LOADED");

function QuoteMediaMYNAME_Init()											
    moduleData = {
    	name = "animu",
        moduleid = moduleid,
        mediapath = "Interface\\AddOns\\"..moduleName.."\\media\\",
        mediadata = nil
    }

moduleData.mediadata =
{
	{

		id = "ani:001",
		file = "BATTLE!!.mp3",
		len = 109,
		msg = "One Punch Man",
		tag = "Music",

	},
	{
		id = "ani:002",
		file = "MLG2.mp3",
		len = 35,
		msg = "Boss gelegt MLG version",
		tag = "Music",

	},
};
end

