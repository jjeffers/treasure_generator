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
			["average",0]
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
			["average",0]
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
	end

	def self.generate_gems_treasure(gp_size)
	end

	def self.generate_goods_treasure(gp_size)
	end

	def self.generate_furnishings_and_clothing_treasure(gp_size)
	end

	def self.generate_special_and_magic_items_treasure(gp_size)
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

		treasure_units.times do |hoard|

			treasure_type_name = treasure_type(roll("1d20")).gsub(' ','_')
			result = self.send("generate_#{treasure_type_name}_treasure".to_sym,
				treasure_unit_size)
			
			unless result.nil?
				str = "#{result[:type]} "

				str.concat("(")
				str.concat(result[:descriptions].join(', '))
				str.concat(") worth #{result[:value]} gp")
				puts str
			end

			container = treasure_container(roll("1d10"))
			puts "\tcontained in #{container}"

			if treasure_concealed?(roll("1d20"))
				hidden_by = treasure_concealment(roll("1d10"))
				puts "\thidden by #{hidden_by}"
			end

			if treasure_trapped?(roll("1d20"))
				trapped_by = treasure_trap(roll("1d10"))
				puts "\ttrapped by #{trapped_by}"
			end

		end

	end

	module_function :generate

end