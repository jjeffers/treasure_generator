require "dicebag"
require "simple-random"

module Treasure2

	def self.roll(str)
		DiceBag::Roll.new(str).result().total
	end

	@@treasure_types = ["art", "jeweled items", "goods", "coins", "furnishings and clothing",
		"gems", "special and magic items"]


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



	def self.generate_special_and_magic_items_treasure(gp_size)
		special = { :type => "special/magic item", :descriptions => [], :value => gp_size}
	end

	

	

	module_function :generate

	def hoard_size
		case roll("1d20")
		when 1
			1
		when 2..3
			roll("1d6")/2
		when 4..7
			3 + (roll("1d6")-2)
		when 8..13
			4+(roll("1d4")-1)
		when 14..16
			6+roll("1d4")
		when 17..18
			6+roll("2d4")
		when 19
			6+roll("3d4")
		when 20
			4*roll("1d4")+2
		end

	end

	module_function :hoard_size

end