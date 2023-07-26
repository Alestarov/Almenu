Almenu = gui.get_tab("Al_Menu")

gui.show_message("Alestarov_Menu_V1.0_1.67")
gui.show_message("is Successfully launched!")

	Almenu:add_text("         Alestarov_Menu_V1.0_1.67 ")

AlmenuS = Almenu:add_tab("Snow")

----------------------------------------------------------


AlmenuS:add_button("Snow On", function ()
           globals.set_int(262145 + 4752, 1)
end)


AlmenuS:add_button("Snow Off", function ()
           globals.set_int(262145 + 4752, 0)
end)


AlmenuM = Almenu:add_tab("Money")

AlmenuM:add_text("Here are the best and safest ways to cheat money in GTA 5 online.")
AlmenuM:add_text("DO NOT GET A LOT OF MONEY, AND USE THE ''STAT EDITOR' SECTION FOR ACCOUNT SAFETY!!!")
ult = AlmenuM:add_tab("CEO")

Howtou = ult:add_tab("How to use CEO")

Howtou:add_text("For the buy Mission:")
Howtou:add_text("1) Go on the pc in ur ceo apartment")
Howtou:add_text("2) select ur warhouse and start the 1 Crate Mission for 2k$")
Howtou:add_text("3) when the mission started click on ''instant buy Crate'' -> now ur warehouse is full.")

Howtou:add_separator()

Howtou:add_text("How to get money")
Howtou:add_text(" Enter ur Laptop at the Warehouse when the Laptopscreen shows up -> Quit the Laptop and start the Script")
Howtou:add_text("Disable it and everything is normal again")



checkbox = ult:add_checkbox("Enable YimCeo")
script.register_looped("yimceoloop", function (script)
    globals.set_int(278108, 6000000)
    globals.set_int(277873, 0)
    globals.set_int(277874, 0)
    script:yield()

    if checkbox:is_enabled() == true then
        if locals.get_int("gb_contraband_sell", 2) == 1 then
            locals.set_int("gb_contraband_sell", 1136, 1)
            locals.set_int("gb_contraband_sell", 596, 0)
            locals.set_int("gb_contraband_sell", 1125, 0) 
            locals.set_int("gb_contraband_sell", 548, 7)
            script:sleep(500)
            locals.set_int("gb_contraband_sell", 542, 99999)  
        end
        if locals.get_int("appsecuroserv", 2) == 1 then
            script:sleep(500)
            locals.set_int("appsecuroserv", 737, 1)
            script:sleep(200)
            locals.set_int("appsecuroserv", 738, 1)
            script:sleep(200)
            locals.set_int("appsecuroserv", 556, 3012)
            script:sleep(1000)
        end
        if locals.get_int("gb_contraband_buy", 2) == 1 then
            locals.set_int("gb_contraband_buy", 604, 1)
            locals.set_int("gb_contraband_buy", 600, 111)
            locals.set_int("gb_contraband_buy", 790, 6)
            locals.set_int("gb_contraband_buy", 791, 4)
            gui.show_message("Storage is now full!")
        end
        if locals.get_int("gb_contraband_sell", 2) ~= 1 then  
            script:sleep(500)
            if locals.get_int("am_mp_warehouse", 2) == 1 then
                SCRIPT.REQUEST_SCRIPT("appsecuroserv")
                SYSTEM.START_NEW_SCRIPT("appsecuroserv", 8344)
                SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED("appsecuroserv")
            end
        end
    end
    script:sleep(500)
end)


casino_gui = AlmenuM:add_tab("Casino")

blackjack_cards         = 112
blackjack_table_players = 1772
blackjack_decks         = 846

three_card_poker_cards           = blackjack_cards
three_card_poker_table           = 745
three_card_poker_current_deck    = 168
three_card_poker_anti_cheat      = 1034
three_card_poker_anti_cheat_deck = 799
three_card_poker_deck_size       = 55

roulette_master_table   = 120
roulette_outcomes_table = 1357
roulette_ball_table     = 153

slots_random_results_table = 1344

prize_wheel_win_state   = 276
prize_wheel_prize       = 14
prize_wheel_prize_state = 45

globals_tuneable        = 262145

casino_heist_cut        = 1971696
casino_heist_cut_offset = 1497 + 736 + 92
casino_heist_lester_cut = 28998
casino_heist_gunman_cut = 29024
casino_heist_driver_cut = 29029
casino_heist_hacker_cut = 29035

casino_heist_approach      = 0
casino_heist_target        = 0
casino_heist_last_approach = 0
casino_heist_hard          = 0
casino_heist_gunman        = 0
casino_heist_driver        = 0
casino_heist_hacker        = 0
casino_heist_weapons       = 0
casino_heist_cars          = 0
casino_heist_masks         = 0

fm_mission_controller_cart_grab       = 10247
fm_mission_controller_cart_grab_speed = 14
fm_mission_controller_cart_autograb   = true

mpply_last_mp_char = -1

casino_gui:add_text("Chips can be bought")

casino_gui:add_button("Chips set to 1000000000", function()
    script.run_in_fiber(function (script)
        STATS.STAT_SET_INT(joaat("MPPLY_CASINO_CHIPS_PUR_GD"), -1000000000, true)
    end)
end)

casino_gui:add_button("Chips reset to 0", function()
    script.run_in_fiber(function (script)
        STATS.STAT_SET_INT(joaat("MPPLY_CASINO_CHIPS_PUR_GD"), 0, true)
    end)
end)


casino_gui:add_separator()



casino_gui:add_text("Poker") --If his name is Al Pacino and he said, "It's not Al anymore, it's Dunk!", then his name should now be Dunk Pacino.
force_poker_cards = casino_gui:add_checkbox("Force all Players Hands to Royal Flush")
casino_gui:add_sameline()
set_dealers_poker_cards = casino_gui:add_checkbox("Force Dealer's Hand to Bad Beat")
set_dealers_poker_cards:set_enabled(False)

function set_character_stat (stat_name, value_to_set)
    STATS.STAT_SET_INT(joaat("MP"..mpply_last_mp_char.."_"..stat_name), value_to_set, true)
end

function get_character_stat (stat_name)
    _,retval = STATS.STAT_GET_INT(joaat("MP"..mpply_last_mp_char.."_"..stat_name), 0, -1)
    return retval
end

function set_poker_cards(player_id, players_current_table, card_one, card_two, card_three)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (player_id * 3), card_one)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (1) + (player_id * 3), card_one)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (player_id * 3), card_two)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (player_id * 3), card_two)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (player_id * 3), card_three)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (3) + (player_id * 3), card_three)
end

function get_cardname_from_index(card_index)
    if card_index == 0 then
        return "Rolling"
    end

    local card_number = math.fmod(card_index, 13)
    local cardName = ""
    local cardSuit = ""

    if card_number == 1 then
        cardName = "Ace"
    elseif card_number == 11 then
        cardName = "Jack"
    elseif card_number == 12 then
        cardName = "Queen"
    elseif card_number == 13 then
        cardName = "King"
    else
        cardName = tostring(card_number)
    end

    if card_index >= 1 and card_index <= 13 then
        cardSuit = "Clubs"
    elseif card_index >= 14 and card_index <= 26 then
        cardSuit = "Diamonds"
    elseif card_index >= 27 and card_index <= 39 then
        cardSuit = "Hearts"
    elseif card_index >= 40 and card_index <= 52 then
        cardSuit = "Spades"
    end

    return cardName .. " of " .. cardSuit
end

casino_gui:add_separator()
casino_gui:add_text("Blackjack")
casino_gui:add_text("Dealer's face down card: ")
casino_gui:add_sameline()
dealers_card_gui_element = casino_gui:add_input_string("##dealers_card_gui_element")

casino_gui:add_button("Set Dealer's Hand To Bust", function()
    script.run_in_fiber(function (script)
        local player_id = PLAYER.PLAYER_ID()
        while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 3, 0) ~= player_id do 
            network.force_script_host("blackjack")
            gui.show_message("CasinoPacino", "Taking control of the blackjack script.") --If you see this spammed, someone if fighting you for control.
            script:yield()
        end
        local blackjack_table = locals.get_int("blackjack", blackjack_table_players + 1 + (player_id * 8) + 4) --The Player's current table he is sitting at.
        if blackjack_table ~= -1 then
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1, 11)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 2, 12)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 3, 13)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 12, 3)
        end
    end)
end)

casino_gui:add_separator()
casino_gui:add_text("Roulette")
force_roulette_wheel = casino_gui:add_checkbox("Force Roulette Wheel to Land On Red 18")

casino_gui:add_separator()
casino_gui:add_text("Slots")
rig_slot_machine = casino_gui:add_checkbox("Rig Slot Machines")
rig_slot_machine_keeper = false

--TWVuIGFyZSBub3Qgd29tZW47IHRyYW5zZ2VuZGVycyBhcmUgbWVudGFsbHkgaWxsIGF1dGlzdGljcy4=

casino_gui:add_separator()
casino_gui:add_text("Casino Heist")

casino_gui:add_imgui(function()
    ImGui.PushItemWidth(165)
    new_approach, approach_clicked = ImGui.Combo("Approach", casino_heist_approach, { "Unselected", "Silent & Sneaky", "The Big Con", "Aggressive" }, 4) --You gotta sneak the word in there, like you're sneaking in food to a movie theater. Tuck it in your jacket for later, then when they least suspect it, deploy the word.
    if approach_clicked then
        set_character_stat("H3OPT_APPROACH", new_approach)
    end
    ImGui.SameLine()
    ImGui.Dummy(24, 0)
    ImGui.SameLine()
    new_target, target_clicked = ImGui.Combo("Target", casino_heist_target, { "Money", "Gold", "Art", "Diamonds" }, 4)
    if target_clicked then
        set_character_stat("H3OPT_TARGET", new_target)
    end
    new_last_approach, last_approach_clicked = ImGui.Combo("Last Approach", casino_heist_last_approach, { "Unselected", "Silent & Sneaky", "The Big Con", "Aggressive" }, 4)
    if last_approach_clicked then
        set_character_stat("H3_LAST_APPROACH", new_last_approach)
    end
    ImGui.SameLine()
    new_hard_approach, hard_approach_clicked = ImGui.Combo("Hard Approach", casino_heist_hard, { "Unselected", "Silent & Sneaky", "The Big Con", "Aggressive" }, 4)
    if hard_approach_clicked then
        set_character_stat("H3_HARD_APPROACH", new_hard_approach)
    end
    ImGui.PopItemWidth()
    
    ImGui.PushItemWidth(165)
    new_gunman, gunman_clicked = ImGui.Combo("Gunman", casino_heist_gunman, { "Unselected", "Karl Abolaji", "Gustavo Mota", "Charlie Reed", "Chester McCoy", "Patrick McReary" }, 6)
    if gunman_clicked then
        set_character_stat("H3OPT_CREWWEAP", new_gunman)
    end
    ImGui.SameLine()
    new_driver, driver_clicked = ImGui.Combo("Driver", casino_heist_driver, { "Unselected", "Karim Deniz", "Taliana Martinez", "Eddie Toh", "Zach Nelson", "Chester McCoy" }, 6)
    if driver_clicked then
        set_character_stat("H3OPT_CREWDRIVER", new_driver)
    end
    ImGui.SameLine()
    new_hacker, hacker_clicked = ImGui.Combo("Hacker", casino_heist_hacker, { "Unselected", "Rickie Lukens", "Christian Feltz", "Yohan Blair", "Avi Schwartzman", "Page Harris" }, 6)
    if hacker_clicked then
        set_character_stat("H3OPT_CREWHACKER", new_hacker)
    end
    
    if casino_heist_gunman == 1 then --Karl Abolaji
        local karl_gun_list = { {"##1", "##2"}, { "Micro SMG Loadout", "Machine Pistol Loadout" }, { "Micro SMG Loadout", "Shotgun Loadout" }, { "Shotgun Loadout", "Revolver Loadout" } }
        new_weapons, weapons_clicked = ImGui.Combo("Unmarked Weapons", casino_heist_weapons, karl_gun_list[casino_heist_approach+1], 2)
        if weapons_clicked then
            set_character_stat("H3OPT_WEAPS", new_weapons)
        end
        ImGui.SameLine()
    elseif casino_heist_gunman == 2 then --Gustavo Fring
        new_weapons, weapons_clicked = ImGui.Combo("Unmarked Weapons", casino_heist_weapons, { "Rifle Loadout", "Shotgun Loadout" }, 2)
        if weapons_clicked then
            set_character_stat("H3OPT_WEAPS", new_weapons)
        end
        ImGui.SameLine()
    elseif casino_heist_gunman == 3 then --Charlie Reed
        local charlie_gun_list = { {"##1", "##2"}, { "SMG Loadout", "Shotgun Loadout" }, { "Machine Pistol Loadout", "Shotgun Loadout" }, { "SMG Loadout", "Shotgun Loadout" } }
        new_weapons, weapons_clicked = ImGui.Combo("Unmarked Weapons", casino_heist_weapons, charlie_gun_list[casino_heist_approach+1], 2)
        if weapons_clicked then
            set_character_stat("H3OPT_WEAPS", new_weapons)
        end
        ImGui.SameLine()
    elseif casino_heist_gunman == 4 then --Chester McCoy
        local chester_gun_list = { {"##1", "##2"}, { "MK II Shotgun Loadout", "MK II Rifle Loadout" }, { "MK II SMG Loadout", "MK II Rifle Loadout" }, { "MK II Shotgun Loadout", "MK II Rifle Loadout" } }
        new_weapons, weapons_clicked = ImGui.Combo("Unmarked Weapons", casino_heist_weapons, chester_gun_list[casino_heist_approach+1], 2)
        if weapons_clicked then
            set_character_stat("H3OPT_WEAPS", new_weapons)
        end
        ImGui.SameLine()
    elseif casino_heist_gunman == 5 then --Laddie Paddie Sadie Enweird
        local laddie_paddie_gun_list = { {"##1", "##2"}, { "Combat PDW Loadout", "Rifle Loadout" }, { "Shotgun Loadout", "Rifle Loadout" }, { "Shotgun Loadout", "Combat MG Loadout" } }
        new_weapons, weapons_clicked = ImGui.Combo("Unmarked Weapons", casino_heist_weapons, laddie_paddie_gun_list[casino_heist_approach+1], 2)
        if weapons_clicked then
            set_character_stat("H3OPT_WEAPS", new_weapons)
        end
        ImGui.SameLine()
    end
    
    if casino_heist_driver == 1 then --Karim Deniz
        new_car, car_clicked = ImGui.Combo("Getaway Vehicles", casino_heist_cars, { "Issi Classic", "Asbo", "Kanjo", "Sentinel Classic" }, 4)
        if car_clicked then
            set_character_stat("H3OPT_VEHS", new_car)
        end
    elseif casino_heist_driver == 2 then --Taliana Martinez
        new_car, car_clicked = ImGui.Combo("Getaway Vehicles", casino_heist_cars, { "Retinue MK II", "Drift Yosemite", "Sugoi", "Jugular" }, 4)
        if car_clicked then
            set_character_stat("H3OPT_VEHS", new_car)
        end
    elseif casino_heist_driver == 3 then --Eddie Toh
        new_car, car_clicked = ImGui.Combo("Getaway Vehicles", casino_heist_cars, { "Sultan Classic", "Guantlet Classic", "Ellie", "Komoda" }, 4)
        if car_clicked then
            set_character_stat("H3OPT_VEHS", new_car)
        end
    elseif casino_heist_driver == 4 then --Zach Nelson
        new_car, car_clicked = ImGui.Combo("Getaway Vehicles", casino_heist_cars, { "Manchez", "Stryder", "Defiler", "Lectro" }, 4)
        if car_clicked then
            set_character_stat("H3OPT_VEHS", new_car)
        end
    elseif casino_heist_driver == 5 then --Chester McCoy
        new_car, car_clicked = ImGui.Combo("Getaway Vehicles", casino_heist_cars, { "Zhaba", "Vagrant", "Outlaw", "Everon" }, 4)
        if car_clicked then
            set_character_stat("H3OPT_VEHS", new_car)
        end
    end
    
    new_masks, masks_clicked = ImGui.Combo("Masks", casino_heist_masks, { "Unselected", "Geometric Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set", "Gurilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Set", "Hockey Set" }, 13)
    if masks_clicked then
        set_character_stat("H3OPT_MASKS", new_masks)
    end
    ImGui.SameLine()
    fm_mission_controller_cart_autograb,_ = ImGui.Checkbox("Auto Grab Cash/Gold/Diamonds", fm_mission_controller_cart_autograb)
end)

casino_gui:add_button("Unlock All Heist Options", function ()
    script.run_in_fiber(function (script)
        set_character_stat("H3OPT_ACCESSPOINTS", -1)
        set_character_stat("H3OPT_POI", -1)
        set_character_stat("H3OPT_BITSET0", -1)
        set_character_stat("H3OPT_BITSET1", -1)
        set_character_stat("H3OPT_BODYARMORLVL", 3)
        set_character_stat("H3OPT_DISRUPTSHIP", 3)
        set_character_stat("H3OPT_KEYLEVELS", 2)
        set_character_stat("H3_COMPLETEDPOSIX", 0)
        set_character_stat("CAS_HEIST_FLOW", -1)
        STATS.STAT_SET_INT(joaat("MPPLY_H3_COOLDOWN"), 0, true)
        STATS.SET_PACKED_STAT_BOOL_CODE(26969, 1, mpply_last_mp_char) --Unlock High Roller
    end)
end)
casino_gui:add_sameline()
casino_gui:add_button("Set AI Crew Cuts to 0%", function ()
    globals.set_int(globals_tuneable + casino_heist_lester_cut, 0)
    globals.set_int(globals_tuneable + casino_heist_gunman_cut, 0)
    globals.set_int(globals_tuneable + casino_heist_gunman_cut + 1, 0)
    globals.set_int(globals_tuneable + casino_heist_gunman_cut + 2, 0)
    globals.set_int(globals_tuneable + casino_heist_gunman_cut + 3, 0)
    globals.set_int(globals_tuneable + casino_heist_gunman_cut + 4, 0)
    globals.set_int(globals_tuneable + casino_heist_driver_cut, 0)
    globals.set_int(globals_tuneable + casino_heist_driver_cut + 1, 0)
    globals.set_int(globals_tuneable + casino_heist_driver_cut + 2, 0)
    globals.set_int(globals_tuneable + casino_heist_driver_cut + 3, 0)
    globals.set_int(globals_tuneable + casino_heist_driver_cut + 4, 0)
    globals.set_int(globals_tuneable + casino_heist_hacker_cut, 0)
    globals.set_int(globals_tuneable + casino_heist_hacker_cut + 1, 0)
    globals.set_int(globals_tuneable + casino_heist_hacker_cut + 2, 0)
    globals.set_int(globals_tuneable + casino_heist_hacker_cut + 3, 0)
    globals.set_int(globals_tuneable + casino_heist_hacker_cut + 4, 0)
end)
casino_gui:add_sameline()
casino_gui:add_button("Set All Cuts to 100%", function ()
    globals.set_int(casino_heist_cut + casino_heist_cut_offset + 1, 100)
    globals.set_int(casino_heist_cut + casino_heist_cut_offset + 2, 100)
    globals.set_int(casino_heist_cut + casino_heist_cut_offset + 3, 100)
    globals.set_int(casino_heist_cut + casino_heist_cut_offset + 4, 100)
end)

script.register_looped("Casino Pacino Thread", function (script)
    if force_poker_cards:is_enabled() then
        local player_id = PLAYER.PLAYER_ID()
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("three_card_poker")) ~= 0 then
            while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 3, 0) ~= player_id do 
                network.force_script_host("three_card_poker")
                gui.show_message("CasinoPacino", "Taking control of the three_card_poker script.") --If you see this spammed, someone if fighting you for control.
                script:sleep(500)
            end
            local players_current_table = locals.get_int("three_card_poker", three_card_poker_table + 1 + (player_id * 9) + 2) --The Player's current table he is sitting at.
            if (players_current_table ~= -1) then -- If the player is sitting at a poker table
                local player_0_card_1 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (0 * 3))
                local player_0_card_2 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (0 * 3))
                local player_0_card_3 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (0 * 3))
                if player_0_card_1 ~= 50 or player_0_card_2 ~= 51 or player_0_card_3 ~= 52 then --Check if we need to overwrite the deck.
                    local total_players = 0
                    for player_iter = 0, 31, 1 do
                        local player_table = locals.get_int("three_card_poker", three_card_poker_table + 1 + (player_iter * 9) + 2)
                        if player_iter ~= player_id and player_table == players_current_table then --An additional player is sitting at the user's table.
                            total_players = total_players + 1
                        end
                    end
                    for playing_player_iter = 0, total_players, 1 do
                        set_poker_cards(playing_player_iter, players_current_table, 50, 51, 52)
                    end
                    if set_dealers_poker_cards:is_enabled() then
                        set_poker_cards(total_players + 1, players_current_table, 1, 8, 22)
                    end
                end
            end
        end
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("blackjack")) ~= 0 then
        local dealers_card = 0
        local blackjack_table = locals.get_int("blackjack", blackjack_table_players + 1 + (PLAYER.PLAYER_ID() * 8) + 4) --The Player's current table he is sitting at.
        if blackjack_table ~= -1 then
            dealers_card = locals.get_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1) --Dealer's facedown card.
            dealers_card_gui_element:set_value(get_cardname_from_index(dealers_card))
        else
            dealers_card_gui_element:set_value("Not sitting at a Blackjack table.")
        end
    else
        dealers_card_gui_element:set_value("Not in Casino.")
    end
    if force_roulette_wheel:is_enabled() then
        local player_id = PLAYER.PLAYER_ID()
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casinoroulette")) ~= 0 then
            while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 3, 0) ~= player_id do 
                network.force_script_host("casinoroulette")
                gui.show_message("CasinoPacino", "Taking control of the casinoroulette script.") --If you see this spammed, someone if fighting you for control.
                script:sleep(500)
            end
            for tabler_iter = 0, 6, 1 do
                locals.set_int("casinoroulette", (roulette_master_table) + (roulette_outcomes_table) + (roulette_ball_table) + (tabler_iter), 18)
            end
        end
    end
    if rig_slot_machine_keeper ~= rig_slot_machine:is_enabled() then
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_slots")) ~= 0 then
            rig_slot_machine_keeper = rig_slot_machine:is_enabled()
            for slots_iter = 3, 195, 1 do
                if slots_iter ~= 67 and slots_iter ~= 132 then
                    local slot_result = 6
                    if rig_slot_machine_keeper == false then
                        math.randomseed(os.time()+slots_iter)
                        slot_result = math.random(0, 7)
                    end
                    locals.set_int("casino_slots", (slots_random_results_table) + (slots_iter), slot_result)
                end
            end
        end
    end
    if gui.is_open() and casino_gui:is_selected() then
        _,mpply_last_mp_char = STATS.STAT_GET_INT(joaat("MPPLY_LAST_MP_CHAR"), 0, 1)
        casino_heist_approach = get_character_stat("H3OPT_APPROACH")
        casino_heist_target = get_character_stat("H3OPT_TARGET")
        casino_heist_last_approach = get_character_stat("H3_LAST_APPROACH")
        casino_heist_hard = get_character_stat("H3_HARD_APPROACH")
        casino_heist_gunman = get_character_stat("H3OPT_CREWWEAP")
        casino_heist_driver = get_character_stat("H3OPT_CREWDRIVER")
        casino_heist_hacker = get_character_stat("H3OPT_CREWHACKER")
        casino_heist_weapons = get_character_stat("H3OPT_WEAPS")
        casino_heist_cars = get_character_stat("H3OPT_VEHS")
        casino_heist_masks = get_character_stat("H3OPT_MASKS")
    end
    if HUD.IS_PAUSE_MENU_ACTIVE() then
        PAD.DISABLE_CONTROL_ACTION(0, 348, true)
        PAD.DISABLE_CONTROL_ACTION(0, 204, true)
    end
    if fm_mission_controller_cart_autograb then
        if locals.get_int("fm_mission_controller", fm_mission_controller_cart_grab) == 3 then
            locals.set_int("fm_mission_controller", fm_mission_controller_cart_grab, 4)
        elseif locals.get_int("fm_mission_controller", fm_mission_controller_cart_grab) == 4 then
            locals.set_float("fm_mission_controller", fm_mission_controller_cart_grab + fm_mission_controller_cart_grab_speed, 2)
        end
    end
end)


AlmenuS = Almenu:add_tab("Stat Editor")

AlmenuS:add_text("Use ''Reset 1'' player or ''Reset 2 player'' and change session and exit the game to apply changes")

AlmenuS:add_separator()

AlmenuS:add_button("Reset 1 player", function()
    script.run_in_fiber(function (script)
        STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_EVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_SVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_JOBS"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MOEARN_SHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_JOBSHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_NEY_EARN_SELLING_VEH"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_WEAPON_ARMOR"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_VEH_MAINTENANCE"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_STYLE_ENT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_PROPERTY_UTIL"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_JOB_ACTIVITY"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_CLUB_DANCING"), 0, true)
	end)
end)

AlmenuS:add_button("Reset 2 player", function()
    script.run_in_fiber(function (script)
        STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_EVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_SVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_JOBS"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MOEARN_SHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_JOBSHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_NEY_EARN_SELLING_VEH"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_WEAPON_ARMOR"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_VEH_MAINTENANCE"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_STYLE_ENT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_PROPERTY_UTIL"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_JOB_ACTIVITY"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_CLUB_DANCING"), 0, true)
	end)
end)

AlmenuCredits = Almenu:add_tab("Credits")

Yimura = AlmenuCredits:add_tab("Yimura")
Yimura:add_text("Yim Menu Cheat creator")
Yimura:add_text("GitHub:")
Yimura:add_text("https://github.com/YimMenu/YimMenu")

Alestarov = AlmenuCredits:add_tab("Alestarov")
Alestarov:add_text("compiled a script")
Alestarov:add_text("GitHub:")
Alestarov:add_text("https://github.com/Alestarov")

xiaoxiao921 = AlmenuCredits:add_tab("xiaoxiao921")
xiaoxiao921:add_text("Helped with writing code")
xiaoxiao921:add_text("GitHub:")
xiaoxiao921:add_text("https://github.com/xiaoxiao921")

SLON = AlmenuCredits:add_tab("SLON")
SLON:add_text("The code from the script ''YimCeo v0.3 by Slon_.lua'' was implemented")
SLON:add_text("Scrip on unknowncheats.me:")
SLON:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")

gir489returns = AlmenuCredits:add_tab("gir489returns")
gir489returns:add_text("The code from the script ''Casino Pacino.lua'' was implemented")
gir489returns:add_text("Scrip on unknowncheats.me:")
gir489returns:add_text("https://github.com/YimMenu-Lua/Casino-Pacino/blob/main/CasinoPacino.lua")
