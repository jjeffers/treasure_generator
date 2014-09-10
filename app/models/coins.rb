require "die"

class Coins < Treasure

	def initialize(value)
   super
   @ttype = "coins"
   @value = value

		value_adjustment = 0
		
		@descriptions << case Die::roll("1d12")
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

		@value = Die::random_value(@value)

	end


end
