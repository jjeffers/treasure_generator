require "die"

class Treasure
	include ActiveModel::Model
	include ActiveSupport::Callbacks

  define_model_callbacks :create

  def initialize(attributes = {})
  	@descriptions = []
  	@ttype = ""
  	@value = 0
  	@container = generate_container
  	@hidden_by = generate_concealment
  	@trapped_by = generate_trap
  end

	attr_accessor :ttype, :value, :descriptions, :hidden_by, :trapped_by, :container

	def self.generate(treasure_units=hoard_size, treasure_unit_size=200)

		Rails.logger.info "Treasure units: #{treasure_units}"
		treasures = treasure_units.times.collect { generate_treasure(treasure_unit_size) }

		{ :total => treasures.inject(0) { |sum, treasure| sum + treasure.value }, 
			:treasures => treasures }

	end

	def self.generate_treasure(treasure_unit_size, roll=Die::roll("1d20"))
		case roll
		when 1
			Art.new(treasure_unit_size)
		when 2..3
			JeweledItem.new(treasure_unit_size)
		when 4..7
			Goods.new(treasure_unit_size)
		when 8..13
			Coins.new(treasure_unit_size)
		when 14..17
		 	Furnishings.new(treasure_unit_size)
		when 18..19
			Gems.new(treasure_unit_size)
		when 20
		 	Special.new(treasure_unit_size)
		end

	end

	def self.base_value_of_hoard_multiplier(roll=Die::roll("1d20"))

		case roll
		when 1
			0.01
		when 2..3
			0.10
		when 4..8
			0.25
		when 9..14
			0.5
		when 15..24
			0.75
		when 25..76
			1.0
		when 77..86
			1.5
		when 87..92
			2.0
		when 93..97
			3.0
		when 98..99
			5.0
		when 100
			10.0
		end

	end


	def self.hoard_size(roll=Die::roll("1d20"))
		case roll
		when 1
			1
		when 2..3
			Die::roll("1d6")/2
		when 4..7
			3 + (Die::roll("1d6")-2)
		when 8..13
			4+(Die::roll("1d4")-1)
		when 14..16
			6+Die::roll("1d4")
		when 17..18
			6+Die::roll("2d4")
		when 19
			6+Die::roll("3d4")
		when 20
			4*Die::roll("1d4")+2
		end

	end


	def generate_container(roll=Die::roll("1d10"))
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

	def concealed?(roll=Die::roll("1d20"))
		return roll == 1
	end

	def generate_concealment(roll=Die::roll("1d10"))
    return nil unless concealed? 
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

	def trapped?(roll=Die::roll("1d20"))
		roll -= 4 if @container.include?("chest")
		roll <= 1
	end

	def generate_trap(roll=Die::roll("1d20"))
    return nil unless trapped?
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



end