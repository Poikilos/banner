dofile(minetest.get_modpath("banner").."/crafts.lua")
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

for _, row in ipairs(dyes) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[1]
	-- Node Definition
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

minetest.register_node("banner:hanger", {
	description = "Banner Hanger",
	walkable = false,
	drawtype = "signlike",
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "banner_top.png",
	wield_image = "banner_top.png",
	paramtype2 = "wallmounted",
	selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.1, 0.5, 0.5, 0.5},
	},
	tiles = {"banner_top.png"},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
})