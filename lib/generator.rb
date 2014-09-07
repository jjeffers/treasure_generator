require "dicebag"
module Treasure

	def self.roll(str)
		DiceBag::Roll.new(str).result().total
	end

	@@treasure_types = ["art", "jeweled items", "goods", "coins", "furnishings and clothing",
		"gems", "special and magic items"]

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

	def generate(treasure_units=1, treasure_unit_size=200)

		treasure_units.times do |hoard|

			treasure_type = treasure_type(roll("1d20"))
			puts treasure_type
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