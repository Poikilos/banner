dofile(minetest.get_modpath("banner").."/loom.lua")

local banner = {}
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

minetest.register_node("banner:hanger", {
	description = "Banner Hanger",
	walkable = false,
	sunlight_propagates = true,
	inventory_image = "banner_top.png",
	wield_image = "banner_top.png",
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375}, -- NodeBox1
		},
	},
	selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.1, 0.5, 0.5, 0.5},
	},
	tiles = {"hanger.png"},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
})
for _, row in ipairs(dyes) do
	local name2 = row[1]
	local desc2 = row[2]
	for _, row in ipairs(dyes) do
		local name = row[1]
		local desc = row[2]
		local craft_color_group = row[1]
		-- Node Definition
		if name == name2 then
			minetest.register_node("banner:"..name, {
				description = desc.." Point Banner",
				walkable = false,
				drawtype = "signlike",
				sunlight_propagates = true,
				paramtype = "light",
				inventory_image = "pointbanner_"..name..".png",
				wield_image = "pointbanner_"..name..".png",
				paramtype2 = "wallmounted",
				selection_box = {
					type = "wallmounted",
					fixed = {-0.5, -0.5, -0.1, 0.5, 0.5, 0.5},
				},
				tiles = {"pointbanner_"..name..".png"},
				groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
			})
		end
		if name ~= name2 then
			minetest.register_node("banner:"..name.."_"..name2.."check", {
				description = desc.." and "..desc2.." Checkered Point Banner",
				walkable = false,
				drawtype = "signlike",
				sunlight_propagates = true,
				paramtype = "light",
				inventory_image = "pointbanner_"..name2..".png^pointbanner_"..name.."_check.png",
				wield_image = "pointbanner_"..name2..".png^pointbanner_"..name.."_check.png",
				paramtype2 = "wallmounted",
				selection_box = {
					type = "wallmounted",
					fixed = {-0.5, -0.5, -0.1, 0.5, 0.5, 0.5},
				},
				tiles = {"pointbanner_"..name2..".png^pointbanner_"..name.."_check.png"},
				groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
			})
			minetest.register_craft({
				output = "banner:"..name.."_"..name2.."check",
				recipe = {
					{"","",""},
					{"banner:"..name,"default:stick","banner:"..name2},
					{"","",""},
				}
			})
		end
	end
end
for _, row in ipairs(dyes) do
	local name2 = row[1]
	local desc2 = row[2]
	for _, row in ipairs(dyes) do
		local name = row[1]
		local desc = row[2]
		local craft_color_group = row[1]
		-- Node Definition
		if name == name2 then
			minetest.register_node("banner:"..name.."_square", {
				description = desc.." Square Banner",
				walkable = false,
				drawtype = "signlike",
				sunlight_propagates = true,
				paramtype = "light",
				inventory_image = "squarebanner_"..name..".png",
				wield_image = "squarebanner_"..name..".png",
				paramtype2 = "wallmounted",
				selection_box = {
					type = "wallmounted",
					fixed = {-0.5, -0.5, -0.1, 0.5, 0.5, 0.5},
				},
				tiles = {"squarebanner_"..name..".png"},
				groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
			})
		end
		if name ~= name2 then
			minetest.register_node("banner:"..name.."_"..name2.."check_square", {
				description = desc.." and "..desc2.." Checkered Square Banner",
				walkable = false,
				drawtype = "signlike",
				sunlight_propagates = true,
				paramtype = "light",
				inventory_image = "squarebanner_"..name2..".png^squarebanner_"..name.."_check.png",
				wield_image = "squarebanner_"..name2..".png^squarebanner_"..name.."_check.png",
				paramtype2 = "wallmounted",
				selection_box = {
					type = "wallmounted",
					fixed = {-0.5, -0.5, -0.1, 0.5, 0.5, 0.5},
				},
				tiles = {"squarebanner_"..name2..".png^squarebanner_"..name.."_check.png"},
				groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
			})
			minetest.register_craft({
				output = "banner:"..name.."_"..name2.."check_square",
				recipe = {
					{"","",""},
					{"banner:"..name.."_square","default:stick","banner:"..name2.."_square"},
					{"","",""},
				}
			})
		end
	end
end
for _, row in ipairs(dyes) do
	local name = row[1]
	local desc = row[2]
	minetest.register_craft({
		output = "banner:"..name.." 7",
		recipe = {
			{"wool:"..name,"wool:"..name,"wool:"..name},
			{"wool:"..name,"wool:"..name,"wool:"..name},
			{"","wool:"..name,""},
		}
	})
end
for _, row in ipairs(dyes) do
	local name = row[1]
	local desc = row[2]
	minetest.register_craft({
		output = "banner:"..name.."_square 7",
		recipe = {
			{"wool:"..name,"wool:"..name,"wool:"..name},
			{"wool:"..name,"wool:"..name,"wool:"..name},
			{"wool:"..name,"","wool:"..name},
		}
	})
end
minetest.register_craft({
	output = "banner:hanger 7",
	recipe = {
		{"","default:steel_ingot",""},
		{"default:stick","default:stick","default:stick"},
		{"","",""},
	}
})