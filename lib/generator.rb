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
			["wealthy/nobel",1]
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

	def self.generate_art_treasure(gp_size)

		art = { :type => "art", :descriptions => [], :value => 0}

		value_adjustment = 0

		art_value = art_value_base(roll("1d20"))
		art[:descriptions] << art_value[0]
		value_adjustment += art_value[1]

		artist = artist_reknown(roll("1d100"))
		art[:descriptions] << artist[0]
		value_adjustment += artist[1]

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