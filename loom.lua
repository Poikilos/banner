local dyes = {
	{"white",      "White",      nil},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}


weave = {}
give = {}
minetest.register_node("banner:loom_1",  {
	description = ("Loom"), 
	drawtype = "nodebox", 
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.125, -0.5, 0.5, -0.0625, 0.5}, -- Base
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125}, -- support
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125}, -- support2
			{-0.5, 0.375, -0.4375, 0.5, 0.4375, -0.375}, -- bobbin_holder
			{-0.25, 0.3125, -0.5, 0.25, 0.5, -0.3125}, -- bobbin
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, -- support3
			{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5}, -- support4
			{-0.5, 0.375, 0.375, 0.5, 0.4375, 0.4375}, -- bobbin_holder2
			{-0.25, 0.3125, 0.3125, 0.25, 0.5, 0.5}, -- bobbin2
		},
	},
	tiles = {"loom_top_1.png",
		"loom_top.png",
		"loom_front.png"},
	paramtype = "light", 
	sunlight_propagates = true,
	paramtype2 = "facedir", 
	groups = {choppy = 2,oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
		on_punch = function(pos)
		minetest.set_node(pos, {name="banner:loom_2"})
	end,
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local timer = minetest.get_node_timer(pos)
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Loom in mode 1 (owned by " .. (placer:get_player_name() or "") .. ")");
		timer:start(10)
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("craft1") then
		return false
	elseif not inv:is_empty("craft2") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[10.5,10;]"..
		"background[-0.15,-0.25;10.90,10.75;loom_top.png]"..

		"label[1.5,0.5;  Weave Banners]"..
		"list[current_name;craft1;2,1;1,1; ]"..
		"list[current_name;craft2;2,2;1,1; ]"..
		"button[4,1;1.5,1;make;Weave]"..
		"list[current_name;res;7.5,1.5;1,1;]"..

		"list[current_player;main;1,6;8,4;]")
	meta:set_string("infotext", "Loom")
	local inv = meta:get_inventory()
	inv:set_size("craft1", 1)
	inv:set_size("craft2", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

	local craftstack1 = inv:get_stack("craft1", 1)
	local craftstack2 = inv:get_stack("craft2", 1)
	local resstack = inv:get_stack("res", 1)

	local craftstackone = craftstack1:get_name()
	local craftstacktwo = craftstack2:get_name()
	--print(craftstackone)
	--print(craftstacktwo)
		
	if craftstackone == "wool:white" then
		craftstackone = "white"
	elseif craftstackone == "wool:grey" then
		craftstackone = "grey"
	elseif craftstackone == "wool:black" then
		craftstackone = "black"
	elseif craftstackone == "wool:red" then
		craftstackone = "red"
	elseif craftstackone == "wool:yellow" then
		craftstackone = "yellow"
	elseif craftstackone == "wool:green" then
		craftstackone = "green"
	elseif craftstackone == "wool:cyan" then
		craftstackone = "cyan"
	elseif craftstackone == "wool:blue" then
		craftstackone = "blue"
	elseif craftstackone == "wool:magenta" then
		craftstackone = "magenta"
	elseif craftstackone == "wool:orange" then
		craftstackone = "orange"
	elseif craftstackone == "wool:violet" then
		craftstackone = "violet"
	elseif craftstackone == "wool:brown" then
		craftstackone = "brown"
	elseif craftstackone == "wool:pink" then
		craftstackone = "pink"
	elseif craftstackone == "wool:dark_grey" then
		craftstackone = "dark_grey"
	elseif craftstackone == "wool:dark_green" then
		craftstackone = "dark_green"
	else
		craftstackone = "ERROR NOT WOOL"
	end
	--print(craftstackone)

	if craftstacktwo == "wool:white" then
		craftstacktwo = "white"
	elseif craftstacktwo == "wool:grey" then
		craftstacktwo = "grey"
	elseif craftstacktwo == "wool:black" then
		craftstacktwo = "black"
	elseif craftstacktwo == "wool:red" then
		craftstacktwo = "red"
	elseif craftstacktwo == "wool:yellow" then
		craftstacktwo = "yellow"
	elseif craftstacktwo == "wool:green" then
		craftstacktwo = "green"
	elseif craftstacktwo == "wool:cyan" then
		craftstacktwo = "cyan"
	elseif craftstacktwo == "wool:blue" then
		craftstacktwo = "blue"
	elseif craftstacktwo == "wool:magenta" then
		craftstacktwo = "magenta"
	elseif craftstacktwo == "wool:orange" then
		craftstacktwo = "orange"
	elseif craftstacktwo == "wool:violet" then
		craftstacktwo = "violet"
	elseif craftstacktwo == "wool:brown" then
		craftstacktwo = "brown"
	elseif craftstacktwo == "wool:pink" then
		craftstacktwo = "pink"
	elseif craftstacktwo == "wool:dark_grey" then
		craftstacktwo = "dark_grey"
	elseif craftstacktwo == "wool:dark_green" then
		craftstacktwo = "dark_green"
	else
		craftstacktwo = "ERROR NOT WOOL"
	end
	--print(craftstacktwo)

	if craftstackone == craftstacktwo then
		give = "banner:"..craftstackone
		--print(give)
		weave = "1"
	elseif craftstackone ~= craftstacktwo then
		give = "banner:"..craftstackone.."_"..craftstacktwo.."check"
		--print(give)
		weave = "1"
	else
		print("something has gone terribly wrong here")
	end
		if weave == "1" then
			inv:add_item("res",give)
			craftstack1:take_item()
			inv:set_stack("craft1",1,craftstack1)
			craftstack2:take_item()
			inv:set_stack("craft2",1,craftstack2)
		end


end
})
minetest.register_node("banner:loom_2",  {
	description = ("Loom"), 
	drawtype = "nodebox", 
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.125, -0.5, 0.5, -0.0625, 0.5}, -- Base
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125}, -- support
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125}, -- support2
			{-0.5, 0.375, -0.4375, 0.5, 0.4375, -0.375}, -- bobbin_holder
			{-0.25, 0.3125, -0.5, 0.25, 0.5, -0.3125}, -- bobbin
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, -- support3
			{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5}, -- support4
			{-0.5, 0.375, 0.375, 0.5, 0.4375, 0.4375}, -- bobbin_holder2
			{-0.25, 0.3125, 0.3125, 0.25, 0.5, 0.5}, -- bobbin2
		},
	},
	tiles = {"loom_top_2.png",
		"loom_top.png",
		"loom_front.png"},
	paramtype = "light",
	drop = "banner:loom_1",
	sunlight_propagates = true,
	paramtype2 = "facedir", 
	groups = {choppy = 2,oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, puncher)
		minetest.set_node(pos, {name="banner:loom_1"})
	end,
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local timer = minetest.get_node_timer(pos)
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Loom in mode 2 (owned by " .. (placer:get_player_name() or "") .. ")");
		timer:start(10)
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("craft1") then
		return false
	elseif not inv:is_empty("craft2") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[10.5,10;]"..
		"background[-0.15,-0.25;10.90,10.75;loom_top.png]"..

		"label[1.5,0.5;  Weave Banners]"..
		"list[current_name;craft1;2,1;1,1; ]"..
		"list[current_name;craft2;2,2;1,1; ]"..
		"button[4,1;1.5,1;make;Weave]"..
		"list[current_name;res;7.5,1.5;1,1;]"..

		"list[current_player;main;1,6;8,4;]")
	meta:set_string("infotext", "Loom")
	local inv = meta:get_inventory()
	inv:set_size("craft1", 1)
	inv:set_size("craft2", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

	local craftstack1 = inv:get_stack("craft1", 1)
	local craftstack2 = inv:get_stack("craft2", 1)
	local resstack = inv:get_stack("res", 1)

	local craftstackone = craftstack1:get_name()
	local craftstacktwo = craftstack2:get_name()
	--print(craftstackone)
	--print(craftstacktwo)
		
	if craftstackone == "wool:white" then
		craftstackone = "white"
	elseif craftstackone == "wool:grey" then
		craftstackone = "grey"
	elseif craftstackone == "wool:black" then
		craftstackone = "black"
	elseif craftstackone == "wool:red" then
		craftstackone = "red"
	elseif craftstackone == "wool:yellow" then
		craftstackone = "yellow"
	elseif craftstackone == "wool:green" then
		craftstackone = "green"
	elseif craftstackone == "wool:cyan" then
		craftstackone = "cyan"
	elseif craftstackone == "wool:blue" then
		craftstackone = "blue"
	elseif craftstackone == "wool:magenta" then
		craftstackone = "magenta"
	elseif craftstackone == "wool:orange" then
		craftstackone = "orange"
	elseif craftstackone == "wool:violet" then
		craftstackone = "violet"
	elseif craftstackone == "wool:brown" then
		craftstackone = "brown"
	elseif craftstackone == "wool:pink" then
		craftstackone = "pink"
	elseif craftstackone == "wool:dark_grey" then
		craftstackone = "dark_grey"
	elseif craftstackone == "wool:dark_green" then
		craftstackone = "dark_green"
	else
		craftstackone = "ERROR NOT WOOL"
	end
	print(craftstackone)

	if craftstacktwo == "wool:white" then
		craftstacktwo = "white"
	elseif craftstacktwo == "wool:grey" then
		craftstacktwo = "grey"
	elseif craftstacktwo == "wool:black" then
		craftstacktwo = "black"
	elseif craftstacktwo == "wool:red" then
		craftstacktwo = "red"
	elseif craftstacktwo == "wool:yellow" then
		craftstacktwo = "yellow"
	elseif craftstacktwo == "wool:green" then
		craftstacktwo = "green"
	elseif craftstacktwo == "wool:cyan" then
		craftstacktwo = "cyan"
	elseif craftstacktwo == "wool:blue" then
		craftstacktwo = "blue"
	elseif craftstacktwo == "wool:magenta" then
		craftstacktwo = "magenta"
	elseif craftstacktwo == "wool:orange" then
		craftstacktwo = "orange"
	elseif craftstacktwo == "wool:violet" then
		craftstacktwo = "violet"
	elseif craftstacktwo == "wool:brown" then
		craftstacktwo = "brown"
	elseif craftstacktwo == "wool:pink" then
		craftstacktwo = "pink"
	elseif craftstacktwo == "wool:dark_grey" then
		craftstacktwo = "dark_grey"
	elseif craftstacktwo == "wool:dark_green" then
		craftstacktwo = "dark_green"
	else
		craftstacktwo = "ERROR NOT WOOL"
	end
	--print(craftstacktwo)

	if craftstackone == craftstacktwo then
		give = "banner:"..craftstackone.."_square"
		--print(give)
		weave = "1"
	elseif craftstackone ~= craftstacktwo then
		give = "banner:"..craftstackone.."_"..craftstacktwo.."check_square"
		--print(give)
		weave = "1"
	else
		print("something has gone terribly wrong here")
	end
		if weave == "1" then
			inv:add_item("res",give)
			craftstack1:take_item()
			inv:set_stack("craft1",1,craftstack1)
			craftstack2:take_item()
			inv:set_stack("craft2",1,craftstack2)
		end


end
})
--Craft
minetest.register_craft({
		output = 'banner:loom_1',
		recipe = {
			{'group:wool', 'default:steel_ingot', 'group:wool'},
			{'group:wood', 'group:wool', 'group:wood'},
			{'group:wood', "", 'group:wood'},		
		},
})