require "die"

class Goods < Treasure

	def initialize(value)
   super
   @ttype = "goods (low and high value)"
   @value = value

		value_adjustment = 0
		
		@descriptions << low_value_good_type
		@descriptions << high_value_good_type

		@value = Die::random_value(@value)

	end

	def low_value_good_type(roll=Die::roll("1d100"))

		case roll
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
		when 96..100
			"steel bar stock"
		end

	end

	def high_value_good_type(roll=Die::roll("1d100"))

		case roll
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
		when 99..100
			"magical components"
		end
	end

end
