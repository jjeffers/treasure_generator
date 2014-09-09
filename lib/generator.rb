require "dicebag"
module Treasure

	def self.roll(str)
		DiceBag::Roll.new(str).result().total
	end

	@@treasure_types = ["art", "jeweled items", "goods", "coins", "furnishings and clothing",
		"gems", "special and magic items"]

	@@art_values = [0.001, 0.05, 0.25, 1, 10, 25, 50, 75, 100, 150, 200, 300, 400, 
		500, 750, 1000, 1500, 2000, 3000, 4000, 5000, 7500, 10000, 20000, 40000, 80000,
		150000, 250000, 400000, 800000, 1000000]

	@@gem_values = [0.001, 0.05, 0.25, 1, 25, 75, 250, 750, 2500, 10000,
		 20000, 40000, 800000, 1000000]

	def self.treasure_type(roll)
		case roll
		when 1
			@@treasure_types[0]
		when 2..3
			@@treasure_types[1]
		when 4..7
			@@treasure_types[2]
		when 8..13
			@@treasure_types[3]
		when 14..17
			@@treasure_types[4]
		when 18..19
			@@treasure_types[5]
		when 20
			@@treasure_types[6]
		end

	end

	def self.treasure_container(roll)
		case roll
		when 1
			"bags or sacks"
		when 2
			"barrels or cask"
		when 3
			"coffer or kist"
		when 4
			"chest"
		when 5
			"huge chest"
		when 6
			"trunk"
		when 7
			"urn"
		when 8
			"jar"
		when 9
			"niche"
		when 10
			"loose"
		end
	end

	def self.treasure_concealed?(roll)
		return false unless roll == 1
			
		true
	end

	def self.treasure_concealment(roll)
		case roll
		when 1..2
			"concealed"
		when 3
			"invisible"
		when 4
			"secret space under container"
		when 5
			"secret compartment"
		when 6
			"inside ordinary object in plain sight"
		when 7
			"disgiued to appear as something else"
		when 8 
			"under a heap of trash or dung"
		when 9
			"under a loose stone in the floor or wall"
		when 10
			"in a nearby secret or concealed room"
		end
	end

	def self.treasure_trapped?(roll)
		return false unless roll == 1
			
		true
	end

	def self.treasure_trap(roll)
		case roll
		when 1
			"contact poison on treasure"
		when 2
			"contact poison on container"
		when 3..4
			"poison needle in lock"
		when 5..6
			"poisoned needles in handle"
		when 7..8
			"poison spring darts in front"
		when 9..10
			"poison spring darts on top"
		when 11..12
			"poison darts spring from inside lide"
		when 13..14 
			"poisoned spring darts from inside bottom"
		when 15
			"blade scythes ascross top"
		when 16
			"poison vermin"
		when 17
			"poison gas released"
		when 18
			"trap door opens"
		when 19
			"stone block drops"
		when 20
			"magic"
		end
	end

	def self.art_treasure_type(roll)
		case roll
		when 1..2
			"paper art"
		when 3..4
			"fabric art"
		when 5..6
			"painting"
		when 7..8
			"crafts"
		when 9..10
			"carving"
		when 11..12
			"ceramics"
		when 13..14
			"glasswork"
		when 15..17
			"stonework"
		when 18..19
			"metalwork"
		when 20
			"magical"
		end
	end

	def self.art_value_base(roll)
		case roll
		when 1
			["abstract",-2]
		when 2
			["monster",-1]
		when 3
			["humanoid",0]
		when 4..5
			["natural",0]
		when 6
			["supernatural",0]
		when 7..9
			["local",0]
		when 10..12
			["historical",0]
		when 13..17
			["religious",0]
		when 18..19
			["wealthy/noble",1]
		when 20
			["royalty", 2]
		end
	end

	def self.artist_reknown(roll)
		case roll
		when 1..15
			["unknown artist",-3]
		when 16..30
			["obscure artist",-2]
		when 31..50
			["locally known artist",-1]
		when 51..70
			["regionally known artist",0]
		when 71..90
			["nationally known artist",1]
		when 91..95
			["continentally known artist",2]
		when 96..99
			["world reknown artist",3]
		when 100
			["ubiquitous artist", 4]
		end
	end

	def self.art_quality(roll)
		case roll
		when 1..5
			["awful quality",-3]
		when 5..10
			["poor quality",-2]
		when 11..25
			["below average quality",-1]
		when 26..65
			["average quality",0]
		when 66..85
			["above average quality",1]
		when 86..90
			["good quality",2]
		when 91..95
			["excellent quality",3]
		when 96..98
			["finest quality",4]
		when 99..100
			["unqique quality", 5]
		end
	end

	def self.art_age(roll)
		case roll
		when 1..10
			["avante-garde", -3]
		when 11..20
			["current", -2]
		when 21..50
			["recent", -1]
		when 51..63
			["contemporary", 0]
		when 64..73 
			["modern", 1]
		when 74..82
			["old", 2]
		when 83..90
			["antique", 3]
		when 91..95
			["venerable",4]
		when 96..97
			["archaic", 5]
		when 98..99
			["antedeluvian",6]
		when 100
			["primordial", 7]
		end
	end

	def self.art_size(roll)
		case roll
		when 1..5
			["tiny",-3]
		when 5..10
			["very small",-2]
		when 11..25
			["small",-1]
		when 26..65
			["average size",0]
		when 66..85
			["large",1]
		when 86..90
			["very large",2]
		when 91..95
			["huge",3]
		when 96..98
			["massive",4]
		when 99..100
			["guargantuan", 5]
		end
	end

	def self.art_craftmanship(roll)
		case roll
		when 1..5
			["awful craftsmanship",-3]
		when 5..10
			["poor craftsmanship",-2]
		when 11..25
			["below average craftsmanship",-1]
		when 26..65
			["average craftsmanship",0]
		when 66..85
			["above average craftsmanship",1]
		when 86..90
			["good craftsmanship",2]
		when 91..95
			["excellent craftsmanship",3]
		when 96..98
			["brilliant craftsmanship",4]
		when 99..100
			["masterpiece craftsmanship", 5]
		end
	end

	def self.art_condition(roll)
		case roll
		when 1..5
			["badly damaged",-3]
		when 5..10
			["damaged",-2]
		when 11..25
			["worn",-1]
		when 26..65
			["average condition",0]
		when 66..85
			["good condition",1]
		when 86..90
			["excellent condition",2]
		when 91..95
			["near perfect conidtion",3]
		when 96..98
			["perfect condition",4]
		when 99..100
			["flawless condition", 5]
		end
	end

	def self.generate_art_treasure(gp_size)

		art = { :type => "art", :descriptions => [], :value => 0}

		value_adjustment = 0

		art_value = art_value_base(roll("1d20"))
		art[:descriptions] << art_value[0]
		value_adjustment += art_value[1]

		artist = artist_reknown(roll("1d100"))
		art[:descriptions] << artist[0]
		value_adjustment += artist[1]

		quality = art_quality(roll("1d100"))
		art[:descriptions] << quality[0]
		value_adjustment += quality[1]

		age = art_age(roll("1d100"))
		art[:descriptions] << age[0]
		value_adjustment += age[1]

		size = art_size(roll("1d100"))
		art[:descriptions] << size[0]
		value_adjustment += size[1]

		craftsmanship = art_craftmanship(roll("1d100"))
		art[:descriptions] << craftsmanship[0]
		value_adjustment += craftsmanship[1]

		condition = art_condition(roll("1d100"))
		art[:descriptions] << condition[0]
		value_adjustment += condition[1]

		art_value_index = @@art_values.find_index(
			@@art_values.min { |a,b| (a-gp_size).abs <=> (b-gp_size).abs })
		
		art_value_index += value_adjustment
		art[:value] = @@art_values[art_value_index]

		art
	end

	def self.generate_coins_treasure(gp_size)
		coins = { :type => "coins", :descriptions => [], :value => gp_size}

		coins[:descriptions] << case roll("1d12")
		when 1..2
			"copper"
		when 3..5
			"silver"
		when 6..7
			"electrum"
		when 8..10
			"gold"
		when 11
			"hard silver"
		when 12
			"platinum"
		end

		coins
	end

	def self.gem_stone(gp_size)

		ornamental = ["banded agate", "eye agate", "moss agate", "azurite", 
			"bone", "hematite", "lapis lazuli", "malachite", "obsidian",
			"pyrite", "tiger eye", "turquoise", "mother of pearl"]

		semiprecious = ["amazon stone", "bloodstone", "carnelian", "chalcedony",
			"chrysoprase", "citrine", "jasper", "moonstone", "onyx", "rock crystal",
			"sardonyx", "serpentine", "smoky quartz", "star rose quartz", "variscite"]

		fancy = ["amber", "alamadine", "alexandrite", "amethyst", "chrysoberyl",
			"coral", "diopside", "garnet", "iocolite", "jade", "jet", "morganite",
			"nephrite", "pearl", "spinel", "spessarite", "sugulite", "rubelite",
			"tourmaline", "zircon"]

		precious = ["aquamarine", "garnet", "black pearl", "peridot", "spinel",
			"kunzite", "topaz", "tanzanite"]

		gemstones = ["black opal", "emerald", "fire opal", "garnet", "opal",
			"amethyst", "topaz", "sapphire", "star ruby", "star sapphire"]

		jewels = ["ammolite", "black sapphire", "diamond", "jacinth", "emerald",
			"ruby"]

		case gp_size
		when 1..25
			ornamental.sample(1).first
		when 26..75
			semiprecious.sample(1).first
		when 76..250
			fancy.sample(1).first
		when 251..750
			precious.sample(1).first
		when 751..2500
			gemstones.sample(1).first
		when 2501..10000
			jewels.sample(1).first
		end

	end

	def self.gem_quality(roll)
		case roll
		when 1..5
			["badly flawed", -3]
		when 6..10
			["flawed", -2]
		when 11..25
			["minor inclusions", -1]
		when 26..65
			["average quality", 0]
		when 66..85
			["good quality", 1]
		when 86..90
			["excellent quality", 2]
		when 91..95
			["nearly perfect", 3]
		when 96..98
			["perfect", 4]
		when 99..100
			["flawless", 5]
		end
	end

	def self.generate_gems_treasure(gp_size)

		value_adjustment = 0

	  gems = { :type => "gems", :descriptions => [], :value => 0}

	  gems[:descriptions] << gem_stone(gp_size)

		quality = gem_quality(roll("1d100"))
		gems[:descriptions] << quality[0]
		value_adjustment += quality[1]

		size = art_size(roll("1d100"))
		gems[:descriptions] << size[0]
		value_adjustment += size[1]

		gem_value_index = @@gem_values.find_index(
			@@gem_values.min { |a,b| (a-gp_size).abs <=> (b-gp_size).abs })
		gems[:value] = @@gem_values[gem_value_index]
		gems
	end

	def self.generate_goods_treasure(gp_size)

		goods = { :type => "goods (low and high value)", :descriptions => [], :value => gp_size}

		goods[:descriptions] << case roll("1d100")
		when 1..8
			"cotton/wool/flax"
		when 9..18
			"furs/hides/skins"
		when 19..22
			"ingots: iron/copper/tin/lead"
		when 23..26
			"lumber"
		when 27..35
			"wine/ale/beer/liquor"
		when 36..48
			"grain/foodstuffs"
		when 49..52
			"livestock/slaves"
		when 53..65
			"sugar/spices/hemp/jute/pipeweed/herbs/salt"
		when 66..69
			"dressed stone"
		when 70..73
			"cloth/fabric"
		when 74..79
			"leather goods"
		when 80..87
			"pewter/bronze/copperware/ceramics"
		when 88..95
			"wooden items"
		when 96..00
			"steel bar stock"
		end

		goods[:descriptions] << case roll("1d100")
		when 1..12
			"armor/weapons"
		when 13..16
			"coffee/tea"
		when 17..20
			"exotic fruits"
		when 21..30
			"leather/silk/fabrics"
		when 31..33
			"gold/silver/electrum/platinum bars"
		when 34..37
			"ivory"
		when 38..40
			"narcotics/medicine"
		when 41..46
			"perfumes"
		when 47..48
			"ingots, rare metals"
		when 49..50
			"rare woods"
		when 51..63
			"religious artifacts"
		when 64..85
			"scrolls/books"
		when 86..90
			"ingots, electrum/silver/gold/platinum"
		when 91..98
			"laboratory items"
		when 99-00
			"magical components"
		end

		goods
	end

	def self.generate_furnishings_and_clothing_treasure(gp_size)
		furnishings = { :type => "furnishings/clothing", :descriptions => [], :value => gp_size}

		furnishings[:descriptions] << case roll("1d100")
		when 1
			"altar"
		when 2
			"armchair"
		when 3..5
			"armoir"
		when 6
			"arras"
		when 7..10
			"bed"
		when 11..12
			"bench"
		when 13..15
			"blanket"
		when 16..17
			"box"
		when 18..19
			"brazier"
		when 20
			"bucket"
		when 21
			"buffet"
		when 22..23
			"bunks"
		when 24..25
			"cabinet"
		when 26..27
			"candelabrum"
		when 28..30
			"carpet"
		when 31
			"chandelier"
		when 32..36
			"chair"
		when 37..38
			"padded chair"
		when 39
			"padded armchair"
		when 40..42
			"chest of drawers"
		when 43..45
			"closet (wardrobe)"
		when 46
			"couch"
		when 47
			"cresset"
		when 48..49
			"cupboard"
		when 50..51
			"cushion"
		when 52
			"dais"
		when 53..56
			"desk"
		when 57
			"fountain"
		when 58
			"fresco"
		when 59..60
			"hamper"
		when 61..63
			"idol"
		when 64
			"loom"
		when 65..68
			"mat"
		when 69..70
			"mattress"
		when 71..73
			"pallet"
		when 74..75
			"pedastal"
		when 76..78
			"pillow"
		when 79..80
			"quilt"
		when 81..84
			"rug"
		when 85..86
			"screen"
		when 87..88
			"shelves"
		when 89
			"shrine"
		when 90
			"sofa"
		when 91..93
			"stool"
		when 94..96
			"table"
		when 97
			"throne"
		when 98
			"tub"
		when 99
			"wall basin"
		when 100
			"workbench"
		end

		furnishings[:descriptions] << case roll("1d100")
		when 1
			"apron"
		when 2..3
			"belt"
		when 3..5
			"blouse/chemise"
		when 6..7
			"bodkin"
		when 9
			"braies"
		when 10..11
			"buskins"
		when 12..13
			"cap"
		when 14..15
			"cape"
		when 16..17
			"caul"
		when 18..19
			"cloak"
		when 20..21
			"coat"
		when 22..23
			"coif"
		when 24..25
			"doublet"
		when 26..27
			"dress"
		when 28
			"fez"
		when 29..30
			"frock"
		when 31..32
			"garter"
		when 33..34
			"guantlets"
		when 35..36
			"girdle"
		when 37..38
			"gloves"
		when 39..40
			"gorget"
		when 41..42
			"gown"
		when 43..44
			"hat"
		when 45..46
			"habit"
		when 47..48
			"hood"
		when 49..50
			"hose"
		when 51..52
			"jerkin"
		when 53
			"jupon"
		when 54..55
			"kerchief"
		when 56
			"kirtle"
		when 57..58
			"leggins"
		when 59..60
			"linen (drawers)"
		when 61..62
			"linen (undershirt"
		when 63
			"mantle"
		when 64..65
			"pantaloons"
		when 66..67
			"pedtticoat"
		when 68..69
			"pouch/purse"
		when 70..71
			"robe"
		when 72..73
			"sandals"
		when 74..75
			"scarf"
		when 76..77
			"shawl"
		when 78..79
			"shift"
		when 80..81
			"slippers"
		when 82..83
			"smock"
		when 84..85
			"stockings"
		when 86..87
			"surcoat"
		when 88
			"toga"
		when 90..91
			"tousers"
		when 92..94
			"tunic"
		when 95..96
			"veil"
		when 97..98
			"vest"
		when 99
			"wallet"
		when 100
			"wrapper"
		end
	
		furnishings
	end

	def self.generate_special_and_magic_items_treasure(gp_size)
		special = { :type => "special/magic item", :descriptions => [], :value => gp_size}
	end

	def self.generate_jeweled_items_treasure(gp_size)

		value_adjustment = 0
		jeweled_item = { :type => "jeweled item", :descriptions => [], :value => gp_size}

		jeweled_item[:descriptions] << case roll("1d100")
		when 1..2
			"anklet"
		when 3..5
			"armband"
		when 6..7
			"small box"
		when 8..9
			"belt"
		when 10..14
			"bracelet"
		when 15..17
			"brooch"
		when 18
			"buckle"
		when 19
			"chain"
		when 20
			"chalice"
		when 21
			"choker"
		when 22
			"clasp"
		when 23
			"collar"
		when 24
			"coffer"
		when 25
			"comb"
		when 26
			"coronet"
		when 27
			"crown"
		when 28
			"decanter"
		when 29
			"diadem"
		when 30-32
			"earring"
		when 33
			"fob"
		when 34..35
			"goblet"
		when 36..37
			"headband"
		when 38
			"idol"
		when 39..40
			"locket"
		when 41
			"medal"
		when 42
			"medallion"
		when 43..45
			"necklace"
		when 46
			"pendant"
		when 47
			"pin"
		when 48
			"orb"
		when 49..53
			"ring"
		when 54
			"scepter"
		when 55
			"seal"
		when 56
			"statuette"
		when 57
			"tiara"
		when 58..59
			"mask"
		when 60
			"nose ring/stud"
		when 61..62
			"circlet"
		when 63..64
			"torc"
		when 65..67
			"utensils"
		when 68
			"chatelaine"
		when 69
			"cuff link"
		when 70
			"lapel pin"
		when 71
			"grill"
		when 72
			"bangles"
		when 73
			"body piercing"
		when 74
			"prayer beads"
		when 75
			"puzzle"
		when 76
			"aguilette"
		when 77
			"cock ring"
		when 78
			"pectoral"
		when 79
			"zerscheibe"
		when 80
			"icon"
		when 81
			"egg"
		when 82..85
			"weapon"
		when 86..89 
			"armor"
		when 90..93
			"tool"
		when 94..99
			bejewled_item_type = "coins"
			while bejewled_item_type == "coins"
				bejewled_item_type = treasure_type(roll("1d20"))
			end
			bejewled_item_type
		when 100
			"container is bejeweled"
		end

		quality = art_quality(roll("1d100"))
		jeweled_item[:descriptions] << quality[0]
		value_adjustment += quality[1]

		craftsmanship = art_craftmanship(roll("1d100"))
		jeweled_item[:descriptions] << craftsmanship[0]
		value_adjustment += craftsmanship[1]

		condition = art_condition(roll("1d100"))
		jeweled_item[:descriptions] << condition[0]
		value_adjustment += condition[1]

		value_index = @@art_values.find_index(
			@@art_values.min { |a,b| (a-gp_size).abs <=> (b-gp_size).abs })
		
		value_index += value_adjustment
		jeweled_item[:value] = @@art_values[value_index]
		jeweled_item
	end

	def generate(treasure_units=1, treasure_unit_size=200)

		treasure_units.times.collect do |hoard|

			treasure_type_name = treasure_type(roll("1d20")).gsub(' ','_')
			result = self.send("generate_#{treasure_type_name}_treasure".to_sym,
				treasure_unit_size)

			result[:container] = treasure_container(roll("1d10"))
			
			if treasure_concealed?(roll("1d20"))
				result[:hidden_by] = treasure_concealment(roll("1d10"))
				
			end

			if treasure_trapped?(roll("1d20"))
				result[:trapped_by] = treasure_trap(roll("1d10"))
			end

			result
		end

	end

	module_function :generate

end